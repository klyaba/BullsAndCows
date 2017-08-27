<%--
  Created by IntelliJ IDEA.
  User: klyab
  Date: 24.08.2017
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<html>

<head>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.17/angular.min.js"></script>
</head>

<body ng-app="myapp">

<div ng-controller="HelloController">
    <input ng-model="name" type="text" placeholder="name"><br>
    Hi, {{name}}! <br>
    Number of attempts: {{model.attempts}}<br>
    Gussed number: {{model.numbers[1]}}<br>
    First number:<label ng-repeat="digit in model.firstDigit" ng-click="model.number[0]=digit">{{digit}} </label><br>
    Second number:<label ng-repeat="digit in model.secondDigit" ng-click="model.number[1]=digit">{{digit}} </label><br>
    Third number:<label ng-repeat="digit in model.thirdDigit" ng-click="model.number[2]=digit">{{digit}} </label><br>
    Fourth number:<label ng-repeat="digit in model.fourthDigit" ng-click="model.number[3]=digit">{{digit}} </label><br>
    <label ng-repeat="digit in model.number">{{digit}}</label><br>
    <button ng-click="try()">Try </button>
    <ul>
        <li ng-repeat="number in numbers">{{number}}</li>
    </ul><br>
    <label>{{model.numbers[0]}}</label>
    <label>{{model.numbers[1]}}</label>
    <label>{{model.numbers[2]}}</label>
</div>

<script>
    angular.module("myapp", [])

        .controller("HelloController", function ($scope) {
            var arr = [
                Math.floor(Math.random() * 10),
                Math.floor(Math.random() * 10),
                Math.floor(Math.random() * 10),
                Math.floor(Math.random() * 10)];
            var str = arr.join("");
            $scope.model = {
                attempts: 0,
                bulls: 0,
                cows: 0,
                number: [0, 0, 0, 0],
                numbers: ["0000", str],
                firstDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                secondDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                thirdDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                fourthDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            }

            $scope.try = function (number) {
                $scope.model.attempts++;
                var snum = $scope.number.join("");
                $scope.numbers.push(snum);
            }
        });
</script>

</body>
</html>
