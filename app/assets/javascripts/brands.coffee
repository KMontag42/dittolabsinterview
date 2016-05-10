$('document').ready ->
  $('#masonry-container').isotope({
    layout: 'fitRows',
    itemSelector: '.grid-item',
    percentPosition: true
  })