Ponytail.Models.Table = Backbone.Model.extend({
  defaults: {
    name: "",
    isDrop: false,
    isSaved: false,
    columns: []
  },
  initialize: function(attrs, options) {
  },
});
