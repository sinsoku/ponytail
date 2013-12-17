window.Ponytail = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
};

function setupIndex() {
  $(".pt_close_notice").click(function() {
    $(".pt_notice").hide();
  });
  $(".pt_name, .pt_filename").click(function() {
    $(".pt_raw_content", $(this).parent().parent()).toggle();
  });
}
