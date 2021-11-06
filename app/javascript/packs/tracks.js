// Sort tracks by subscribed viewers
$(document).on('change', '.sort-by-sub:checkbox', (event) => {
  const element = $(event.target)
  $.ajax({
    url: element.data('tracks-path'),
    type: "GET",
    dataType: 'script',
    data: {
      sortBySub: element.prop('checked')
    },
  });
})

// Display tracks sorter checked or not
$(document).on('turbolinks:load', function () {
  params = new URLSearchParams(window.location.search)

  $('.sort-by-sub:checkbox').prop('checked', params.get('sortBySub') == 'true')
})