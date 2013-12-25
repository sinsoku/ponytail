Ponytail.Views.ColumnView = Backbone.View.extend({
  className: 'pt_column',
  events: {
    "click .pt_column_type span": "toggleColumnType",
    "blur .pt_column_type select": "changeColumnType",
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
    $(this.el).find(".pt_column_type option[value='" + this.model.get("type") + "']").attr("selected", true);
    return this;
  },
  toggleColumnType: function() {
    $(this.el).find(".pt_column_type span").toggle();
    $(this.el).find(".pt_column_type select").toggle();
  },
  changeColumnType: function(e) {
    this.model.set({type: e.target.value});
    this.toggleColumnType();
  },
  toggleColumnName: function() {
    $(this.el).find(".pt_column_name span").toggle();
    $(this.el).find(".pt_column_name input").toggle();
  }
});
