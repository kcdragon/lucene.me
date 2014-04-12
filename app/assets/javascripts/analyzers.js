$('#analyzer_all').change(function() {
    checked = $(this).prop('checked');
    $('.analyzers input[type=checkbox]').prop('checked', checked);
});
