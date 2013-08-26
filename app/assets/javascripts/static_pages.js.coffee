# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

not ($) ->
  $ ->
    $window = $(window)
    
    # Disable certain links in docs
    $("section [href^=#]").click (e) ->
      e.preventDefault()

    
    # side bar
    setTimeout (->
      $(".bs-docs-sidenav").affix offset:
        top: ->
          (if $window.width() <= 980 then 290 else 210)

        bottom: 270

    ), 100
    
    # make code pretty
    window.prettyPrint and prettyPrint()
    
    # add-ons
    $(".add-on :checkbox").on "click", ->
      $this = $(this)
      method = (if $this.attr("checked") then "addClass" else "removeClass")
      $(this).parents(".add-on")[method] "active"

    
    # add tipsies to grid for scaffolding
    if $("#gridSystem").length
      $("#gridSystem").tooltip
        selector: ".show-grid > [class*=\"span\"]"
        title: ->
          $(this).width() + "px"

    
    # tooltip demo
    $(".tooltip-demo").tooltip selector: "a[data-toggle=tooltip]"
    $(".tooltip-test").tooltip()
    $(".popover-test").popover()
    
    # popover demo
    $("a[data-toggle=popover]").popover().click (e) ->
      e.preventDefault()

    
    # button state demo
    $("#fat-btn").click ->
      btn = $(this)
      btn.button "loading"
      setTimeout (->
        btn.button "reset"
      ), 3000

    
    # carousel demo
    $("#myCarousel").carousel()
    
    # javascript build logic
    inputsComponent = $("#components.download input")
    inputsPlugin = $("#plugins.download input")
    inputsVariables = $("#variables.download input")
    
    # toggle all plugin checkboxes
    $("#components.download .toggle-all").on "click", (e) ->
      e.preventDefault()
      inputsComponent.attr "checked", not inputsComponent.is(":checked")

    $("#plugins.download .toggle-all").on "click", (e) ->
      e.preventDefault()
      inputsPlugin.attr "checked", not inputsPlugin.is(":checked")

    $("#variables.download .toggle-all").on "click", (e) ->
      e.preventDefault()
      inputsVariables.val ""

    
    # request built javascript
    $(".download-btn .btn").on "click", ->
      css = $("#components.download input:checked").map(->
        @value
      ).toArray()
      js = $("#plugins.download input:checked").map(->
        @value
      ).toArray()
      vars = {}
      img = ["glyphicons-halflings.png", "glyphicons-halflings-white.png"]
      $("#variables.download input").each ->
        $(this).val() and (vars[$(this).prev().text()] = $(this).val())

      $.ajax
        type: "POST"
        url: (if /\?dev/.test(window.location) then "http://localhost:3000" else "http://bootstrap.herokuapp.com")
        dataType: "jsonpi"
        params:
          js: js
          css: css
          vars: vars
          img: img



  
  # Modified from the original jsonpi https://github.com/benvinegar/jquery-jsonpi
  $.ajaxTransport "jsonpi", (opts, originalOptions, jqXHR) ->
    url = opts.url
    send: (_, completeCallback) ->
      name = "jQuery_iframe_" + jQuery.now()
      iframe = undefined
      form = undefined
      iframe = $("<iframe>").attr("name", name).appendTo("head")
      # GET or POST
      form = $("<form>").attr("method", opts.type).attr("action", url).attr("target", name)
      $.each opts.params, (k, v) ->
        $("<input>").attr("type", "hidden").attr("name", k).attr("value", (if typeof v is "string" then v else JSON.stringify(v))).appendTo form

      form.appendTo("body").submit()

(window.jQuery)