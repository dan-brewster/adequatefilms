app.factory('Movie', ['$resource', function($resource) {
  function Movie() {
    this.service = $resource('/movie/:movieId', {movieId: '@id'});
  };
  Movie.prototype.all = function() {
    return this.service.query();
  };
  Movie.prototype.find_from_update_id = function(id) {
    return this.service.query(id);
  };
  return new Movie;
}]);
