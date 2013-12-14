describe("TableView", function() {
  describe("#constructor", function() {
    var init;
    beforeEach(function() {
      init = TableView.prototype.init;
      spyOn(TableView.prototype, "init");
    });
    afterEach(function() {
      TableView.prototype.init = init;
    });

    it("should be able to initialize without init", function() {
      var view = new TableView({init: false});
      expect(view.init).not.toHaveBeenCalled();
    });
  });
});
