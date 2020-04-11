function hideModal(type) {
    $('#modal-' + type).removeClass("in");
    $(".modal-backdrop").remove();
    $('body').removeClass('modal-open');
    $('body').css('padding-right', '');
    $('#modal-' + type).hide();
}
