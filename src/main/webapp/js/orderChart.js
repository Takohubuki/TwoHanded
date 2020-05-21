let months = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];
let thirtyOneDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'];
let thirtyDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30'];
let twentyEightDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28'];
let twentyNineDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29'];
let completedOrder = [];
let canceledOrder = [];

let dateMonthConfig = {
    language: "zh-CN", //语言
    todayHighlight: true, //是否今日高亮
    format: 'yyyy-m', //点击月份后显示在input中的格式
    autoclose: true, //是否开启自动关闭
    startView: 'months', //开始视图层，为月视图层
    maxViewMode:'years', //最大视图层，为年视图层
    minViewMode:'months', //最小视图层，为月视图层
    startDate:moment().subtract(47,'month').toDate(), //控制可选的最早月份，为前48个月（含当前月）
    endDate:moment().toDate() //控制可选的最晚月份，为当前月
};

window.chartColors = {
    red: 'rgb(255, 99, 132, 0.2)',
    orange: 'rgb(255, 159, 64, 0.2)',
    yellow: 'rgb(255, 205, 86, 0.2)',
    green: 'rgb(75, 192, 192, 0.2)',
    blue: 'rgb(54, 162, 235, 0.2)',
    purple: 'rgb(153, 102, 255, 0.2)',
    grey: 'rgb(201, 203, 207, 0.2)'
};

let selectYearHtml = '<div><label>选择年份</label><select class="selectpicker" id="yearPicker">';
let selectMonthHtml = '<label>选择月份</label><div class="input-group date"><div class="input-group-addon"><i class="fa fa-calendar"></i></div><input type="text" class="form-control pull-right datepicker" id="monthPicker"></div>';
let chart = $('#orderChart');
let chartObj;
let selectCondition;


$(function () {
    completeSelectYearHtml(selectYearHtml);
    getOrderCount($('#yearPicker').val());
    createChart(months, completedOrder, canceledOrder);

    $('#selectCondition').on('change', function () {
        selectCondition = $('#selectCondition').val();
        let $searchCondition = $('#searchCondition');

        if (selectCondition === 'year'){
            $searchCondition.html(selectYearHtml);
            $('#yearPicker').selectpicker('refresh');
            $('#yearPicker').selectpicker('render');
            getOrderCount($('#yearPicker').val());
            chartObj.data.datasets[0].data = completedOrder;
            chartObj.data.datasets[1].data = canceledOrder;
            chartObj.data.labels = months;
            chartObj.update();

        }else {
            $searchCondition.html(selectMonthHtml);

            $('#monthPicker').datepicker(dateMonthConfig).on('changeDate', function() {
                selectCondition = $('#selectCondition').val();
                let month = $('#monthPicker').val();

                getOrderCount(month);
                chartObj.data.datasets[0].data = completedOrder;
                chartObj.data.datasets[1].data = canceledOrder;
                chartObj.data.labels = thirtyDays;
                chartObj.update();
            });
        }
    });

    $('body').on('change', '#yearPicker', function () {
        getOrderCount($('#yearPicker').val());
        chartObj.data.datasets[0].data = completedOrder;
        chartObj.data.datasets[1].data = canceledOrder;
        chartObj.data.labels = months;
        chartObj.update();

    });

})

function getOrderCount(time) {
    $.ajax({
        url: '/manage/orderCount',
        data: {'time': time},
        async: false,
        success: function (result) {
            console.log(result);
            completedOrder.splice(0, completedOrder.length);
            canceledOrder.splice(0, canceledOrder.length);
            for (let x in result.completedOrderList){
                completedOrder.push(result.completedOrderList[x]);
            }
            for (let x in result.canceledOrderList){
                canceledOrder.push(result.canceledOrderList[x]);
            }

        },
        error: function (result) {
            console.log(result);
        }
    })
}

function completeSelectYearHtml() {
    let now = new Date();
    let fullYear = now.getFullYear();
    for (let i = 1; i < 4; i++){
        if (i === 1){
            selectYearHtml = selectYearHtml + '<option value="' + (fullYear - i) + '" selected>' + (fullYear - i) + '</option>';
            continue;
        }
        selectYearHtml = selectYearHtml + '<option value="' + (fullYear - i) + '">' + (fullYear - i) + '</option>';
    }
    selectYearHtml = selectYearHtml + '</select></div>';
}


function createChart(labels, datasets1, datasets2) {
    chartObj = new Chart(chart, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: '完成订单数',
                backgroundColor: window.chartColors.green,
                borderColor: window.chartColors.green,
                data: datasets1,
                borderWidth: 1
            },
            {
                label: '取消订单数',
                backgroundColor: window.chartColors.yellow,
                borderColor: window.chartColors.yellow,
                data: datasets2,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    },
                    gridLines: {
                        display: false
                    }

                }],
                xAxes: [{
                    gridLines: {
                        display: false
                    }
                }]
            },
            title: {
                display: true,
                text: '校园二手交易系统订单完成情况统计'
            }
        }

    });

}


