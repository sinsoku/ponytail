Ponytail.Models.Column = Backbone.Model.extend({
  defaults: {
    isRemoved: false,
    isSaved: false,
  },
  initialize: function(attrs, options) {
    console.log(attrs);
  },
});
