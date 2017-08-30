<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: klyab
  Date: 23.08.2017
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="game">
<head>
    <title>Game</title>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <%--<script src="<spring:url value="/resources/js/controller.js" />"></script>--%>
</head>
<body>
<%--Загаданное число: ${number}--%>
<a href="<c:url value="/j_spring_security_logout" />">logout</a>
<a href="<spring:url value="/profile" />">Back</a>
<div ng-init="init()" ng-controller="gameController">

    Число попыток: {{model.attempts}} <br>
    <label ng-show="!model.winFlag"> Загаданное число: <label
            ng-repeat="digit in model.trueNumber">{{digit}}</label></label><br>
    <label ng-show="!model.winFlag">Первая цифра:<label ng-repeat="digit in model.firstDigit"
                                                        ng-click="click(0, digit)">{{digit}} </label></label><br>
    <label ng-show="!model.winFlag">Вторая цифра:<label ng-repeat="digit in model.secondDigit"
                                                        ng-click="click(1, digit)">{{digit}} </label></label><br>
    <label ng-show="!model.winFlag">Третья цифра:<label ng-repeat="digit in model.thirdDigit"
                                                        ng-click="click(2, digit)">{{digit}} </label></label><br>
    <label ng-show="!model.winFlag">Четвертая цифра:<label ng-repeat="digit in model.fourthDigit"
                                                           ng-click="click(3, digit)">{{digit}} </label></label><br>
    <button ng-show="!model.winFlag" ng-click="try()">Попробовать число:</button>
    <label ng-show="!model.winFlag" ng-repeat="digit in model.number">{{digit}} </label><br>
    <label ng-show="model.uniqueFlag || !model.difFlag || model.winFlag">{{model.message}}</label><br>
    <button ng-show="model.winFlag" ng-click="restart()">Заново</button>
    <br>

    <table class="table" ng-show="model.firstTryFlag">
        <thead>
        <tr>
            <th>Attempt</th>
            <th>Guess</th>
            <th>Result</th>
        </tr>
        </thead>
        <tr ng-repeat="number in model.numbers">
            <td>{{$index + 1}}</td>
            <td>{{number.num}}</td>
            <td>{{number.res}}</td>
        </tr>
    </table>


</div>

<script>
    angular.module("game", [])

        .controller("gameController", function ($scope, $http) {
            $scope.model = {
                attempts: 0,
                bulls: 0,
                cows: 0,
                numbers: [{num: "", res: ""}],
                number: [0, 0, 0, 0],
                result: "Неверно",
                message: "Новая игра",
                firstTryFlag: false,
                uniqueFlag: false,
                difFlag: true,
                winFlag: false,
                trueNumber: [],
                firstDigit: [],
                secondDigit: [],
                thirdDigit: [],
                fourthDigit: []
            }

            $scope.init = function () {
                var i;
                var temp = [];
                for (i = 0; i < 10; i++) {
                    temp[i] = $scope.model.firstDigit[i] = $scope.model.secondDigit[i] = $scope.model.thirdDigit[i] = $scope.model.fourthDigit[i] = i;

                }
                temp.sort(function () {
                    return 0.5 - Math.random()
                });
                for (i = 0; i < 4; i++) {
                    $scope.model.trueNumber[i] = temp[i];
                    $scope.model.number[i] = 0;
                }
            }

            $scope.restart = function () {
                $scope.model.winFlag = false;
                $scope.model.firstTryFlag = false;
                $scope.model.attempts = 0;

                $scope.model.numbers.splice(0, $scope.model.numbers.length, {
                    num: "",
                    res: ""
                });

                $scope.init();
            }

            $scope.click = function (position, digit) {
                $scope.model.number[position] = digit;
            }

            $scope.try = function () {
                $scope.model.difFlag = true;
                $scope.model.uniqueFlag = false;

//                Проверка на неповторяемость цифр в числе
                var i, j;
                for (i = 1; i < 4; i++) {
                    for (j = i - 1; j >= 0; j--) {
                        if ($scope.model.number[i] == $scope.model.number[j]) {
                            $scope.model.difFlag = false;
                            $scope.model.message = "Цифры не должны повторяться";
                            break;
                        }
                    }
                    if ($scope.model.difFlag == false) {
                        break;
                    }
                }

//              Проверка на неповторяемость чисел
//              В первый раз не выполняется
                if ($scope.model.firstTryFlag) {
                    var k;
                    for (k = 0; k < $scope.model.numbers.length; k++) {
                        if (parseInt($scope.model.number.join("")) == parseInt($scope.model.numbers[k].num)) {
                            $scope.model.uniqueFlag = true;
                            $scope.model.message = "Это число уже было";
                            break;
                        }
                    }
                }

                if (!$scope.model.uniqueFlag) {
                    if ($scope.model.difFlag) {
                        $scope.model.attempts++;

                        $scope.model.bulls = 0;
                        $scope.model.cows = 0;
                        var i, j;
//                            Подсчет быков и коров
                        for (i = 0; i < 4; i++) {
                            for (j = 0; j < 4; j++) {
                                if ($scope.model.number[i] == $scope.model.trueNumber[j]) {
                                    if (i == j) {
                                        $scope.model.bulls++;
                                        break;
                                    }
                                    else {
                                        $scope.model.cows++;
                                        break;
                                    }
                                }
                            }
                        }

                        if (!$scope.model.firstTryFlag) {
                            $scope.model.numbers.splice(0, 1, {
                                num: $scope.model.number.join(""),
                                res: $scope.model.bulls + "B" + $scope.model.cows + "C"
                            });
                            $scope.model.firstTryFlag = true;
                        }
                        else {
                            $scope.model.numbers.splice($scope.model.numbers.length, 0, {
                                num: $scope.model.number.join(""),
                                res: $scope.model.bulls + "B" + $scope.model.cows + "C"
                            });
                        }

                        if ($scope.model.bulls == 4) {
                            $scope.model.winFlag = true;
                            $scope.model.message = "Угадано";
                        }
                    }
                }
            }

        })
</script>
</body>
</html>
