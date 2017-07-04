$(document).on 'turbolinks:load', ->
    $(".categories_mp").on("click", addCategoryToMerchant)
    $("#add_galery").on("click", hideAddGaleryButton)
    $(".galery_delete").each( () ->
      $(@).on("click", test)
      )

test = () ->
  console.log "aaaaaa"

hideAddGaleryButton = () ->

    size = $("#galeries_blocks .fields:visible").size()
    console.log size
    #if size+1 >= 6
      #$("#add_galery").hide()

addCategoryToMerchant = (event) ->
  id = event.target.id
  console.log "here"
  if $(@).siblings().val()
    console.log "exist"
    $(@).removeClass("btn-info")
    $(@).addClass("btn-default")
    return $(@).siblings().remove()
  else
    console.log "not"
    $(@).removeClass("btn-default")
    $(@).addClass("btn-info")
    return $(@).parent().append("<input type='hidden' name='merchant_page[category_ids][]' value=#{id}>")

