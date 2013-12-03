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

function setupMigrations() {
  var elems = document.querySelectorAll(".pt_migration .pt_header");
  onClick(elems, function() {
    var content = this.nextElementSibling;
    content.style.display = content.style.display === "" ? "block" : "";
  });
}
