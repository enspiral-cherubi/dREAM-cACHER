function PagesView (environment) {
  this.environment = environment
}

PagesView.prototype.renderAllDreams = function(dreams) {
  self.environment.appendDreams(dreams)
};