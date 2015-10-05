function PagesModel(view) {
  this.pagesView = view
}

PagesModel.prototype.getAllDreams = function() {
  var self = this
  var returnValue = null
  $.ajax({
    url: "/dreams",
    type: 'GET',
    success: function (dreams){
      self.pagesView.renderAllDreams(dreams)
    },
    error: function (err){
      console.log("Error: ", err);
    }
  })
}