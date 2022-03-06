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

// Sort tracks by liked tracks
$(document).on('change', '.sort-by-likes:checkbox', (event) => {
  const element = $(event.target)
  $.ajax({
    url: element.data('tracks-path'),
    type: "GET",
    dataType: 'script',
    data: {
      sortByLikes: element.prop('checked')
    },
  });
})

// Display tracks sorter checked or not
$(document).on('turbolinks:load', function () {
  params = new URLSearchParams(window.location.search)

  $('.sort-by-sub:checkbox').prop('checked', params.get('sortBySub') == 'true')

  displaySoundCloudTracks()
})

$(document).on('ajax:success', function () {
  displaySoundCloudTracks()
})

function displaySoundCloudTracks() {
  if ($('.track').length > 0) {
    $('.track').each((index, element) => {
      const urlElement = $($(element).find('.soundcloud-url'))
      const urlPath = urlElement.attr('href')
      displaySoundCloudTrack(urlElement, urlPath)
    }) 
  }
}

function displaySoundCloudTrack(urlElement, urlPath) {
  const settings = {
    "async": true,
    "crossDomain": true,
    "url": "https://soundcloud.com/oembed",
    "method": "POST",
    "headers": {},
    "data": {
      "format": "json",
      "url": urlPath,
      "maxheight": "166"
    }, success: (data) => {
      urlElement.html(data.html)
    }
  }
  
  $.ajax(settings)
}