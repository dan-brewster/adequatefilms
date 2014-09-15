app.controller('UserMoviesCtrl', ['$scope', '$resource', function($scope, $resource) {
  var UserMovie = $resource('/user_movie/:id', {id: "@id"});

  $scope.usermovies = UserMovie.query(1);
  //console.log($scope.movies);

  $scope.starWidth = function(rating) {
    return { width: Math.round(rating * 14) + "px" };
  };

  $scope.createUserMovie = function(attr) {
    console.log("attr", attr);
    UserMovie.save(attr);
    return false;
  };
}]);
