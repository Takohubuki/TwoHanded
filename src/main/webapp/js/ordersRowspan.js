function userHide(v) {//参数：输入要隐藏的列数，要查第几列，我的是第一列和第二列，所以上面是hide(0)和hide(1)

	tr = $("#example2 tr").length;// 获取当前表格中行数
	var mark = 0; //要合并的单元格数
	var index = 0; //起始行数
	let text = '';
	/*
     * 要合并单元格，需要存储两个参数，
     * 1，开始合并的单元格的第一行的行数，
     * 2.要合并的单元格的个数
     **/
	//判断 若只有一行数据，就是表头，则不做调整
	if (tr > 1) {
		//var i=1 比较当前的tr和上一个tr的值
		for (var i = 0; i < tr; i++) {
			// if (i >= 10 && (parseInt(i) % 10) === 0){
			// 	continue;
			// }

			var ford = $("#example2 tr:gt(0):eq(" + i + ") td:eq(" + parseInt(v) + ")").text();
			//根据下标获取单元格的值
			// tr:gt(0) 从下标0 开始获取
			// tr:gt(0):eq( i ) :i 标识 当前行的下标 ，0 开始
			// td:eq(0) 当前行的第一个单元格，下标从0开始
			var behind = $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + parseInt(v) + ")").text();

			if (ford !== "" && ford === behind) {
                $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + parseInt(v) + ")").hide();

                text = $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + 5 + ")").text().trim();
                if (text !== '已收货' && text !== '待确认收货') {
                    $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + 5 + ")").hide();
                }
                $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + 7 + ")").hide();
                mark = mark + 1;
            } else if (ford !== behind) {
                index = i - mark;
                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + parseInt(v) + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + parseInt(v) + ")").attr("class", "marge");

                if (text !== '已收货' && text !== '待确认收货') {
                    $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 5 + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
                    $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 5 + ")").attr("class", "marge");
                }

                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 7 + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 7 + ")").attr("class", "marge");

                //rowspan 列上横跨， colspan 行上横跨
                //后面的参数，表示横跨的单元格个数，
                //合并单元格就是将其他的单元格隐藏（hide）,或删除（remove）。
                //将一个单元格的rowspan 或colsspan 加大

                mark = 0;
            }
        }
    }
}

function mySoldOutHide(v) {//参数：输入要隐藏的列数，要查第几列，我的是第一列和第二列，所以上面是hide(0)和hide(1)

    tr = $("#example2 tr").length;// 获取当前表格中行数
    var mark = 0; //要合并的单元格数
    var index = 0; //起始行数
    /*
     * 要合并单元格，需要存储两个参数，
     * 1，开始合并的单元格的第一行的行数，
     * 2.要合并的单元格的个数
     **/
    //判断 若只有一行数据，就是表头，则不做调整
    if (tr > 1) {
        //var i=1 比较当前的tr和上一个tr的值
        for (var i = 0; i < tr; i++) {
            // if (i >= 10 && (parseInt(i) % 10) === 0){
            // 	continue;
            // }

            var ford = $("#example2 tr:gt(0):eq(" + i + ") td:eq(" + parseInt(v) + ")").text();
            //根据下标获取单元格的值
            // tr:gt(0) 从下标0 开始获取
            // tr:gt(0):eq( i ) :i 标识 当前行的下标 ，0 开始
            // td:eq(0) 当前行的第一个单元格，下标从0开始
            var behind = $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + parseInt(v) + ")").text();

            if (ford !== "" && ford === behind) {
                $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + parseInt(v) + ")").hide();
                $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + 6 + ")").hide();
                $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + 7 + ")").hide();
                mark = mark + 1;
            } else if (ford !== behind) {
                index = i - mark;
                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + parseInt(v) + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + parseInt(v) + ")").attr("class", "marge");

                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 6 + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 6 + ")").attr("class", "marge");

                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 7 + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
                $("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 7 + ")").attr("class", "marge");

                //rowspan 列上横跨， colspan 行上横跨
                //后面的参数，表示横跨的单元格个数，
                //合并单元格就是将其他的单元格隐藏（hide）,或删除（remove）。
                //将一个单元格的rowspan 或colsspan 加大

                mark = 0;
            }
        }
    }
}
function manageHide(v) {//参数：输入要隐藏的列数，要查第几列，我的是第一列和第二列，所以上面是hide(0)和hide(1)

	tr = $("#example2 tr").length;// 获取当前表格中行数
	var mark = 0; //要合并的单元格数
	var index = 0; //起始行数
	/*
     * 要合并单元格，需要存储两个参数，
     * 1，开始合并的单元格的第一行的行数，
     * 2.要合并的单元格的个数
     **/
	//判断 若只有一行数据，就是表头，则不做调整
	if (tr > 1) {
		//var i=1 比较当前的tr和上一个tr的值
		for (var i = 0; i < tr; i++) {
			// if (i >= 10 && (parseInt(i) % 10) === 0){
			// 	continue;
			// }

			var ford = $("#example2 tr:gt(0):eq(" + i + ") td:eq(" + parseInt(v) + ")").text();
			//根据下标获取单元格的值
			// tr:gt(0) 从下标0 开始获取
			// tr:gt(0):eq( i ) :i 标识 当前行的下标 ，0 开始
			// td:eq(0) 当前行的第一个单元格，下标从0开始
			var behind = $("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + parseInt(v) + ")").text();

			if (ford !== "" && ford === behind) {
				$("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + parseInt(v) + ")").hide();
				$("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + 1 + ")").hide();
				$("#example2 tr:gt(0):eq(" + (parseInt(i) + 1) + ") td:eq(" + 5 + ")").hide();
				mark = mark + 1;
			} else if (ford !== behind) {
				index = i - mark;
				$("#example2 tr:gt(0):eq(" + index + ") td:eq(" + parseInt(v) + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
				$("#example2 tr:gt(0):eq(" + index + ") td:eq(" + parseInt(v) + ")").attr("class", "marge");

				$("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 1 + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
				$("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 1 + ")").attr("class", "marge");

				$("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 5 + ")").attr("rowspan", mark + 1);//将当前的行加入属性rowspan，合并 mark+1行
				$("#example2 tr:gt(0):eq(" + index + ") td:eq(" + 5 + ")").attr("class", "marge");

				//rowspan 列上横跨， colspan 行上横跨
				//后面的参数，表示横跨的单元格个数，
				//合并单元格就是将其他的单元格隐藏（hide）,或删除（remove）。
				//将一个单元格的rowspan 或colsspan 加大

				mark = 0;
			}
		}
	}
}

