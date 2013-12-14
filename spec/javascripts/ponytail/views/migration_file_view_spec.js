describe("MigrationFileView", function() {
  describe("#constructor", function() {
    var init;
    beforeEach(function() {
      init = MigrationFileView.prototype.init;
      spyOn(MigrationFileView.prototype, "init");
    });
    afterEach(function() {
      MigrationFileView.prototype.init = init;
    });

    it("should be able to initialize without init", function() {
      var view = new MigrationFileView({init: false});
      expect(view.init).not.toHaveBeenCalled();
    });
  });
});
