###############################################################################
## @---	12/24/2012	Y.Ochi	Initial version                                  ##
###############################################################################

class Item
  constructor: (@item) ->   
    #calc distance
    to_lat = 0;
    to_lon = 0;
    if @item.places[0].lat? then to_lat = @item.places[0].lat
    if @item.places[0].lon? then to_lon = @item.places[0].lon
    to = new google.maps.LatLng(to_lat, to_lon)
    from = new google.maps.LatLng(INIT_LATITUDE, INIT_LONGTITUDE)
    @distance = google.maps.geometry.spherical.computeDistanceBetween(from, to)

  renderContext: ->
    updated_at = new Date(@item.updated_at)
    now = new Date()
    passedDate = (now - updated_at) / (1000 * 60 * 60 * 24)

    #Modify title
    mod_title = @item.title
    #Reclip count
    #mod_title += "(" + @item.reclip_count + ")";
    #Add place name
    if @item.places[0]?
       mod_title += " @ " + @item.places[0].name
    
    #sometimes those values are returned as null
    item_img_s = ""
    item_img_m = ""
    if @item.image_urls[0]? then item_img_s = @item.image_urls[0].crop_S
    if @item.image_urls[0]? then item_img_m = @item.image_urls[0].crop_M
    
    {
      id: @item.id
      short_title: truncate(@item.title, 20)
      title: mod_title
      short_description: truncate(@item.description, 50)
      long_description: truncate(@item.description, 300)
      image_url_small: item_img_s
      image_url: item_img_m
      profile_image_url: @item.user.profile_image_url.crop_S
      tab_url: "https://tab.do/items/#{@item.id}"
      stream_url: "https://tab.do/streams/#{@item.stream.id}"
      stream_title: @item.stream.title
      is_new: passedDate < 1
      distance: Math.round(@distance)
    }

  html: ->
    template = Handlebars.compile($('#entry-template').html())
    template(@renderContext())

  infoHtml: ->
    template = Handlebars.compile($('#info-window-template').html())
    template(@renderContext())
    
  createInfoHtml: (offset)->
    @infoWindow = new google.maps.InfoWindow({ content: @infoHtml() , pixelOffset: offset})

  latlng: ->
    if @item.places.length > 0
      place = @item.places[0]
      new google.maps.LatLng(place.lat, place.lon)
      
  truncate = (string, maxchars) ->
    if !string? then ""

    if string.length <= maxchars || maxchars <= 3
      string
    else
      string[0...(maxchars - 3)] + '...'
