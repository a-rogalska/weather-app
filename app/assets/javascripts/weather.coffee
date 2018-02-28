# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("select#weather_city").select2
    tags: true
    placeholder: "Select a city"

  $("span.temperature").css('color', ->
    temp = $(this).text()
    if temp < 10
      return "blue"
    else if temp >= 10 && temp <= 20
      return "black"
    else
      return "red"
  )
