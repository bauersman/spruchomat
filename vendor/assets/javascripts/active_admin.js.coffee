#= require active_admin/base
$ ->
  console.log('fooooo')
  $('#poster_url_input input').change ->
    console.log('previewing img')
    input = $('#poster_url_input input')[0]

    if input.files and input.files[0]
      reader = new FileReader()
      reader.onload = (event) ->
        console.log('replacing img')
        $('#poster_url_input img').attr('src', event.target.result)

      console.log('foooooo')
      reader.readAsDataURL(input.files[0])
      return

#
