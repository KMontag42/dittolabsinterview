$('document').ready ->
  $('#masonry-container').isotope({
    layout: 'fitRows',
    itemSelector: '.grid-item',
    percentPosition: true
  })

  $('#brands-js-grid').jsGrid({
    height: 'auto',
    width: '100%',
    sorting: true,
    paging: true,
    autoload: true,
    controller: {
      loadData: () ->
        $.ajax
          url: '/brands.json'
          dataType: 'json'
    },
    rowClick: (args) ->
      window.location = args.item.url
    ,
    fields: [
      {
        name: 'name'
        type: 'text'
      }
    ]
  })