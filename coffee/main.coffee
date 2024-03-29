###############################################################################
## **Summary**                                                               ##
## This code is originally created by tab team. Y.Ochi modifed it for Lenovo.##
## Oritinal file could be downloaded from below;                             ##
##                               http://tonchidot.github.com/tab-api-docs/   ##
##                                                                           ##
## **How to install CoffeeScritp**                                           ##
## 1. Download and install Node.js (http://nodejs.jp/)                       ##
## 2. Open cmd.exe                                                           ##
## 3. npm install -g coffee-script                                           ##
##                                                                           ##
## ** How to compile CofeeScript**                                           ##
## 1. Open cmd.exe                                                           ##
## 2. coffee -cj ../main.js main.coffee map.coffee item.coffee parameter.coffee ##
##                                                                           ##
## ** References **                                                          ##
## 1. http://d.hatena.ne.jp/nodamushi/20110108/1294518316                    ##
##                                                                           ##
###############################################################################
## @---	12/24/2012	Y.Ochi	Initial version                                  ##
###############################################################################

#Entry point
$(document).ready ->
  resizeContentHeight()
  $(window).bind("resize", resizeContentHeight)
  
  #Create select item
  for key, category of CATEGORY
    elm = $("<option>").html(key).attr({value : category})
    $("#item-pickup-category").append(elm)
  
  for key, distance of DISTANCE
    elm = $("<option>").html(key).attr({value : distance})
    $("#item-pickup-distance").append(elm)
  
  #Item Search
  $('#item-pickup-category').bind 'change', ->
    search_item $('#item-pickup-category').val(), $('#item-pickup-input').val(), $('#item-pickup-distance').val()
    false 
  $('#item-pickup-distance').bind 'change', ->
    search_item $('#item-pickup-category').val(), $('#item-pickup-input').val(), $('#item-pickup-distance').val()
    false
  $('#item-pickup-form').bind 'submit', ->
    search_item $('#item-pickup-category').val(), $('#item-pickup-input').val(), $('#item-pickup-distance').val()
    false

  #Map Search
  $('#mmc-location-button').bind 'click', ->
    load_mmc_location()

  $('#location-search').bind 'submit', ->
    load_address $('#address-input').val()
    false
    
  #Get Center  
  load_mmc_location()

load_mmc_location = ->
  Map.get().load()    
    
resizeContentHeight = ->
  contentsHeight = window.innerHeight - $('.navbar').height() - 30
  contentsHeight = 0 if contentsHeight < 0
  $('#map_canvas').height(contentsHeight)
  $('#search-result').height(contentsHeight)

load_address = (address) ->
  geocoder = new google.maps.Geocoder()
  geocoder.geocode { address: address }, (results, status) ->
    if status == google.maps.GeocoderStatus.OK
      latlng = results[0].geometry.location
      m = Map.get(latlng)
      m.gmap.setZoom(DEFAULT_ZOOM_LEVEL)
      m.load()
    else
      alert("Geocode failed: #{status}")

api_url = (endpoint) ->
  api_url_base = "http://tab.do/api/1/"
  "#{api_url_base}#{endpoint}.json"

read_user_follow_items = (cb) ->
  url = api_url("users/" + USER_ID + "/items")
  $.get(url, {	}, cb)

search_item = (category, word, distance) ->
  Map.get().update(category, word, distance)
  true

