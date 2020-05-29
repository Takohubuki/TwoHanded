let timeSort = '';
let clickSort = '';
let pageType = '';
function changeIcon(selector, type) {
    let $iconToChange = $('#' + selector);
    if (type === 'asc'){
        $iconToChange.removeClass('fa-sort-amount-desc');
        $iconToChange.addClass('fa-sort-amount-asc');
    }else {
        $iconToChange.removeClass('fa-sort-amount-asc');
        $iconToChange.addClass('fa-sort-amount-desc');
    }
}

function queryDeviceRecords(pageNum, type) {
    let url = '/items/' + pageType;
    let data = {'pageNum': pageNum};
    console.log(url);

    if (pageType === 'searchByName') {
        searchName = getItemInSession('searchName');
        data.searchName = searchName;
        data.condition = type;
    }else if (pageType === 'searchByKind'){
        kind = getItemInSession('kind');
        data.kind = kind;
    }
    data.timeSort = timeSort;
    data.clickSort = clickSort;

    $.ajax({
        url: url,
        data: data,
        async:false,
        success: function (result) {
            console.log(result);
            $('#itemInfoPaging').html(result);
        }
    });

}


$(function () {
    $('#sortByTime').click(function () {

        if($('#timeSortIcon').hasClass('fa-sort-amount-desc')){

            timeSort = 'asc';
            changeIcon('timeSortIcon', 'asc');
            $('#timeSortText').html('按照发布时间升序');
        }else {
            timeSort = 'desc';
            changeIcon('timeSortIcon', 'desc');
            $('#timeSortText').html('按照发布时间降序');
        }

        queryDeviceRecords(1);

    });
    $('#sortByClick').click(function () {

        if($('#clickSortIcon').hasClass('fa-sort-amount-desc')){

            clickSort = 'asc';
            changeIcon('clickSortIcon', 'asc');
            $('#clickSortText').html('按照点击量升序');
        }else {
            clickSort = 'desc';
            changeIcon('clickSortIcon', 'desc');
            $('#clickSortText').html('按照点击量降序');

        }
        queryDeviceRecords(1);

    })

})