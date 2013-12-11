function each(elems, func) {
  if (!elems instanceof Array) { elems = [elems]; }
  for (var i = elems.length; i--; ) {
    func(elems[i]);
  }
}

function onClick(elems, func) {
  each(elems, function(elem) {
    elem.onclick = func;
  });
}

function toggleMigrationRawContent() {
  var elems = document.querySelectorAll(".pt_migration .pt_migration_header");
  onClick(elems, function() {
    var content = this.nextElementSibling;
    content.style.display = content.style.display === "" ? "block" : "";
  });
}

function closeNotice() {
  var elems = document.querySelectorAll(".pt_close_notice");
  onClick(elems, function() {
    this.parentElement.style.display = "none";
  });
}

function setupMigrations() {
  toggleMigrationRawContent();
  closeNotice();
}

function setupNewMigration() {
}
