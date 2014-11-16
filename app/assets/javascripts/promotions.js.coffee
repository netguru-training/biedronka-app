jQuery ->
  $('#start-datetimepicker').datetimepicker()
  $('#end-datetimepicker').datetimepicker()



jQuery ->
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
