# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



	$('#toparticle').imagesLoaded ->
	  $('#toparticle').masonry
	      itemSelector: '.top'
	      isFitWidth: true

  $('#subarticles').imagesLoaded ->
    $('#subarticles').masonry
      itemSelector: '.midtwo'
      isFitWidth: true

  $('#articles').imagesLoaded ->
    $('#articles').masonry
      itemSelector: '.box'
      isFitWidth: true