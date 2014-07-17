$ ->
  $("#ponytail_table_name").change ->
    location.href = "/ponytail/tables/#{$(@).val()}"
