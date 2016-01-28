//= require jquery
//= require turbolinks
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require chosen-jquery
//= require cocoon
//= require best_in_place
//= require jquery-ui
//= require jquery-datetimepicker
//= require best-in-place-datetime
//= require meiomask
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require bootstrap.file-input
//= require lightbox
//= require bootsy
//= require bootstrap-wysihtml5/locales
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.validate.messages_ptbr
//= require bootstrap-tabdrop
//= require confirm
//= require moment.min
//= require fullcalendar
//= require fullcalendar-pt-br
//= require marker-clusterer

window.language_datatable = {
  "sEmptyTable": "Nenhum registro encontrado",
  "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
  "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
  "sInfoFiltered": "(Filtrados de _MAX_ registros)",
  "sInfoPostFix": "",
  "sInfoThousands": ".",
  "sLengthMenu": "_MENU_ resultados por página",
  "sLoadingRecords": "Carregando...",
  "sProcessing": "Processando...",
  "sZeroRecords": "Nenhum registro encontrado",
  "sSearch": "Pesquisar",
  "oPaginate": {
    "sNext": "Próximo",
    "sPrevious": "Anterior",
    "sFirst": "Primeiro",
    "sLast": "Último"
  },
  "oAria": {
    "sSortAscending": ": Ordenar colunas de forma ascendente",
    "sSortDescending": ": Ordenar colunas de forma descendente"
  }
}

@do_on_load = () ->

  $.mask.masks.datetime = { mask : '39/19/9999 99:99' };
  $.mask.masks.date = { mask : '39/19/9999' };

  #$(".datatable").dataTable().fnDestroy()
  window.tarefa_datatable = $(".datatable").DataTable
    language: language_datatable
    paging: true
    bPaginate: true
    bLengthChange: false
    iDisplayLength: 30
    bInfo: true


  $('[data-toggle="tooltip"]').tooltip()


  $.fn.twitter_bootstrap_confirmbox.defaults = {
    fade: true,
    title: "Confirmação",
    cancel: "Cancelar",
    cancel_class: "btn cancel",
    proceed: "Confirmar",
    proceed_class: "btn proceed btn-primary"
  };

  #Corrigindo glitch do chosen no modal
  $(document).on 'shown.bs.modal', ->
    $(".datetimeinput").setMask("datetime")
    $(".dateinput").setMask("date")


  $(document).bind('ajaxSend', ->
    $('input[type="submit"]').prop('disabled', true)
  ).bind 'ajaxComplete', ->
    $('input[type="submit"]').prop('disabled', false)


$ ->
  do_on_load()
  $(window).bind('page:change', do_on_load)
  
