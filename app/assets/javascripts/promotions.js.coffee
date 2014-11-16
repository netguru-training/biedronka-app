ready = ->
  $('#start-datetimepicker').datetimepicker()
  $('#end-datetimepicker').datetimepicker()
  $('#promotions-table').dataTable
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    paging: false
    columnDefs: [
      sortable: false
      targets: [ 5, 6 ]
    ]
    sAjaxSource: $('#promotions-table').data('source')

$(document).ready ready
$(document).on "page:load", ready
