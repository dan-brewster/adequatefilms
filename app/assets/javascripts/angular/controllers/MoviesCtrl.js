app.controller('MoviesCtrl', ['$scope', '$resource', function($scope, $resource) {
  var Movie = $resource('/movie/list', {});
  var UserMovie = $resource('/user_movie', {});
  var UserMovies = $resource('/user_movie/:id', {id: "@id"});
  var User = $resource('/user/:id', {id: "@id"})

  // what is the right way to organize this file?

  $scope.movies = Movie.query(fixMovies);
  $scope.user = User.get({id: 1});
  $scope.isHiding = false;
  $scope.usermovies = UserMovies.query(1);
  var currentYear = null, currentLength = null;

  $scope.refreshMovies = function() {
    $scope.movies = Movie.query(fixMovies);
  };

  var fixMovies = function(movies) {
    movies.forEach(function(movie) {
      movie.title = movie.title.split(",").reverse().join(" ");
    });
  };

  $scope.starWidth = function(rating, sizer) {
    if (_.isUndefined(sizer)) {
      sizer = 14;
    }
    return { width: Math.round(rating * sizer) + "px" };
  };

  $scope.getCurrentYear = function() {
    return !_.isNull(currentYear) ? "(" + currentYear + ")": '';
  };

  $scope.getCurrentLength = function() {
    return !_.isNull(currentLength) ? "(" + currentLength + ")" : '';
  };

  $scope.makeBarChart = function(value, key) {
    if (key == "year") {
      return { width: (_.filter($scope.usermovies, function(um) { return um.movie.pub_date.substring(0,4) == value } ).length * 5) + "px" };
    } else if (key == "length") {
      return { width: (_.filter($scope.usermovies, function(um) { return um.movie.length == value } ).length * 5) + "px" };
    }
  };

  $scope.lengthStyle = function(length) {
    if (length < 80) {
      return "short-movie";
    } else if (length < 120) {
      return "med-movie";
    } else {
      return "long-movie";
    }
  };

  $scope.boldStyle = function(value, key) {
    if (key == "year") {
      return value == currentYear ? 'boldSelector' : ''
    } else if (key == "length") {
      return value == currentLength ? 'boldSelector' : ''
    }
  };

  $scope.displayMovieBox = function(movie) {
    return !_.contains($scope.user_movies, movie.id);
  };

  $scope.displayMovie = function(movie) {
    abc = !$scope.isHiding || !_.contains($scope.user_movies, movie.id);
    return abc;
  };

  $scope.setCurrentYear = function(year) {
    if (_.isNull(currentYear) || year != currentYear) {
      currentYear = year;
    } else {
      currentYear = null;
    }
  };

  $scope.setCurrentLength = function(length) {
    if (_.isNull(currentLength) || length != currentLength) {
      currentLength = length;
    } else {
      currentLength = null;
    }
  };

  $scope.yearFilterFn = function(movie) {
    return _.isNull(currentYear) || currentYear == movie.movie.pub_date.substring(0,4);
  };

  $scope.lengthFilterFn = function(movie) {
    return _.isNull(currentLength) || currentLength == movie.movie.length;
  };

  $scope.hideWhatIveSeen = function(movie_ids, user) {
    $scope.isHiding = !$scope.isHiding;
  };

  $scope.seeMovieDetails = function(movie) {
    //console.log('uh oh');
  };
  //
  // $scope.createUserMovie = function(attr) {
  //   console.log("attr", attr);
  //   UserMovie.save(attr);
  //   return false;
  // };

  $scope.updateUserMovieMapping = function() {
    UserMovie.query({id: 1}, function(movies) {
      movie_objs = _.pluck(movies, 'movie');
      $scope.user_movies = _.pluck(movie_objs, 'id');
    });
  };
  $scope.updateUserMovieMapping();

  $scope.addUserMovie = function(attr) {
    console.log(attr);
    UserMovie.save(attr);
    $scope.updateUserMovieMapping();
    return false;
  };

  $scope.deleteMovie = function(idx) {
    $scope.movies.splice(idx, 1);
    return false;
  };

  $scope.deleteUserMovie = function(idx) {
    UserMovies.delete({id: idx});
    $scope.usermovies.splice(_.indexOf($scope.usermovies, _.where($scope.usermovies,{id: idx})[0]), 1);
    return false;
  };
}]);

app.filter("unique", function() {
  return function(data, propertyName) {
    results = [];
    _.each(data, function(d) {
      if(_.indexOf(results, d[propertyName]) == -1) {
        results.push(d[propertyName]);
      };
    });
    return results;
  }
});

app.filter("nestedUnique", function() {
  return function(data, propertyName, innerPropertyName) {
    results = [];
    _.each(data, function(d) {
      if(_.indexOf(results, d[propertyName][innerPropertyName]) == -1) {
        results.push(d[propertyName][innerPropertyName]);
      };
    });
    return results;
  }
});

app.filter("trunc", function() {
  return function(data, takeChars) {
    results = [];
    _.each(data, function(d) {
      if (_.isString(d)) {
        results.push(d.substring(0,takeChars));
      }
    });
    return results;
  }
});
