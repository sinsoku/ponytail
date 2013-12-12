//= require_tree .

function setupMigrations() {
  toggleMigrationRawContent();
  closeNotice();
}

function setupNewMigration() {
  var elem = document.querySelectorAll(".pt_new")[0];
  new NewMigrationView(elem).init();
}
