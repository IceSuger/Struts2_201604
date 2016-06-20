var sensor_id_for_drawing;
var realtime_shown = false;


// we use an inline data source in the example, usually data would
// be fetched from a server
var data_plot = [], totalPoints = 30;//300

function getRandomData() {
    if (data.length > 0)
        data = data.slice(1);

    // do a random walk
    while (data.length < totalPoints) {
        var prev = data.length > 0 ? data[data.length - 1] : 50;
        var y = prev + Math.random() * 10 - 5;
        if (y < 0)
            y = 0;
        if (y > 100)
            y = 100;
        data.push(y);
    }

    // zip the generated y values with the x values
    var res = [];
    for (var i = 0; i < data.length; ++i)
        res.push([i, data[i]])
    return res;
}

function initTempData(){
	var res = [];
    for (var i = 0; i < data_plot.length; ++i)
        res.push([i, 20.0])
	
	return res;
}
function getTempData(){
	if (data_plot.length > 0)
        data_plot = data_plot.slice(1);
	else
	{
		while (data_plot.length < totalPoints-1) {
			y=20.0;
			data_plot.push(y);
		}
	}
	//放弃思路：last_record = 0;
	////console.log(sensor_id_for_drawing);
	//ajax请求该节点的最新温度record数据，并直接push该temperature到data
	$.ajax({
        url: "Record_latest?sensor_id="+sensor_id_for_drawing
       , type: "GET"
       , success: function( record, textStatus, jqXHR ){
           // record 是返回的数据
           // textStatus 可能为"success"、"notmodified"等
           // jqXHR 是经过jQuery封装的XMLHttpRequest对象
		   //console.log(record.record.temperature);
		   ////console.log(record.temperature);
		   data_plot.push(record.record.temperature);
       }
    });
	
	//放弃思路：记下该record的id。与last_record比较，相同，则push
	
	var res = [];
    for (var i = 0; i < data_plot.length; ++i)
        res.push([i, data_plot[i]])
	
	//console.log(data_plot);
    return res;
}

// setup control widget
var updateInterval = 600;//原来是30
$("#updateInterval").val(updateInterval).change(function () {
    var v = $(this).val();
    if (v && !isNaN(+v)) {
        updateInterval = +v;
        if (updateInterval < 1)
            updateInterval = 1;
        if (updateInterval > 2000)
            updateInterval = 2000;
        $(this).val("" + updateInterval);
    }
});


//realtime chart
if ($("#realtimechart").length ) {
    var options = {
        series: { shadowSize: 1 }, // drawing is faster without shadows
        yaxis: { min: 10, max: 45 },
        xaxis: { min: 0, max:30, show: true }
    };
    var plot = $.plot($("#realtimechart"), [ initTempData() ], options);
	//var plot;
	
    function update() {
		//console.log(realtime_shown);
		if(realtime_shown)
		{
			//plot = $.plot($("#realtimechart"), [ getTempData() ], options);
			
			plot.setData([ getTempData() ]);
			plot.draw();
		}

        setTimeout(update, updateInterval);
    }

    update();
}