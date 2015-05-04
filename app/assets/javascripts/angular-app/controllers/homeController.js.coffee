angular.module('app.pokemonApp').controller("HomeController", [
    '$scope',
    ($scope)->
    console.log 'HomeController running'

    $scope.exampleValue = "Hello angular and rails"
    ])
