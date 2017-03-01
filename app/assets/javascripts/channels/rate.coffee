App.rates = App.cable.subscriptions.create 'RateChannel',
  received: (view) ->
    $('.js-rates-channel').replaceWith(view)

