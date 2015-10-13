$ ->

  $("[data-round-number]").on "submit", (event) ->
    event.preventDefault()
    $('[data-submit-answer]').prop('disabled', true)
    url = $("[data-round-number]").attr('action')
    data = $(this).serialize()
    $.ajax
      url: url
      method: 'patch'
      dataType: 'json'
      data: data
      complete: (response) ->
        $("[data-result-holder]").append(response.responseText)
