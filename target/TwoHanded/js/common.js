let searchName;
$(function () {
    $('#password1').on('change', function () {
        validatePassword();
    });
    $('#password2').on('change', function () {
        validatePassword();
    });
    $('#searchBtn').click(function () {
        searchName = $('#searchBar').val();
        window.sessionStorage.setItem('searchName', searchName);
    })
});

function validatePassword() {
    var pass2 = $('#password2').val();
    var pass1 = $('#password1').val();
    if (pass1 !== pass2)
        $('#password2').setCustomValidity("输入密码不匹配");
    else
        $('#password2').setCustomValidity('');
}
