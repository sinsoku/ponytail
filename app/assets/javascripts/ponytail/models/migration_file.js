Ponytail.Models.MigrationFile = Backbone.Model.extend({
  defaults: {
    className: "",
    rawContent: "",
  },
  initialize: function(attrs, options) {
  },
  update: function() {
    console.log(this.get("tables"));
  }
});
