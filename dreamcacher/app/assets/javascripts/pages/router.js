$(".pages").ready(function() {
  // load the scene
  var environment = new Environment()
  var pagesView = new PagesView(environment)
  var pagesModel = new PagesModel(pagesView)
  var pagesController = new PagesController(pagesModel)


  pagesController.showDefaultDreamscape()

  // call a function to load the standard dreamscape

})

// make a route to load all dreams of a tag

//make a route to load the standard dream function