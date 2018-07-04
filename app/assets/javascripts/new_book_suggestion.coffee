$(document).ready ->
  $("#new_book_suggestion").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $(".alert").html ''
    $(".notice").html "The suggestion was uploaded properly!"
  ).on "ajax:error", (event) ->
    [data, status, xhr] = event.detail
    $(".notice").html ''
    $(".alert").html data.errors.map((i) -> "<span>#{i}</span>")