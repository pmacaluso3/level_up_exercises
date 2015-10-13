$ ->
  console.log('Bushes');

  $("[data-round-number]").on "submit", (event) ->
    event.preventDefault();
    console.log('Trees');

    url = $("[data-round-number]").attr('action');
    data = $(this).serialize();
    console.log(url)
    $.ajax
      url: url
      method: 'patch'
      dataType: 'json'
      data: data
      complete: (response) ->
        $("[data-result-holder]").append(response.responseText)
