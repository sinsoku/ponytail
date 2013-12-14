describe("NewMigrationView", function() {
  describe("#constructor", function() {
    var init;
    beforeEach(function() {
      init = NewMigrationView.prototype.init;
      spyOn(NewMigrationView.prototype, "init");
    });
    afterEach(function() {
      NewMigrationView.prototype.init = init;
    });

    it("should be able to initialize without init", function() {
      var view = new NewMigrationView({init: false});
      expect(view.init).not.toHaveBeenCalled();
    });
  });
});
