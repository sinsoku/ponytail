Ponytail.Views.TableView = Backbone.View.extend({
  className: "pt_table",
  events: {
  },
  initialize: function(options) {
  },
  render: function() {
    $(this.el).html(_.template($("#table_view_template").html(), this.model.attributes));
    return this;
  },
});
