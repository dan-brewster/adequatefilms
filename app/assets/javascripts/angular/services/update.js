app.factory('Update', ['$resource', function($resource) {
  function Update() {
    this.service = $resource('/home/update/:updateId', {updateId: '@id'});
  };
  Update.prototype.all = function() {
    return this.service.query();
  };
  Update.prototype.find_from_update_id = function(id) {
    return this.service.query(id);
  };
  return new Update;
}]);
