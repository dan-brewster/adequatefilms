app.controller('HomeCtrl', ['$scope', '$resource', function($scope, $resource) {
  var Updates = $resource('/home/recent_updates');
  $scope.updates = Updates.query(function(response) {
  
  });

  $scope.getMovieInfo = function(update_id) {
    $scope.movie[id] = Movie.find_from_update_id(update_id);
  };

}]);
