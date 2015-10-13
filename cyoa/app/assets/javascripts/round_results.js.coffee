$ ->
  console.log('Bushes');

  $("[data-submit-answer]").on "click", (event) ->
    event.preventDefault();
    console.log('Trees');

    $("[data-result-holder]").css('background-color', 'red');