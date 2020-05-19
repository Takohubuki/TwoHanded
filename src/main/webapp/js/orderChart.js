let months = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];
let thirtyOneDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'];
let thirtyDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30'];
let twentyEightDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28'];
let twentyNineDays = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29'];
let completedOrder = [120, 190, 300, 500, 200, 300, 110, 123, 321, 543, 294, 234];
let canceledOrder = [399, 432, 965, 468, 280, 330, 324, 423, 121, 143, 494, 634];

window.chartColors = {
    red: 'rgb(255, 99, 132, 0.2)',
    orange: 'rgb(255, 159, 64, 0.2)',
    yellow: 'rgb(255, 205, 86, 0.2)',
    green: 'rgb(75, 192, 192, 0.2)',
    blue: 'rgb(54, 162, 235, 0.2)',
    purple: 'rgb(153, 102, 255, 0.2)',
    grey: 'rgb(201, 203, 207, 0.2)'
};

let chart = $('#orderChart');
$(function () {
    createChart(months, completedOrder, canceledOrder);

    $('.selectpicker').on('change', function () {
        createChart(thirtyDays, completedOrder, canceledOrder);
    })
})
function createChart(labels, datasets1, datasets2) {
    new Chart(chart, {
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
                    scaleLabel: {
                        display: true,
                        labelString: '月份'
                    },
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


