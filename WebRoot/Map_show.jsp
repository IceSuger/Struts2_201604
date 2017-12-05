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
    <title>老师在哪</title>
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

	<!-- 城市选择相关js -->
	<script type="text/javascript" src="js/jquery.citys.js"></script>
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
    <!-- 实时曲线部分的CSS -->
    <style type="text/css">
        .parallel{width:300;float:left;}
        
    </style>

</head>

<body>
    <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <a class="navbar-brand" href="Map_show"> <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/>
                老师在哪</a>

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
                        <li><a class="ajax-link" href="Sensor_list"><i
                                    class="glyphicon glyphicon-align-justify"></i><span> 传感器节点管理</span></a></li>
                        <li><a class="ajax-link" href="Alarm_list"><i class="glyphicon glyphicon-calendar"></i><span> 报警历史</span></a>
                        </li>
						<li><a class="ajax-link" href="Alarm_list"><i class="glyphicon glyphicon-calendar"></i><span> 报警历史</span></a>
                        </li>
						<li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 统计分析</span></a>
                            <ul class="nav nav-pills nav-stacked">
								<li><a href="#">热源相关统计分析</a></li>
								<li><a href="#">用户用热计费</a></li>
                                <li><a href="#">失水失热分析</a></li>
                                <li><a href="#">供热能效评价</a></li>
                            </ul>
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
                    <h2> 老师分布</h2>
                    
                    <div class="box-icon citys" id="demo2">
                    	<!-- 地点手动输入
                    	<input id="locationInput" class="places" type="text" name="placeinputbox" value=""> -->
                    	<!-- 城市选择（id demo2是用于城市选择代码的） -->
                    	
	                    	<select name="province"></select>
			                <select name="city"></select>
			                <select name="area"></select>
                    	<button class="btn btn-info btn-sm search-teachers">搜索老师</button>
                    	<!-- 
						<button class="btn btn-info btn-sm show-or-hide-all-markers1">隐藏一级网节点标记</button>
						<button class="btn btn-info btn-sm show-or-hide-all-markers2">隐藏二级网节点标记</button>
                    	<button class="btn btn-info btn-sm show-or-hide-heatmap1">隐藏一级网热图</button>
						<button class="btn btn-info btn-sm show-or-hide-heatmap2">隐藏二级网热图</button>
						 -->
						<input id="teacherType" type="text" value="">
						<input id="dist" type="text" value="3">
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
                <form id="equip-add-form" action="Sensor_add" method="post">
                    <table>
                    <tr><td>节点真实id</td> <td><select id="select_building_id" name="sensor.building_id"/></td></tr>
                    <tr><td>经度(longitude)</td> <td><input type="text" id="lng-input" name="sensor.longitude"></td></tr>
					<tr><td>纬度(latitude)</td> <td><input type="text" id="lat-input" name="sensor.latitude"></td></tr>
					<tr><td>管网层级</td> <td><select id="select_building_id" name="sensor.level">
							<option value="1">1</option>
							<option value="2">2</option>
							</td></tr>
					
					<tr><td>高温报警线</td> <td><input type="text" value="35.0" name="sensor.high_limit"> ℃</td></tr>
					<tr><td>低温报警线</td> <td><input type="text" value="10.0" name="sensor.low_limit"> ℃</td></tr>
					<tr><td>节点部署日期</td> <td><input type="text" id="date-input" name="sensor.date"></td></tr>
					<tr><td>部署位置详情</td> <td><input type="text" name="sensor.position_detail"></td></tr>
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
	<!-- 节点详情 dialog -->
    <div class="modal fade" id="sensorDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>节点详情</h3>
                </div>
                <div class="modal-body">
                    <table class="parallel">
                    <tr><td>节点真实id</td> <td><a id="sensor-building_id"></a></td></tr>
                    <tr><td>经度(longitude)</td> <td><a id="sensor-longitude"></a></td></tr>
					<tr><td>纬度(latitude)</td> <td><a id="sensor-latitude"></a></td></tr>
					<tr><td>管网层级</td> <td><a id="sensor-level"></a></td></tr>
					
					<tr><td>高温报警线</td> <td><a id="sensor-high_limit"></a> ℃</td></tr>
					<tr><td>低温报警线</td> <td><a id="sensor-low_limit"></a> ℃</td></tr>
					<tr><td>节点部署日期</td> <td><a id="sensor-date"></a></td></tr>
					<tr><td>部署位置详情</td> <td><a id="sensor-position_detail"></a></td></tr>
                    </table>
               <!-- 实时曲线 -->
		<div id="realtimechart" class="parallel" style="width:250;height:222px;"></div>
		
	    <!-- 实时曲线结束 -->
                </div>
                <div class="modal-footer">
                    <a id="equip-update-btn" class="btn btn-info admin-see" data-dismiss="modal">修改</a>
                    <a id="equip-delete-btn" target="_self"  class="btn btn-danger admin-see" data-dismiss="modal">删除</a>
                    <a id="equip-history-btn" class="btn btn-success admin-see" data-dismiss="modal">历史温度查询</a>
                </div>
                
            </div>
        </div>
        
    </div>
	<!-- 节点详情 dialog结束 --> 
	
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
<script type="text/javascript" src="js/map_operate.js"></script>

<script type="text/javascript">
$('#equip-add-btn').click(function(){
	$('#equip-add-form').submit();
});
//定时向后台请求alarm数据
var reasons = [];
reasons.push("Not alarm");
reasons.push("超过高温限制");
reasons.push("超过低温限制");

var alarm_reported=[];
function fetch_alarms(){
	$.ajax({
        url: "Alarm_fetch"
       , type: "GET"
       , success: function( data0, textStatus, jqXHR ){
           // data0 是返回的数据
           // textStatus 可能为"success"、"notmodified"等
           // jqXHR 是经过jQuery封装的XMLHttpRequest对象
		   //console.log(data0.alarms);
				if(data0.alarms.length > 0)
				{
				//console.log('有报警信息');
				//console.log(data0.alarms.length);
					//说明有报警信息，循环对每个报警信息都生成一个noty
					for(var i=0; i<data0.alarms.length; i++)
					{
						if( $.inArray(data0.alarms[i].id, alarm_reported) == -1 )
						{
							options.layout = "bottomLeft";
							options.type = "error";
							options.text = "节点("+ data0.alarms[i].sensor_id +") " + reasons[data0.alarms[i].reason] + ", 时间为 "+ data0.alarms[i].time + " 温度为: "+data0.alarms[i].t +" !";
							//console.log(options.text);
							noty(options);
							alarm_reported.push(data0.alarms[i].id);
						}
					}
				}
		   }
	});
}
//setInterval("fetch_alarms();",2000);
</script>
<!-- 实时曲线相关js -->
<script src="bower_components/flot/excanvas.min.js"></script>
		<script src="bower_components/flot/jquery.flot.js"></script>
		<script src="js/init-chart.js"></script>
<!-- 城市选择相关js -->
<script type="text/javascript">
                $('#demo2').citys({
                    required:false,
                    nodata:'disabled',
                    onChange:function(data){
                        //var text = data['direct']?'(直辖市)':'';
                        //$('#place').text('当前选中地区：'+data['province']+text+' '+data['city']+' '+data['area']);
                        var placeText = data['province']+' '+data['city']+' '+data['area'];
                        map.centerAndZoom(placeText, 16); 
                    }
                });
                //$('#locationInput').places({
                //	required:false,
                //    nodata:'disabled',
                //	onChange:function(data){
               // 		map.centerAndZoom(data, 16);
                //	}
                //});
            </script>
</body>
</html>