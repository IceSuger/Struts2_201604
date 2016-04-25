<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!--
        ===
        This comment should NOT be removed.

        Charisma v2.0.0

        Copyright 2012-2014 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
        ===
    -->
    <meta charset="utf-8">
    <title>地图（热图）显示-热网温度监测系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="bower_components/jquery/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- 百度地图部分的CSS -->
    <style type="text/css">
        #map-container{height:550px;width:100%;}
        #r-result{width:100%;}
    </style>

</head>

<body>
    <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <a class="navbar-brand" href="Map_show"> <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/>
                热网温度监测系统</a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> 管理员</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">用户信息</a></li>
                    <li class="divider"></li>
                    <li><a href="login.html">登出</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-tint"></i><span
                        class="hidden-sm hidden-xs"> 更换皮肤</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" id="themes">
                    <li><a data-value="classic" href="#"><i class="whitespace"></i> Classic</a></li>
                    <li><a data-value="cerulean" href="#"><i class="whitespace"></i> Cerulean</a></li>
                    <li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
                    <li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
                    <li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
                    <li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
                    <li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
                    <li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
                    <li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
                </ul>
            </div>
            <!-- theme selector ends -->

            
        </div>
    </div>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">功能列表</li>
                        <li><a class="ajax-link" href="Map_show"><i class="glyphicon glyphicon-eye-open"></i><span> 地图/热图显示</span></a>
                        </li>
                        <li><a class="ajax-link" href="Equipment_list"><i
                                    class="glyphicon glyphicon-align-justify"></i><span> 传感器节点管理</span></a></li>
                        <li><a class="ajax-link" href="chart.html"><i class="glyphicon glyphicon-list-alt"></i><span> 通信拓扑展示</span></a>
                        </li>
                        <li><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-calendar"></i><span> 报警历史</span></a>
                        </li>
                        <li><a class="ajax-link" href="typography.html"><i class="glyphicon glyphicon-font"></i><span> 用户设置</span></a>
                        </li>
                        <li><a href="tour.html"><i class="glyphicon glyphicon-globe"></i><span> 使用向导</span></a></li>
                    </ul>
                    
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
                
                <div style ="color:red">
    <s:fielderror />
</div>
    <div class="row">
        <div class="box col-md-12">
            <div class="box-inner">
                <div class="box-header well" data-original-title="">
                    <h2> 节点分布及温度图示</h2>

                    <div class="box-icon">
                    	<button class="btn btn-info btn-sm sensor-add-click-map">添加节点</button>
                    	<button class="btn btn-info btn-sm show-or-hide-all-markers">隐藏节点标记</button>
                    	<button class="btn btn-info btn-sm show-or-hide-heatmap">隐藏热图</button>
                    </div>
                </div>
                <div class="box-content" id="map-container">
                    <!-- 百度地图显示在此 -->
				</div>
            </div>
        </div>
        <!--/span-->

    </div><!--/row-->

    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

    <hr>
    <!-- 节点添加 dialog -->
    <div class="modal fade" id="sensorAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>添加节点</h3>
                </div>
                <div class="modal-body">
                <form id="equip-add-form" action="Equipment_add" method="post">
                    <table>
                    <tr><td>所在建筑</td> <td>???</td></tr>
                    <tr><td>经度(longitude)</td> <td><input type="text" id="lng-input" name="equipment.longitude"></td></tr>
					<tr><td>纬度(latitude)</td> <td><input type="text" id="lat-input" name="equipment.latitude"></td></tr>
					
					<tr><td>高温报警线</td> <td><input type="text" value="35.0" name="equipment.high_limit"> ℃</td></tr>
					<tr><td>低温报警线</td> <td><input type="text" value="10.0" name="equipment.low_limit"> ℃</td></tr>
					<tr><td>节点部署日期</td> <td><input type="text" id="date-input" name="equipment.date"></td></tr>
                    </table>
                </form>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
                    <a id="equip-add-btn" class="btn btn-primary" data-dismiss="modal" value="" >确定添加</a>
                </div>
                
            </div>
        </div>
    </div>
	<!-- 节点添加 dialog结束 -->
	<!-- 原版的设置dialog -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Settings</h3>
                </div>
                <div class="modal-body">
                    <p>Here settings can be configured...</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 原版的设置dialog结束 -->
    <footer class="row">
    </footer>

</div><!--/.fluid-container-->

<!-- external javascript -->

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>

<!-- 百度地图/热力图相关js -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=mKpWvXUdwYVOZDVD6mPo1dhKA9PGgrkq"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
<script type="text/javascript">
    var map = new BMap.Map("map-container");          // 创建地图实例
    var point = new BMap.Point(116.418261, 39.921984);
    var markers = [];//保存全部的markers的引用，用于同时隐藏/显示它们
    var show_Heatmap = true;//布尔型量，表示当前页面上是否显示热图
    var show_markers = true;//布尔型量，表示当前页面上是否显示markers
    map.centerAndZoom(point, 16);             // 初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom(); // 允许滚轮缩放
    if(!isSupportCanvas()){
        alert('请在chrome、safari、IE8+以上浏览器使用本系统。')
    }
    heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20});
    map.addOverlay(heatmapOverlay);
  //通过ajax，从服务器获取所有节点的数据（经纬度、温度、节点id）
    //var points = null;
    $.ajax({
        url: "Equipment_listPoints"
       , type: "GET"
       , success: function( data, textStatus, jqXHR ){
           // data 是返回的数据
           // textStatus 可能为"success"、"notmodified"等
           // jqXHR 是经过jQuery封装的XMLHttpRequest对象
           console.log(data);
           //points = data.points;
           heatmapOverlay.setDataSet({data:data.points,max:100});
           displayMarkerOfSensors(data);
       }
   });
    //heatmapOverlay.setDataSet({data:points,max:100});
    //是否显示热力图
    function openHeatmap(){
        heatmapOverlay.show();
    }
    function closeHeatmap(){
        heatmapOverlay.hide();
    }
    openHeatmap();
    function setGradient(){
        /*格式如下所示:
         {
         0:'rgb(102, 255, 0)',
         .5:'rgb(255, 170, 0)',
         1:'rgb(255, 0, 0)'
         }*/
        var gradient = {};
        var colors = document.querySelectorAll("input[type='color']");
        colors = [].slice.call(colors,0);
        colors.forEach(function(ele){
            gradient[ele.getAttribute("data-key")] = ele.value;
        });
        heatmapOverlay.setOptions({"gradient":gradient});
    }
    //判断浏览区是否支持canvas
    function isSupportCanvas(){
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
 	// 编写自定义函数,放置节点，并创建标注
	function addMarker(point){
 		//console.log(point.id+" lng:"+point.lng+" lat:"+point.lat);
      //point 是json中 points里的一个元素
	  var marker = new BMap.Marker(new BMap.Point(point.lng,point.lat));
      //console.log(marker);
	  
	  //var label = new BMap.Label(point.count, {offset:new BMap.Size(20,-10)});
	 // marker.setLabel(label);
	  marker.addEventListener('click',function(){
		  alert(point.id);
	  });
	  map.addOverlay(marker);
	  markers.push(marker);
	}
  	//放置传感器节点marker
    function displayMarkerOfSensors(data){
    	
        for (var i = 0; i < data.points.length; i++) {
          //points.push(new BMap.Point(data.points[i][3], data.points[i][2]));
          addMarker(data.points[i]);
        }
    }
    //点击地图，获取点击处的经纬度，弹出添加节点的dialog
	function addSensor(e){
		//alert(e.point.lng + ", " + e.point.lat);
		map.removeEventListener("click", addSensor);
		$('#lng-input').val(e.point.lng);
		$('#lat-input').val(e.point.lat);
		$('#date-input').val(getNowFormatDate());
		$('#sensorAdd').modal('show');
	}
    $('.sensor-add-click-map').click(function (e) {
        e.preventDefault();
        map.addEventListener("click", addSensor);
    });
    $('.show-or-hide-all-markers').click(function(){
    	if(show_markers == true){
    		show_markers = false;
    		$('.show-or-hide-all-markers').text('显示节点标记');
    		hideMarkers();
    	}else{
    		show_markers = true;
    		$('.show-or-hide-all-markers').text('隐藏节点标记');
    		showMarkers();
    	}
    });
    $('.show-or-hide-heatmap').click(function(){
    	if(show_Heatmap == true){
    		show_Heatmap = false;
    		$('.show-or-hide-heatmap').text('显示热图');
    		closeHeatmap();
    	}else{
    		show_Heatmap = true;
    		$('.show-or-hide-heatmap').text('隐藏热图');
    		openHeatmap();
    	}
    });
    //获取当前日期（用于填入节点添加的对话框）
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate
                + " " + date.getHours() + seperator2 + date.getMinutes()
                + seperator2 + date.getSeconds();
        return currentdate;
    }
    
    //是否显示markers
    function showMarkers(){
    	for(i in markers){
    		markers[i].show();
    	}
    }
    function hideMarkers(){
    	for(i in markers){
    		markers[i].hide();
    	}
    }
	
</script>

<script type="text/javascript">
$('#equip-add-btn').click(function(){
	$('#equip-add-form').submit();
});
</script>
</body>
</html>