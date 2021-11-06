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