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
            trueNumber: [
                Math.floor(Math.random() * 10),
                Math.floor(Math.random() * 10),
                Math.floor(Math.random() * 10),
                Math.floor(Math.random() * 10)],
            firstDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
            secondDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
            thirdDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
            fourthDigit: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        }

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