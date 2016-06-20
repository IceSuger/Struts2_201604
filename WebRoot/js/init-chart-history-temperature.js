function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
var sensor_id_for_drawing = GetQueryString("sensor_id");
var date =  GetQueryString("date");
var high = [], low = [];
//chart with points
function refresh(){
	var min = [], max = [];

    /*for (var i = 0; i < 10; i += 0.5) {
        sin.push([i, Math.sin(i) / i]);
        cos.push([i, Math.cos(i)]);
    }*/
	//sensor_id, date 作为参数
	//每小时数据返回min max
	//空的，填0
	
	
	//ajax请求
	$.ajax({
		url: "Record_listMaxAndMin?sensor_id="+sensor_id_for_drawing+"&date="+date //2016-06-05"//+//这里弄个日历插件，选日期，YYYY-MM-DD
       , type: "GET"
       , success: function( record, textStatus, jqXHR ){
           // record 是返回的数据
           // textStatus 可能为"success"、"notmodified"等
           // jqXHR 是经过jQuery封装的XMLHttpRequest对象
		   
		   console.log(record);
		   
		   //下面是最终实际要用的两个数组 max 和 min，用于画各自的曲线
		   for(var i =0; i<24; i++)
		   {
				if(record.recordsMaxMin[i] )
				{
				   max.push([record.recordsMaxMin[i].hour, record.recordsMaxMin[i].max]);
				   min.push([record.recordsMaxMin[i].hour, record.recordsMaxMin[i].min]);
				}
				else
				{
					max.push([i, ]);
				    min.push([i, ]);
				}
			}
			console.log(min);
			
			//----下面是画曲线
			var plot = $.plot($("#history"),
			[
				{ data: max, label: "最高温度"},
				{ data: min, label: "最低温度"},
				{ data: high, label: "高温报警线"},
				{ data: low, label: "低温报警线"},
			], {
				series: {
					lines: { show: true  },
					points: { show: true }
				},
				grid: { hoverable: true, clickable: true, backgroundColor: { colors: ["#fff", "#eee"] } },
				yaxis: { min: 0, max: 50 },
				//xaxis: { min:0, max:23, pad:1 },
				xaxis: {ticks: ['00','01', '02','03', '04','05', '06','07', '08','09', '10','11', '12','13', '14','15', '16','17', '18','19', '20','21', '22','23']},
				colors: ["#FF8C31", "#3C67A5", "#F08080", "#A4D3EE"]
			});

		function showTooltip(x, y, contents) {
			$('<div id="tooltip">' + contents + '</div>').css({
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5,
				border: '1px solid #fdd',
				padding: '2px',
				'background-color': '#dfeffc',
				opacity: 0.80
			}).appendTo("body").fadeIn(200);
		}
		var previousPoint = null;
		$("#history").bind("plothover", function (event, pos, item) {

			if (item) {
				if (previousPoint != item.dataIndex) {
					previousPoint = item.dataIndex;

					$("#tooltip").remove();
					var x = item.datapoint[0].toFixed(0),
						y = item.datapoint[1].toFixed(2);

					showTooltip(item.pageX, item.pageY,
						 "在" + x + "点至"+(item.datapoint[0]+1).toFixed(0)+"点之间的"+item.series.label+"为 " + y +" ℃");
				}
			}
			else {
				$("#tooltip").remove();
				previousPoint = null;
			}
		});

       }
    });
    
}

function getLimits(){

	$.ajax({
		url: "Sensor_find?building_id="+sensor_id_for_drawing
       , type: "GET"
       , success: function( data, textStatus, jqXHR ){
			$('#sensor-id').text(sensor_id_for_drawing);
			$('#sensor-position').text(data.Sensor.position_detail);
			$('#sensor-level').text(data.Sensor.level);
			
			high_limit = data.Sensor.high_limit;
			low_limit = data.Sensor.low_limit;
			high.push([0,high_limit]);
			high.push([24,high_limit]);
			low.push([0,low_limit]);
			low.push([24,low_limit]);
			refresh();
	}});
}

if ($("#history").length) {
    getLimits();
}
$('#datepick').val(date);
//date = $('#datepick').val();
		console.log(date);
$('#btn-redraw').click(function(){
		date = $('#datepick').val();
		console.log(date);
		refresh();
});
