let searchName;
let kind;

let member_status = '';
let message;
let member;

var reg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //邮箱正则表达式

$(function () {
    let email = $('input[name = email]');

    $('#password2').blur(function () {
        if (validatePassword()) {
            $('#pwdValidate').html('');
            $('#pwdValidate').parent().removeClass('has-error');
        } else {
            $('#pwdValidate').html("两次输入的密码不一样！");
            $('#pwdValidate').parent().addClass('has-error');
        }
    });
    $('input[ name = email]').blur(function () {
        if (validateEmail(email)) {
            $('#emailError').html('');
            $('#emailError').parent().removeClass('has-error');
        } else {
            $('#emailError').html('邮箱格式不正确！');
            $('#emailError').parent().addClass('has-error');
        }
    });
    //搜索框
    $('#searchBtn').click(function () {
        searchName = $('#searchBar').val();
        window.sessionStorage.setItem('searchName', searchName);
        $('#searchForm').attr('action', '/items/searchByName');
        $('#searchForm').submit();
    });
    $('#submitRegisterInfo').click(function () {
        if (validatePassword() && validateEmail(email) && $('#identificationMaterial').val() !== '') {
            $('#registerForm').submit();
        }
    });
    //分类搜索
    $('.kindList').click(function () {
        kind = $(this).text().trim();
        console.log(kind);
        window.sessionStorage.setItem('kind', kind);
    })
});

function validatePassword() {
    var pass2 = $('#password2').val();
    var pass1 = $('#password1').val();
    return pass1 === pass2;
}

function validateEmail(email) {
    console.log(email.val());
    return reg.test(email.val());
}

function getItemInSession(key) {
    return window.sessionStorage.getItem(key);
}

function isInteger(obj) {
    return typeof obj === 'number' && obj%1 === 0
}
