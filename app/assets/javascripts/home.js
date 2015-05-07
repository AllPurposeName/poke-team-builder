if(window.location.pathname === '/') {

  var app = angular.module('pokemonApp', []);


  app.service("BackendService", function($http){
    this.getStats = function(id){
      return $http({
        url: '/api/v1/pokemon.json',
             method: "GET",
             params: {pokemon_id: id}
      });
    }
  });


  app.controller("homeController", function($scope, BackendService){

    $scope.showStats = function(id){
    $scope.shownId = id
    console.log(id)
    BackendService.getStats(id)
    .then(function(success) {
      data = success.data
      console.log(data)
    });

    }
    $scope.hello = "hello";
    $scope.shownId = 'nothing';
    $scope.isShown = function(id) {
      return $scope.shownId == id;
    }
  });
}

if(window.location.pathname === '/team') {

  var app = angular.module('pokemonApp', []);


  app.service("BackendService", function($http){
    this.getStats = function(id){
      return $http({
        url: '/api/v1/pokemon.json',
             method: "GET",
             params: {pokemon_id: id}
      });
    }
  });


  app.controller("homeController", function($scope, BackendService){

    $scope.showStats = function(id){
    $scope.shownId = id
    console.log(id)
    BackendService.getStats(id)
    .then(function(success) {
      data = success.data
      console.log(data)
    });

    }
    $scope.hello = "hello";
    $scope.shownId = 'nothing';
    $scope.isShown = function(id) {
      return $scope.shownId == id;
    }
  });
}
