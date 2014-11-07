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