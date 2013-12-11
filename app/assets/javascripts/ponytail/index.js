function toggleMigrationRawContent() {
  var elems = document.querySelectorAll(".pt_migration .pt_migration_header");
  var func = function() {
    var content = this.nextElementSibling;
    content.style.display = content.style.display === "" ? "block" : "";
  };
  for(var i = 0; i < elems.length; i++) {
    elems[i].onclick = func;
  }
}

function closeNotice() {
  var elem = document.querySelectorAll(".pt_close_notice")[0];
  if (elem !== undefined) {
    elem.onclick = function() {
      this.parentElement.style.display = "none";
    };
  }
}

function setupMigrations() {
  toggleMigrationRawContent();
  closeNotice();
}
