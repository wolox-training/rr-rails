$(document).ready ->
  $("#new_search").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $(".alert").html ''
    $("#result").html """
      <p>Your search found the following book:</p>
      <h3>#{data.title}</h3>
      <h4>#{data.subtitle}</h4>
      <p><strong>ISBN</strong>: #{data.isbn}</p>
      <p><strong>Pages</strong>: #{data.number_of_pages}</p>
      <p><strong>#{if data.authors.length == 1 then 'Author' else 'Authors'}</strong>: #{data.authors.join(', ')}</p>
    """
  ).on "ajax:error", (event) ->
    [data, status, xhr] = event.detail
    $("#result").html ''
    $(".alert").html data.error