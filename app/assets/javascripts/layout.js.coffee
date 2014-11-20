$(document).ready ->

  $(".progress .progress-bar").progressbar({ display_text: "fill" })

  today = new Date()
  dd = today.getDate()

  if $('.payment-due').length > 0
    $("#calendar").fullCalendar({
      header: {
        left: '',
        center: 'title',
        right: 'today, prev,next'
      },
      events: [{
              title: 'Payment Due',
              start: '2014-11-' + (dd + 10).toString(),
              description: 'This is a cool event'
          }
      ],
    })
  else
    $("#calendar").fullCalendar({
      header: {
        left: '',
        center: 'title',
        right: 'today, prev,next'
      }
    })

  $(".phone-input").mask("999-999-9999")
  $(".zip-input").mask("99999")
  $("#payment_method_cc_number").mask("9999-9999-9999-9999")
  $("#payment_method_cc_security_code").mask("999")


  # hide all images
  $('#nstar-example').hide()
  $('#national-grid-example').hide()
  $('#comcast-example').hide()

  # disable button on load
  $('.example-button').prop("disabled",true)

  # overlay
  # display overlay and load content
  $('.overlay').on 'click', (e) ->
    $('#overlay-container').fadeIn(500)
    $('.black-out').fadeIn(500)
    if $( "#utility_name option:selected" ).text() == "NStar"
      $('#national-grid-example').hide()
      $('#comcast-example').hide()
      $('#nstar-example').show()
    else if $( "#utility_name option:selected" ).text() == "National Grid"
      $('#nstar-example').hide()
      $('#comcast-example').hide()
      $('#national-grid-example').show()
    else if $( "#utility_name option:selected" ).text() == "Comcast"
      $('#nstar-example').hide()
      $('#national-grid-example').hide()
      $('#comcast-example').show()
    else
      $('#nstar-example').hide()
      $('#national-grid-example').hide()
      $('#comcast-example').hide()

  $('#utility_name').on 'change', () ->
    if $( "#utility_name option:selected" ).text() == ""
      $('.example-button').prop("disabled",true)
    else
      $('.example-button').prop("disabled",false)

  # hide overlay
  hide_overlay = () ->
    $("body").css("overflow", "auto") # re-enable scrolling
    $('#overlay-container').fadeOut(500)
    $('.black-out').fadeOut(500)

  # events that hide the overlay
  $('.black-out').on 'click', () ->
    hide_overlay()
  $('.close-overlay').on 'click', () ->
    hide_overlay()

  # update payment method stuff on service creation/edit page
  update_utility_payment_method = () ->
    id = parseInt($('#utility_payment_method_id').val()) || 1
    $.getJSON "/payment_methods/" + id, (data) ->
      $('.selected_payment_type').text(data["payment_type"])
      $('.selected_cardholders_name').text(data["cardholders_name"])
      $('.selected_cc_number').text(data["cc_number"])
      $('.selected_exp_date').text(data["experation_date"])
  
  $('#utility_payment_method_id').change () ->
    update_utility_payment_method()

  update_utility_payment_method()



