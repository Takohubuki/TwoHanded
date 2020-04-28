let searchName;
var reg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //邮箱正则表达式

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
    });
    $('input[name = email]').blur(function () {
        let email = $('input[name = email]');
        validateEmail(email);
    })
});

function validatePassword() {
    var pass2 = $('#password2').val();
    var pass1 = $('#password1').val();
    if (pass1 !== pass2) {
        $('#pwdValidate').html($('#password2').validationMessage);
        $('#password2').setCustomValidity("输入密码不匹配");
    } else {
        $('#pwdValidate').html('');
        $('#password2').setCustomValidity('');
    }
}

function validateEmail(email) {
    console.log(email.val());
    if (!reg.test(email.val())) {
        $('#emailError').html(email.validationMessage);
        email.setCustomValidity('邮箱格式不正确！');
    } else {
        $('#emailError').html('');
        email.setCustomValidity('');
    }
}
