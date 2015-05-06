# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.tabs .tab-links a').on 'click', (e) ->
    currentAttrValue = $(this).attr('href')
    # Show/Hide Tabs
    $('.tabs ' + currentAttrValue).fadeIn(400).siblings().hide()
    # Change/remove current tab to active
    $(this).parent('li').addClass('active').siblings().removeClass 'active'
    e.preventDefault()
    return
  return

