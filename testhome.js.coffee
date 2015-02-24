centering = (quantity, object) ->
  if quantity > 9
    object.css('margin-left', '92px')
  else
    object.css('margin-left', '96px')


$(document).on "page:change", ->

  $('#hiddenCart').mouseleave ->
    $('#baseCart').removeClass('clicked')
    $('#hiddenCart').delay(1000).hide("drop", {direction:"up"}, 200)

  overal = parseInt($('.overalHidden').html())
  if isNaN(overal)
    overal = 0
  else
    $('.overalCart').html(overal.toLocaleString("ru-RU")+' '+"<span class='rur'>&nbsp;Р<span>")

  divQuantity = $('.quantity')
  quantity = parseInt(divQuantity.html())
  centering(quantity, divQuantity)

  $('.CartCounter').click ->
    divTotalHidden = $(this).parents('tr').find('.totalHidden')
    count = parseInt($(this).parent('.countTable').find('.Count').html())
    total = parseInt(divTotalHidden.html())
    overal = parseInt($('.overalHidden').html())
    price = total/count
    if $(this).hasClass('downCount')
      if count > 1 && quantity > 1
        count = --count
        quantity = --quantity
        overal = overal-price
        total = price*count
    if $(this).hasClass('upCount')
      count = ++count
      quantity = ++quantity
      overal = overal+price
      total = price*count
    centering(quantity, divQuantity)
    $(this).parent('.countTable').find('.Count').html(count)
    divQuantity.html(quantity)
    $(this).parents('tr').find('.totalTable').html(total.toLocaleString("ru-RU")+' '+"<span class='rur'>&nbsp;Р<span>")
    divTotalHidden.html(total)
    $('.overalSum').html(overal.toLocaleString("ru-RU")+' '+"<span class='rur'>&nbsp;Р<span>")
    $('.overalHidden').html(overal)
    $('.overalCart').html(overal.toLocaleString("ru-RU")+' '+"<span class='rur'>&nbsp;Р<span>")