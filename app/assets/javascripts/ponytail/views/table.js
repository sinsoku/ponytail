Ponytail.Views.TableView = Backbone.View.extend({
  className: "pt_table",
  events: {
    "click .pt_table_name span": "toggleTableName",
    "keyup .pt_table_name input": function(e) { this.model.set({name: e.target.value}); },
    "blur .pt_table_name input": "toggleTableName",
    "click .pt_drop_table": function() { this.model.set({isDrop: true}); return false; },
  },
  initialize: function(options) {
    _.bindAll(this, "render");
    this.model.bind("change", this.render);
    var table = this.model;
    var columns = [];
    _.each($(this.el).find(".pt_column"), function(elem) {
      var type = $(elem).find(".pt_column_type span").text();
      var name = $(elem).find(".pt_column_name span").text();
      var m = new Ponytail.Models.Column({table: table, type: type, name: name});
      new Ponytail.Views.ColumnView({el: elem, model: m}).render();
      columns.push(m);
    });
    this.model.set({columns: columns}, {silent: true});
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
