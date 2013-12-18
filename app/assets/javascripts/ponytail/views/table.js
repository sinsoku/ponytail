Ponytail.Views.TableView = Backbone.View.extend({
  className: "pt_table",
  events: {
    "click .pt_table_name span": "toggleTableName",
    "keyup .pt_table_name input": function(e) { this.model.set({name: e.target.value}); },
    "blur .pt_table_name input": "toggleTableName",
  },
  initialize: function(options) {
    _.bindAll(this, "render");
    this.model.bind("change", this.render);
  },
  render: function() {
    if (this.el.parentNode === null) {
      $(this.el).html(_.template($("#table_view_template").html(), this.model.attributes));
    } else {
      $(this.el).find(".pt_table_name span").text(this.model.get("name"));
    }
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
