'use strict';

// Google Analytics Collection APIs Reference:
// https://developers.google.com/analytics/devguides/collection/analyticsjs/

angular.module('app.controllers', [])

    // Path: /
    .controller('testController', ['$scope', '$location', '$window', 'appService', '$filter', function ($scope, $location, $window, appService, $filter) {
        appService.GetTopics()
                  .success(function (data, status) {
                      debugger;
                      $scope.topics = data;
                      $scope.selectedItem1 = data[0].Items[0].Id;
                      $scope.selectedItem2 = data[0].Items[1].Id;
                      $scope.selectedItem3 = data[0].Items[2].Id;

                      $scope.grid1ItemSelected();
                      $scope.grid2ItemSelected();
                      $scope.grid3ItemSelected();

                      setTimeout(function () {
                          $(".chosen-select").chosen();
                      }, 200);
                  })
                  .error(function (data, status) {

                  });

        var hasValue = false;
        $scope.grid1ItemSelected = function (e) {
            debugger;
            hasValue = false;
            angular.forEach($scope.topics, function (topic, index) {
                if (!hasValue) {
                    $scope.items = topic.Items;
                    angular.forEach($scope.items, function (item, index) {
                        if (item.Id == $scope.selectedItem1) {
                            hasValue = true;
                            $scope.grid1ItemLinks = item.ItemLinks;
                        }
                    });
                }
            });
        };

        $scope.grid2ItemSelected = function () {
            hasValue = false;
            angular.forEach($scope.topics, function (topic, index) {
                if (!hasValue) {
                    $scope.items = topic.Items;
                    angular.forEach($scope.items, function (item, index) {
                        if (item.Id == $scope.selectedItem2) {
                            hasValue = true;
                            $scope.grid2ItemLinks = item.ItemLinks;
                        }
                    });
                }
            });
        };

        $scope.grid3ItemSelected = function () {
            hasValue = false;
            angular.forEach($scope.topics, function (topic, index) {
                if (!hasValue) {
                    $scope.items = topic.Items;
                    angular.forEach($scope.items, function (item, index) {
                        if (item.Id == $scope.selectedItem3) {
                            hasValue = true;
                            $scope.grid3ItemLinks = item.ItemLinks;
                        }
                    });
                }
            });
        };

        $scope.updateItems = function (gridPos) {
            var itemId = 0;
            switch (gridPos) {
                case 1:
                    itemId = $scope.selectedItem1;
                    break;
                case 2:
                    itemId = $scope.selectedItem2;
                    break;
                default:
                    itemId = $scope.selectedItem3;
                    break;
            };

            appService.GetItemsLinks(itemId)
                      .success(function (data, status) {
                          debugger;
                      })
                      .error(function (data, status) {

                      });
        };

    }]);