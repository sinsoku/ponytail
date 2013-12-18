Ponytail.Views.MigrationFileView = Backbone.View.extend({
  events: {
    "click .pt_edit_checkbox input": "toggleRawContent",
    "click .pt_submit": function() { this.setRawContentEnabled(true); },
    "keyup .pt_class_name input": function(e) { this.model.set({className: e.target.value}); },
  },
  initialize: function(options) {
    _.bindAll(this, "render");
    this.model.bind("change", this.render);
  },
  render: function() {
    $(".pt_raw_content textarea").text(this.model.get("rawContent"));
  },
  toggleRawContent: function() {
    this.setRawContentEnabled($(".pt_raw_content textarea").attr("disabled"));
  },
  setRawContentEnabled: function(enabled) {
    if (enabled) {
      $(".pt_raw_content textarea").removeAttr("disabled");
    } else {
      $(".pt_raw_content textarea").attr("disabled", "disabled");
    }
  },
});
