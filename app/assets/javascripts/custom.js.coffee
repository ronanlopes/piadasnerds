@do_on_load = () ->
  $('.table').DataTable({
    // ajax: ...,
    // autoWidth: false,
    // pagingType: 'full_numbers',
    // processing: true,
    // serverSide: true,

    // Optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about available options.
    // http://datatables.net/reference/option/pagingType
    responsive: true
  });


$ ->
  do_on_load()
  $(window).bind('page:change', do_on_load)
