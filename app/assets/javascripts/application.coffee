//= require jquery
//= require turbolinks
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require chosen-jquery
//= require cocoon
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require moment/pt-br
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

@get_url_parameters = (parameter, staticURL, decode) ->
  currLocation = if staticURL.length then staticURL else window.location.search
  if currLocation.indexOf('?') > -1
    parArr = currLocation.split('?')[1].split('#')[0].split('&')
    returnBool = true
    i = 0
    while i < parArr.length
      parr = parArr[i].split('=')
      if decodeURIComponent(parr[0]) == parameter
        return if decode then decodeURIComponent(parr[1]) else parr[1]
        returnBool = true
      else
        returnBool = false
      i++
    if !returnBool
      return ""

@set_param = (paramName, paramValue) ->
  url = window.location.href
  if url.indexOf(paramName + '=') >= 0
    prefix = url.substring(0, url.indexOf(paramName))
    suffix = url.substring(url.indexOf(paramName))
    suffix = suffix.substring(suffix.indexOf('=') + 1)
    suffix = if suffix.indexOf('&') >= 0 then suffix.substring(suffix.indexOf('&')) else ''
    url = prefix + paramName + '=' + paramValue + suffix
  else
    if url.indexOf('?') < 0
      url += '?' + paramName + '=' + paramValue
    else
      url += '&' + paramName + '=' + paramValue
  window.history.pushState('Projetos', 'Impulso Project', url)
  return


@gerar_data_table = (id, results_per_page) ->
  $("#"+id).dataTable().fnDestroy()
  window.tarefa_datatable = $('#'+id).DataTable
    language: language_datatable
    paging: true
    bPaginate: true
    bLengthChange: false
    iDisplayLength: results_per_page
    bInfo: true

@is_in_array = (value, array) ->
  return array.indexOf(value) > -1;


@atualizar_chosen = () ->

  $('.chosen-select').chosen('destroy').chosen
    placeholder_text_single: 'Selecione'
    no_results_text: 'Nenhum resultado encontrado'
    placeholder_text_multiple: 'Selecione'




#Funções para filtrar o campo de tarefas
@tarefas_selecionadas = (id) ->
  opcoes_escolhidas = []
  $('.'+id+'_tarefas #'+id+'_tarefa_ids_chosen .chosen-choices .search-choice span').each ->
    opcoes_escolhidas.push($(this).text())
  return opcoes_escolhidas

@remover_tarefas_nao_selecionadas = (id) ->
  tarefas = tarefas_selecionadas(id)
  $('.'+id+'_tarefas #'+id+'_tarefa_ids option').each ->
    if (!is_in_array($(this).text(), tarefas))
      $(this).remove()

@remover_tarefas = (id) ->
  $("#"+id+"_tarefa_ids").html("")

@buscar_tarefas_por_projeto = (id)  ->
  projeto_id = $("#"+id+"_projeto_id").val()
  if projeto_id is ""
    $("."+id+"_tarefas").hide()
  else
    $("."+id+"_tarefas").hide()
    $('<span id="loadingtarefas"><i>Buscando tarefas... </i> </span>').insertBefore("."+id+"_tarefas")
    data = { projeto_id: projeto_id }
    data[window._auth_token_name] = window._auth_token
    $.ajax "/tarefas_list",
      type: "get"
      dataType: "json"
      data: data
      success: (tarefas) ->
        $("."+id+"_tarefas").show()
        tarefas.sort((a, b) -> a.id - b.id).forEach (value, i) ->          
          if value.descricao
            label = "Tarefa "+ value.id + " - " + value.descricao
          else
            label = "Tarefa "+ value.id + " - Sem descrição"
          tarefas = tarefas_selecionadas(id)
          if !is_in_array(label,tarefas)
            $("#"+id+"_tarefa_ids").append '<option value="'+value.id+'">'+label+'</option>'
        $("#"+id+"_tarefa_ids").trigger('chosen:updated')
        $( "#loadingtarefas").remove();
      error: ->
        alert 'Erro ao tentar carregar as tarefas.'
  return    

#Adicionar inicializações nesta função para compatibilidade com o turbolinks
@do_on_load = () ->

  # $.mask.masks.datetime = { mask : '39/19/9999 99:99' };
  # $.mask.masks.date = { mask : '39/19/9999' };

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
    atualizar_chosen()

  $(document).bind('ajaxSend', ->
    $('input[type="submit"]').prop('disabled', true)
  ).bind 'ajaxComplete', ->
    $('input[type="submit"]').prop('disabled', false)


$ ->
  do_on_load()
  $(window).bind('page:change', do_on_load)
  
