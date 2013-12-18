Ponytail.Views.TableView = Backbone.View.extend({
  className: "pt_table",
  events: {
    "click .pt_table_name span": "toggleTableName",
    "blur .pt_table_name input": function() { this.updateTableName(); this.toggleTableName(); },
  },
  initialize: function(options) {
  },
  render: function() {
    $(this.el).html(_.template($("#table_view_template").html(), this.model.attributes));
    return this;
  },
  updateTableName: function() {
    var v = $(this.el).find(".pt_table_name input")[0].value;
    $(this.el).find(".pt_table_name span").text(v);
    this.model.set({name: v});
  },
  toggleTableName: function() {
    $(this.el).find(".pt_table_name span").toggle();
    $(this.el).find(".pt_table_name input").toggle();
  },
});
