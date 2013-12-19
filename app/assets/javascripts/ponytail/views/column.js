Ponytail.Views.ColumnView = Backbone.View.extend({
  events: {
    "click .pt_column_type span": "toggleColumnType",
    "keyup .pt_column_type input": function(e) { this.model.set({type: e.target.value}); },
    "blur .pt_column_type input": "toggleColumnType",
    "click .pt_column_name span": "toggleColumnName",
    "keyup .pt_column_name input": function(e) { this.model.set({name: e.target.value}); },
    "blur .pt_column_name input": "toggleColumnName",
  },
  initialize: function(options) {
    _.bindAll(this, "render");
    this.model.bind("change", this.render);
  },
  render: function() {
    if (this.el.parentNode === null) {
      $(this.el).html(_.template($("#column_view_template").html(), this.model.attributes));
    } else {
      $(this.el).find(".pt_column_type span").text(this.model.get("type"));
      $(this.el).find(".pt_column_name span").text(this.model.get("name"));
    }
    return this;
  },
  toggleColumnType: function() {
    $(this.el).find(".pt_column_type span").toggle();
    $(this.el).find(".pt_column_type input").toggle();
  },
  toggleColumnName: function() {
    $(this.el).find(".pt_column_name span").toggle();
    $(this.el).find(".pt_column_name input").toggle();
  }
});
