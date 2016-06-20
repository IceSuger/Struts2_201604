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
    <title>传感器节点管理-热网温度监测系统</title>
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
                        <li><a class="ajax-link" href="Sensor_list"><i
                                    class="glyphicon glyphicon-align-justify"></i><span> 传感器节点管理</span></a></li>
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
                

    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-user"></i> 传感器节点信息</h2>

        <div class="box-icon">
            </div>
    </div>
    <div class="box-content">
    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
        <th>节点真实id</th>
        <th>节点部署纬度</th>
        <th>节点部署经度</th>
		<th>管网层级</th>
		<th>高温报警线</th>
		<th>低温报警线</th>
		<th>部署日期</th>
		<th>部署位置详情</th>
        <th>操作</th>
    </tr>
	</thead>
	<tbody>
	<s:iterator value="sensors" var="e">
    <tr>
        <td class="center"><s:property value="#e.building_id" /></td>
        <td class="center"><s:property value="#e.latitude" /></td>
		<td class="center"><s:property value="#e.longitude" /></td>
		<td class="center"><s:property value="#e.level" /></td>
		<td class="center"><s:property value="#e.high_limit" /></td>
		<td class="center"><s:property value="#e.low_limit" /></td>
		<td class="center"><s:property value="#e.date" /></td>
		<td class="center"><s:property value="#e.position_detail" /></td>
        <td class="center">
            <a class="btn btn-success" href="#">
                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                查看
            </a>
            <a class="btn btn-info" href="#">
                <i class="glyphicon glyphicon-edit icon-white"></i>
                修改
            </a>
            <a class="btn btn-danger sensor-delete-btn" href="Sensor_delete?building_id=<s:property value="#e.building_id"/>">
                <i class="glyphicon glyphicon-trash icon-white"></i>
                删除
            </a>
        </td>
    </tr>
	</s:iterator>
	</tbody>
	</table>
	
    </div>
    </div>
    </div>
    <!--/span-->

    </div><!--/row-->


    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

    <hr>

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

<script type="text/javascript">
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
setInterval("fetch_alarms();",2000);
</script>

</body>
</html>

