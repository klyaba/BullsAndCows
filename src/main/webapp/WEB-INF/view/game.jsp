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
<div ng-controller="gameController">

    <button ng-show="model.flag" ng-click="restart()">{{model.message}}</button>
    <br>
    Число попыток: {{model.attempts}} <br>
    Загаданное число: <label ng-repeat="digit in model.trueNumber">{{digit}}</label><br>
    Первая цифра:<label ng-repeat="digit in model.firstDigit" ng-click="click(0, digit)">{{digit}} </label><br>
    Вторая цифра:<label ng-repeat="digit in model.secondDigit" ng-click="click(1, digit)">{{digit}} </label><br>
    Третья цифра:<label ng-repeat="digit in model.thirdDigit" ng-click="click(2, digit)">{{digit}} </label><br>
    Четвертая цифра:<label ng-repeat="digit in model.fourthDigit" ng-click="click(3, digit)">{{digit}} </label><br>
    <button ng-click="try()">Попробовать число:</button>
    <label ng-repeat="digit in model.number">{{digit}} </label><br>
    <label ng-show="model.uniqueFlag">Число повторяется</label><br>

    <label ng-show="model.firstTryFlag">{{model.result}}</label><br>
    <label ng-show="model.firstTryFlag">Bulls: {{model.bulls}}</label>
    <label ng-show="model.firstTryFlag">Cows: {{model.cows}}</label><br>

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
                test: 0,
                attempts: 0,
                bulls: 0,
                cows: 0,
                lines: [],
                numbers: [{num: "0000", res: ""}],
                number: [0, 0, 0, 0],
                result: "Неверно",
                message: "Новая игра",
                firstTryFlag: false,
                uniqueFlag: false,
                trueNumber: [0, 0, 0, 0],
                firstDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                secondDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                thirdDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                fourthDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            }

           $scope.init = function () {
               var i, j, temp;
               var fSem = false;
               $scope.model.trueNumber[0] = Math.floor(Math.random() * 10);
               for (i = 1; i < 4; i++) {
                   while (!fsem) {
                       temp = Math.floor(Math.random() * 10);
                       for (j = i - 1; j >= 0; j--) {
                           if (temp == $scope.model.trueNumber[j]) {
                               fSem = false;
                               break
                           }
                           else {
                               fSem = true;
                           }
                       }
                   }

               }
           }
            init();

            $scope.click = function (position, digit) {
                $scope.model.number[position] = digit;
            }

            $scope.try = function () {
                $scope.model.uniqueFlag = false;
                if ($scope.model.firstTryFlag) {
                    var k;
                    for (k = 0; k < $scope.model.numbers.length; k++) {
                        if (parseInt($scope.model.number.join("")) == parseInt($scope.model.numbers[k].num)) {
                            $scope.model.uniqueFlag = true;
                        }
                    }
                }

                if (!$scope.model.uniqueFlag) {
                    $scope.model.attempts++;

                    $scope.model.bulls = 0;
                    $scope.model.cows = 0;
                    var i, j;
                    for (i = 0; i < 4; i++) {
                        for (j = 0; j < 4; j++) {
                            if ($scope.model.number[i] == $scope.model.trueNumber[j]) {
                                if (i == j) {
                                    $scope.model.bulls++;
                                }
                                else {
                                    $scope.model.cows++;
                                }
                            }
                        }
                    }
                    if ($scope.model.bulls == 4) {
                        $scope.model.result = "Верно";
                        $scope.model.message = "Сыграть заново";
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
                }
            }

        })
</script>
</body>
</html>
