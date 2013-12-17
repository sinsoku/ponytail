Ponytail.Models.Table = Backbone.Model.extend({
  defaults: {
    isDrop: false,
    isSaved: false,
    columns: []
  },
  initialize: function(attrs, options) {
    console.log(attrs);
  },
});
