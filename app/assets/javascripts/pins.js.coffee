# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true


	$('#toparticle').imagesLoaded ->
	  $('#toparticle').masonry
	      itemSelector: '.top'
	      isFitWidth: true

	 $('#articles').imagesLoaded ->
    $('#articles').masonry
      itemSelector: '.box'
      isFitWidth: true

  $('#twoarticles').imagesLoaded ->
    $('#twoarticles').masonry
      itemSelector: '.midtwo'
      isFitWidth: true
  
  

      $('#pieces').imagesLoaded ->
    $('#pieces').masonry
      itemSelector: '.box2'
      isFitWidth: true




