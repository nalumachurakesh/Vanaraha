'use strict';

// Demonstrate how to register services
// In this case it is a simple value service.
angular.module('app.services', [])
       .factory('appService', ['$window', '$http', function ($window, $http) {
           return {
               GetTopics: function () {
                   return $http.get('/VanarahaAPI/api/Topic/Get');
               },
               GetItemsLinks: function (itemId) {
                   return $http.get('/VanarahaAPI/api/Item', {
                       id: itemId
                   });
               }
           }
       }])
       .value('version', '0.1');