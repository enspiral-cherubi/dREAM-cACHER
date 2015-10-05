function PagesController(model) {
  this.pagesModel = model
}

PagesController.prototype.showDefaultDreamscape = function() {
  this.pagesModel.getAllDreams();
};