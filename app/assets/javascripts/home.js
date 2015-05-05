if(window.location.pathname === '/') {

  var app = angular.module('pokemonApp', []);

  app.controller("homeController", function($scope, $http){

    $scope.showStats = function(id){
      console.log(id)
    }
    $scope.hello = "hello";
  });
}
