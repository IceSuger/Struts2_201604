	var map = new BMap.Map("map-container");          // 创建地图实例
    //var point = new BMap.Point(126.637968,45.751664);//哈工大图书馆门口的经纬度
	var point = new BMap.Point("116.334417","39.983799");//知春里附近的某个经纬度
	/*var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			// var mk = new BMap.Marker(r.point);
			// map.addOverlay(mk);
			map.panTo(r.point);
			//alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			//alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})*/

	//map.centerAndZoom(point, 16);             // 初始化地图，设置中心点坐标和地图级别
	map.centerAndZoom("河南省 郑州市", 16); 
    var markers1 = [];//保存全部的markers的引用，用于同时隐藏/显示它们
	var markers2 = [];//保存全部的markers的引用，用于同时隐藏/显示它们
	var markers_teacher = [];
    var show_Heatmap1 = false;//布尔型量，表示当前页面上是否显示热图（一级管网）
	var show_Heatmap2 = true;//布尔型量，表示当前页面上是否显示热图(二级管网)
    var show_markers1 = true;//布尔型量，表示当前页面上是否显示markers（一级管网）
	var show_markers2 = true;//布尔型量，表示当前页面上是否显示markers（二级管网）
	var dataset1 = [];//保存一级管网的points，以备热图绘制
	var dataset2 = [];//保存二级管网的points，以备热图绘制
	var heatmapOverlay1;
	var heatmapOverlay2;
    
    //map.centerAndZoom('哈尔滨', 20);
    map.enableScrollWheelZoom(); // 允许滚轮缩放
    // if(!isSupportCanvas()){
        // alert('请在chrome、safari、IE8+以上浏览器使用本系统。')
    // }
    /*heatmapOverlay1 = new BMapLib.HeatmapOverlay({"radius":20});
	heatmapOverlay2 = new BMapLib.HeatmapOverlay({"radius":20});
    map.addOverlay(heatmapOverlay1);
	map.addOverlay(heatmapOverlay2);*/
	
	/*
	//通过ajax，从服务器获取所有节点的数据（经纬度、温度、节点id）
    //var points = null;
    $.ajax({//一级管网
        url: "Sensor_listPoints?level=1"
       , type: "GET"
       , success: function( data, textStatus, jqXHR ){
           // data 是返回的数据
           // textStatus 可能为"success"、"notmodified"等
           // jqXHR 是经过jQuery封装的XMLHttpRequest对象
           ////console.log(data);
           //points = data.points;
           //heatmapOverlay1.setDataSet({data:data.points,max:100});
		   dataset1 = data.points;
           displayMarkerOfSensors1(data);
       }
   });
   $.ajax({//二级管网
        url: "Sensor_listPoints?level=2"
       , type: "GET"
       , success: function( data, textStatus, jqXHR ){
           // data 是返回的数据
           // textStatus 可能为"success"、"notmodified"等
           // jqXHR 是经过jQuery封装的XMLHttpRequest对象
           ////console.log(data);
           //points = data.points;
           //heatmapOverlay2.setDataSet({data:data.points,max:100});
		   dataset2 = data.points;
           displayMarkerOfSensors2(data);
       }
   });
	*/
	
    /**
	* 	根据输入的老师类别、从地图上获取的中心位置、搜索范围距离（公里），请求范围内老师列表。
	*/
	function showTeachers(teacherType, centerX, centerY, dist){
		if(dist=='')
		{
			dist=3;
		}
		if(teacherType=='undefined')
		{
			teacherType='';
		}
		console.log("lng:"+centerX);
		$.ajax({
			url: "Teacher_listPoints?teacherType=" + teacherType + "&centerX=" + centerX + "&centerY=" + centerY + "&dist=" + dist
			,type: "GET"
			,success: function( data, textStatus, jqXHR ){
				dataset_teacher_point = data.points;
				console.log(data);
				displayMarkerOfTeachers(data);
			}
		});
	}
	/*
	$('#searchTeachers').click(function(){
		showTeachers($('#teacherType').val(), $('#'), $('#'), $('#distance').val());
    });*/
	//点击地图，获取点击处的经纬度，读取搜索框里的条件，以点击处作为搜索范围中心搜索老师们
	function searchTeachers(e){
		//先把原有的markers干掉
		map.clearOverlays();
		
		map.removeEventListener("click", searchTeachers);
		showTeachers($('#teacherType').val(), e.point.lng, e.point.lat, $('#dist').val());
		/*$('#lng-input').val(e.point.lng);
		$('#lat-input').val(e.point.lat);
		$('#date-input').val(getNowFormatDate());
		$('#sensorAdd').modal('show');
		listUnusedIds();*/
	}
	
	
   
   
    // // heatmapOverlay.setDataSet({data:points,max:100});
    // //是否显示热力图
    // function openHeatmap1(){
		// heatmapOverlay1 = new BMapLib.HeatmapOverlay({"radius":20});
		// map.addOverlay(heatmapOverlay1);
		// heatmapOverlay1.setDataSet({data:dataset1,max:100});
        // heatmapOverlay1.show();
    // }
    // function closeHeatmap1(){
        // heatmapOverlay1.hide();
		// map.removeOverlay(heatmapOverlay1);
    // }
	// function openHeatmap2(){
		// heatmapOverlay2 = new BMapLib.HeatmapOverlay({"radius":20});
		// map.addOverlay(heatmapOverlay2);
		// heatmapOverlay2.setDataSet({data:dataset2,max:100});
        // heatmapOverlay2.show();
    // }
    // function closeHeatmap2(){
        // heatmapOverlay2.hide();
		// map.removeOverlay(heatmapOverlay2);
    // }
    // openHeatmap2();
    // function setGradient(){
        // /*格式如下所示:
         // {
         // 0:'rgb(102, 255, 0)',
         // .5:'rgb(255, 170, 0)',
         // 1:'rgb(255, 0, 0)'
         // }*/
        // var gradient = {};
        // var colors = document.querySelectorAll("input[type='color']");
        // colors = [].slice.call(colors,0);
        // colors.forEach(function(ele){
            // gradient[ele.getAttribute("data-key")] = ele.value;
        // });
        // heatmapOverlay1.setOptions({"gradient":gradient});
		// heatmapOverlay2.setOptions({"gradient":gradient});
    // }
    // //判断浏览区是否支持canvas
    // function isSupportCanvas(){
        // var elem = document.createElement('canvas');
        // return !!(elem.getContext && elem.getContext('2d'));
    // }
	
	// function findSensor(building_id){
		// ////console.log('wtf????');
		// //通过ajax向后台请求id代表的节点的信息，不包括温度
		// $.ajax({
        // url: "Sensor_find?building_id="+building_id
       // , type: "GET"
       // , success: function( data0, textStatus, jqXHR ){
           // // data0 是返回的数据
           // // textStatus 可能为"success"、"notmodified"等
           // // jqXHR 是经过jQuery封装的XMLHttpRequest对象
		   // var data = data0.sensor;
           // console.log(data);
		   // $('#sensor-building_id').text(data.building_id);
		   // $('#sensor-longitude').text(data.longitude);
		   // $('#sensor-latitude').text(data.latitude);
		   // $('#sensor-level').text(data.level);
		   // $('#sensor-high_limit').text(data.high_limit);
		   // $('#sensor-low_limit').text(data.low_limit);
		   // $('#sensor-date').text(data.date);
		   // $('#sensor-position_detail').text(data.position_detail);
		   // }
	   // });
	// }
	function findAndShowTeacherWindow(uniqueId, point){
		//通过ajax向后台请求id代表的老师的简单信息
		$.ajax({
        url: "Teacher_find?uniqueId="+uniqueId
       , type: "GET"
       , success: function( data0, textStatus, jqXHR ){
           // data0 是返回的数据
           // textStatus 可能为"success"、"notmodified"等
           // jqXHR 是经过jQuery封装的XMLHttpRequest对象
		   var data = data0.teacher;
           console.log(data0);
		   console.log(data);
		   avatarUrl = data.avatarUrl;
		   teacherName = data.name;
		   intro = data.intro;
		   score = data.score;
		   /**
			*	点击marker，显示老师简单信息
			*/
			//添加带头像的老师信息窗口
			var sContent =
				"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+ teacherName + "</h4>" + 
				"<img style='float:right;margin:4px' id='imgDemo' src=" + avatarUrl + " width='64' height='64'/>" + 
				"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + intro + "</p>" + 
				"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>评价：" + score + " 分</p>" + 
				"</div>";
			var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
			map.openInfoWindow(infoWindow,point); //开启信息窗口
		   }
	   });
	}
 	// // 编写自定义函数,放置节点，并创建标注
	// function addMarker1(point){
 		// ////console.log(point.id+" lng:"+point.lng+" lat:"+point.lat);
      // //point 是json中 points里的一个元素
	  // var marker = new BMap.Marker(new BMap.Point(point.lng,point.lat));
      
	  // //var label = new BMap.Label(point.count, {offset:new BMap.Size(20,-10)});
	  // //marker.setLabel(label);
	  // marker.count = point.count;
	  // //console.log(marker);
	  // marker.addEventListener('click',function(){
		  // //alert(point.id);
		  // findSensor(point.building_id);
		  // data_plot = [];
		  // sensor_id_for_drawing = point.building_id;
		  // //console.log(sensor_id_for_drawing);
		  // $('#sensorDetail').modal('show');
		  // realtime_shown = true;
		  // $('#equip-delete-btn').attr('href','Sensor_delete?building_id='+point.building_id);
		  // $('#equip-update-btn').attr('href','Sensor_update?building_id='+point.building_id);
		  // //$('#equip-history-btn').attr('href','Record_history?sensor_id='+point.building_id+'&date="2016-06-05"');
		  // $('#equip-history-btn').click(function(){
					 // location.href = 'Record_history?sensor_id='+point.building_id+'&date=2016-06-05';
			// }); 
	  // });
	  // map.addOverlay(marker);
	  // markers1.push(marker);
	// }
	
	// function addMarker2(point){
 		// ////console.log(point.id+" lng:"+point.lng+" lat:"+point.lat);
      // //point 是json中 points里的一个元素
	  // var marker = new BMap.Marker(new BMap.Point(point.lng,point.lat));
      
	  // //var label = new BMap.Label(point.count, {offset:new BMap.Size(20,-10)});
	  // //marker.setLabel(label);
	  // marker.count = point.count;
	  // //console.log(marker);
	  // marker.addEventListener('click',function(){
		  // //alert(point.id);
		  // findSensor(point.building_id);
		  // data_plot = [];
		  // sensor_id_for_drawing = point.building_id;
		  // //console.log(sensor_id_for_drawing);
		  // $('#sensorDetail').modal('show');
		  // realtime_shown = true;
		  // $('#equip-delete-btn').attr('href','Sensor_delete?building_id='+point.building_id);
		  // $('#equip-update-btn').attr('href','Sensor_update?building_id='+point.building_id);
		  // //$('#equip-history-btn').attr('href','Record_history?sensor_id='+point.building_id+'&date="2016-06-05"');
		  // $('#equip-history-btn').click(function(){
					 // location.href = 'Record_history?sensor_id='+point.building_id+'&date=2016-06-05';
			// }); 
	  // });
	  // map.addOverlay(marker);
	  // markers2.push(marker);
	// }
	
	function addTeacherMarker(point){
		//point 是json中 points里的一个元素
		var marker = new BMap.Marker(new BMap.Point(point.x, point.y));
		//console.log(marker);
		  
		//var label = new BMap.Label(point.count, {offset:new BMap.Size(20,-10)});
		//marker.setLabel(label);
		//marker.count = point.count;
		//console.log(marker);
		marker.addEventListener('click',function(){
			/**
			*/
			findAndShowTeacherWindow(point.uniqueId, marker.point);
		});
		map.addOverlay(marker);
		markers_teacher.push(marker);
	}		
  	// //放置传感器节点marker
    // function displayMarkerOfSensors1(data){
    	
        // for (var i = 0; i < data.points.length; i++) {
          // //points.push(new BMap.Point(data.points[i][3], data.points[i][2]));
          // addMarker1(data.points[i]);
        // }
    // }
	// function displayMarkerOfSensors2(data){
    	
        // for (var i = 0; i < data.points.length; i++) {
          // //points.push(new BMap.Point(data.points[i][3], data.points[i][2]));
          // addMarker2(data.points[i]);
        // }
    // }
	function displayMarkerOfTeachers(data){
    	
        for (var i = 0; i < data.points.length; i++) {
          //points.push(new BMap.Point(data.points[i][3], data.points[i][2]));
          addTeacherMarker(data.points[i]);
        }
    }
    // //点击地图，获取点击处的经纬度，弹出添加节点的dialog
	// function addSensor(e){
		// //alert(e.point.lng + ", " + e.point.lat);
		// map.removeEventListener("click", addSensor);
		// $('#lng-input').val(e.point.lng);
		// $('#lat-input').val(e.point.lat);
		// $('#date-input').val(getNowFormatDate());
		// $('#sensorAdd').modal('show');
		// listUnusedIds();
	// }
    $('.search-teachers').click(function (e) {
        e.preventDefault();
        //map.addEventListener("click", addSensor);
		map.addEventListener("click", searchTeachers);
    });
    // $('.show-or-hide-all-markers1').click(function(){
    	// if(show_markers1 == true){
    		// show_markers1 = false;
    		// $('.show-or-hide-all-markers1').text('显示一级网节点标记');
    		// hideMarkers1();
    	// }else{
    		// show_markers1 = true;
    		// $('.show-or-hide-all-markers1').text('隐藏一级网节点标记');
    		// showMarkers1();
    	// }
    // });
	// $('.show-or-hide-all-markers2').click(function(){
    	// if(show_markers2 == true){
    		// show_markers2 = false;
    		// $('.show-or-hide-all-markers2').text('显示二级网节点标记');
    		// hideMarkers2();
    	// }else{
    		// show_markers2 = true;
    		// $('.show-or-hide-all-markers2').text('隐藏二级网节点标记');
    		// showMarkers2();
    	// }
    // });
    // $('.show-or-hide-heatmap1').click(function(){
    	// if(show_Heatmap1 == true){
    		// show_Heatmap1 = false;
    		// $('.show-or-hide-heatmap1').text('显示一级网热图');
    		// closeHeatmap1();
    	// }else{
    		// show_Heatmap1 = true;
    		// $('.show-or-hide-heatmap1').text('隐藏一级网热图');
    		// openHeatmap1();
    	// }
    // });
	// $('.show-or-hide-heatmap2').click(function(){
    	// if(show_Heatmap2 == true){
    		// show_Heatmap2 = false;
    		// $('.show-or-hide-heatmap2').text('显示二级网热图');
    		// closeHeatmap2();
    	// }else{
    		// show_Heatmap2 = true;
    		// $('.show-or-hide-heatmap2').text('隐藏二级网热图');
    		// openHeatmap2();
    	// }
    // });
    // //获取当前日期（用于填入节点添加的对话框）
    // function getNowFormatDate() {
        // var date = new Date();
        // var seperator1 = "-";
        // var seperator2 = ":";
        // var year = date.getFullYear();
        // var month = date.getMonth() + 1;
        // var strDate = date.getDate();
        // if (month >= 1 && month <= 9) {
            // month = "0" + month;
        // }
        // if (strDate >= 0 && strDate <= 9) {
            // strDate = "0" + strDate;
        // }
        // var currentdate = year + seperator1 + month + seperator1 + strDate
                // + " " + date.getHours() + seperator2 + date.getMinutes()
                // + seperator2 + date.getSeconds();
        // return currentdate;
    // }
    
    // //是否显示markers
    // function showMarkers1(){
    	// for(i in markers1){
    		// markers1[i].show();
    	// }
    // }
    // function hideMarkers1(){
    	// for(i in markers1){
    		// markers1[i].hide();
    	// }
    // }
	// function showMarkers2(){
    	// for(i in markers2){
    		// markers2[i].show();
    	// }
    // }
    // function hideMarkers2(){
    	// for(i in markers2){
    		// markers2[i].hide();
    	// }
    // }
	
	// function listUnusedIds(){
		// //通过ajax向后台请求未绑定的节点id的列表
		// $.ajax({
        // url: "Sensor_listUnusedIds"
       // , type: "GET"
       // , success: function( data, textStatus, jqXHR ){
           // // data0 是返回的数据
           // // textStatus 可能为"success"、"notmodified"等
           // // jqXHR 是经过jQuery封装的XMLHttpRequest对象
		   
		   // var data = data;
           // //console.log(data.unusedIds);
		   // for(var i=0; i<data.unusedIds.length; i++)
		   // {
				// $('#select_building_id').append("<option value="+data.unusedIds[i]+">"+data.unusedIds[i]+"</option>");
		   // }
		   // }
	   // });
	// }
	
	