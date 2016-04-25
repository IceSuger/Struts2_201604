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
    <title>Free HTML5 Bootstrap Admin Template</title>
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
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"> <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/>
                <span>Charisma</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="login.html">Logout</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-tint"></i><span
                        class="hidden-sm hidden-xs"> Change Theme / Skin</span>
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

            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Visit Site</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i> Dropdown <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
                <li>
                    <form class="navbar-search pull-left">
                        <input placeholder="Search" class="search-query form-control col-md-10" name="query"
                               type="text">
                    </form>
                </li>
            </ul>

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
                        <li class="nav-header">Main</li>
                        <li><a class="ajax-link" href="index.html"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
                        </li>
                        <li><a class="ajax-link" href="ui.html"><i class="glyphicon glyphicon-eye-open"></i><span> UI Features</span></a>
                        </li>
                        <li><a class="ajax-link" href="form.html"><i
                                    class="glyphicon glyphicon-edit"></i><span> Forms</span></a></li>
                        <li><a class="ajax-link" href="chart.html"><i class="glyphicon glyphicon-list-alt"></i><span> Charts</span></a>
                        </li>
                        <li><a class="ajax-link" href="typography.html"><i class="glyphicon glyphicon-font"></i><span> Typography</span></a>
                        </li>
                        <li><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-picture"></i><span> Gallery</span></a>
                        </li>
                        <li class="nav-header hidden-md">Sample Section</li>
                        <li><a class="ajax-link" href="table.html"><i
                                    class="glyphicon glyphicon-align-justify"></i><span> Tables</span></a></li>
                        <li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> Accordion Menu</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#">Child Menu 1</a></li>
                                <li><a href="#">Child Menu 2</a></li>
                            </ul>
                        </li>
                        <li><a class="ajax-link" href="calendar.html"><i class="glyphicon glyphicon-calendar"></i><span> Calendar</span></a>
                        </li>
                        <li><a class="ajax-link" href="grid.html"><i
                                    class="glyphicon glyphicon-th"></i><span> Grid</span></a></li>
                        <li><a href="tour.html"><i class="glyphicon glyphicon-globe"></i><span> Tour</span></a></li>
                        <li><a class="ajax-link" href="icon.html"><i
                                    class="glyphicon glyphicon-star"></i><span> Icons</span></a></li>
                        <li><a href="error.html"><i class="glyphicon glyphicon-ban-circle"></i><span> Error Page</span></a>
                        </li>
                        <li><a href="login.html"><i class="glyphicon glyphicon-lock"></i><span> Login Page</span></a>
                        </li>
                    </ul>
                    <label id="for-is-ajax" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
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
                    <h2> 节点分布及温度图示</h2>

                    <div class="box-icon">
                    	<button class="btn btn-info btn-sm sensor-add-click-map">添加节点</button>
                        <a href="#" class="btn btn-setting btn-round btn-default"><i
                                class="glyphicon glyphicon-cog"></i></a>
                        <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                class="glyphicon glyphicon-chevron-up"></i></a>
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
                <form action="Equipment_add" method="post">
                    <table>
                    <tr><td>所在建筑</td> <td>???</td></tr>
                    <tr><td>经度(longitude)</td> <td><input type="text" id="lng-input" name="equipment.longitude"></td></tr>
					<tr><td>纬度(latitude)</td> <td><input type="text" id="lat-input" name="equipment.latitude"></td></tr>
					
					<tr><td>高温报警线</td> <td><input type="text" value="35.0" name="equipment.high_limit"> ℃</td></tr>
					<tr><td>低温报警线</td> <td><input type="text" value="10.0" name="equipment.low_limit"> ℃</td></tr>
					<tr><td>节点部署日期</td> <td><input type="text" id="date-input" name="equipment.date"></td></tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
                    <input class="btn btn-primary" data-dismiss="modal" type="submit" value="确定添加" />
                </div>
                </form>
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
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Muhammad
                Usman</a> 2012 - 2015</p>

        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">Powered by: <a
                href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
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
    map.centerAndZoom(point, 15);             // 初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom(); // 允许滚轮缩放

    var points =[
        {"lng":116.418261,"lat":39.921984,"count":50},
        {"lng":116.423332,"lat":39.916532,"count":51},
        {"lng":116.419787,"lat":39.930658,"count":15},
        {"lng":116.418455,"lat":39.920921,"count":40},
        {"lng":116.418843,"lat":39.915516,"count":100},
        {"lng":116.42546,"lat":39.918503,"count":6},
        {"lng":116.423289,"lat":39.919989,"count":18},
        {"lng":116.418162,"lat":39.915051,"count":80},
        {"lng":116.422039,"lat":39.91782,"count":11},
        {"lng":116.41387,"lat":39.917253,"count":7},
        {"lng":116.41773,"lat":39.919426,"count":42},
        {"lng":116.421107,"lat":39.916445,"count":4},
        {"lng":116.417521,"lat":39.917943,"count":27},
        {"lng":116.419812,"lat":39.920836,"count":23},
        {"lng":116.420682,"lat":39.91463,"count":60},
        {"lng":116.415424,"lat":39.924675,"count":8},
        {"lng":116.419242,"lat":39.914509,"count":15},
        {"lng":116.422766,"lat":39.921408,"count":25},
        {"lng":116.421674,"lat":39.924396,"count":21},
        {"lng":116.427268,"lat":39.92267,"count":1},
        {"lng":116.417721,"lat":39.920034,"count":51},
        {"lng":116.412456,"lat":39.92667,"count":7},
        {"lng":116.420432,"lat":39.919114,"count":11},
        {"lng":116.425013,"lat":39.921611,"count":35},
        {"lng":116.418733,"lat":39.931037,"count":22},
        {"lng":116.419336,"lat":39.931134,"count":4},
        {"lng":116.413557,"lat":39.923254,"count":5},
        {"lng":116.418367,"lat":39.92943,"count":3},
        {"lng":116.424312,"lat":39.919621,"count":100},
        {"lng":116.423874,"lat":39.919447,"count":87},
        {"lng":116.424225,"lat":39.923091,"count":32},
        {"lng":116.417801,"lat":39.921854,"count":44},
        {"lng":116.417129,"lat":39.928227,"count":21},
        {"lng":116.426426,"lat":39.922286,"count":80},
        {"lng":116.421597,"lat":39.91948,"count":32},
        {"lng":116.423895,"lat":39.920787,"count":26},
        {"lng":116.423563,"lat":39.921197,"count":17},
        {"lng":116.417982,"lat":39.922547,"count":17},
        {"lng":116.426126,"lat":39.921938,"count":25},
        {"lng":116.42326,"lat":39.915782,"count":100},
        {"lng":116.419239,"lat":39.916759,"count":39},
        {"lng":116.417185,"lat":39.929123,"count":11},
        {"lng":116.417237,"lat":39.927518,"count":9},
        {"lng":116.417784,"lat":39.915754,"count":47},
        {"lng":116.420193,"lat":39.917061,"count":52},
        {"lng":116.422735,"lat":39.915619,"count":100},
        {"lng":116.418495,"lat":39.915958,"count":46},
        {"lng":116.416292,"lat":39.931166,"count":9},
        {"lng":116.419916,"lat":39.924055,"count":8},
        {"lng":116.42189,"lat":39.921308,"count":11},
        {"lng":116.413765,"lat":39.929376,"count":3},
        {"lng":116.418232,"lat":39.920348,"count":50},
        {"lng":116.417554,"lat":39.930511,"count":15},
        {"lng":116.418568,"lat":39.918161,"count":23},
        {"lng":116.413461,"lat":39.926306,"count":3},
        {"lng":116.42232,"lat":39.92161,"count":13},
        {"lng":116.4174,"lat":39.928616,"count":6},
        {"lng":116.424679,"lat":39.915499,"count":21},
        {"lng":116.42171,"lat":39.915738,"count":29},
        {"lng":116.417836,"lat":39.916998,"count":99},
        {"lng":116.420755,"lat":39.928001,"count":10},
        {"lng":116.414077,"lat":39.930655,"count":14},
        {"lng":116.426092,"lat":39.922995,"count":16},
        {"lng":116.41535,"lat":39.931054,"count":15},
        {"lng":116.413022,"lat":39.921895,"count":13},
        {"lng":116.415551,"lat":39.913373,"count":17},
        {"lng":116.421191,"lat":39.926572,"count":1},
        {"lng":116.419612,"lat":39.917119,"count":9},
        {"lng":116.418237,"lat":39.921337,"count":54},
        {"lng":116.423776,"lat":39.921919,"count":26},
        {"lng":116.417694,"lat":39.92536,"count":17},
        {"lng":116.415377,"lat":39.914137,"count":19},
        {"lng":116.417434,"lat":39.914394,"count":43},
        {"lng":116.42588,"lat":39.922622,"count":27},
        {"lng":116.418345,"lat":39.919467,"count":8},
        {"lng":116.426883,"lat":39.917171,"count":3},
        {"lng":116.423877,"lat":39.916659,"count":34},
        {"lng":116.415712,"lat":39.915613,"count":14},
        {"lng":116.419869,"lat":39.931416,"count":12},
        {"lng":116.416956,"lat":39.925377,"count":11},
        {"lng":116.42066,"lat":39.925017,"count":38},
        {"lng":116.416244,"lat":39.920215,"count":91},
        {"lng":116.41929,"lat":39.915908,"count":54},
        {"lng":116.422116,"lat":39.919658,"count":21},
        {"lng":116.4183,"lat":39.925015,"count":15},
        {"lng":116.421969,"lat":39.913527,"count":3},
        {"lng":116.422936,"lat":39.921854,"count":24},
        {"lng":116.41905,"lat":39.929217,"count":12},
        {"lng":116.424579,"lat":39.914987,"count":57},
        {"lng":116.42076,"lat":39.915251,"count":70},
        {"lng":116.425867,"lat":39.918989,"count":8}];

    if(!isSupportCanvas()){
        alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
    }
    //详细的参数,可以查看heatmap.js的文档 https://github.com/pa7/heatmap.js/blob/master/README.md
    //参数说明如下:
    /* visible 热力图是否显示,默认为true
     * opacity 热力的透明度,1-100
     * radius 势力图的每个点的半径大小
     * gradient  {JSON} 热力图的渐变区间 . gradient如下所示
     *	{
     .2:'rgb(0, 255, 255)',
     .5:'rgb(0, 110, 255)',
     .8:'rgb(100, 0, 255)'
     }
     其中 key 表示插值的位置, 0~1.
     value 为颜色值.
     */
    heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20});
    map.addOverlay(heatmapOverlay);
    heatmapOverlay.setDataSet({data:points,max:100});
    //是否显示热力图
    function openHeatmap(){
        heatmapOverlay.show();
    }
    function closeHeatmap(){
        heatmapOverlay.hide();
    }
    closeHeatmap();
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
    //点击地图，获取点击处的经纬度
	function addSensor(e){
		//alert(e.point.lng + ", " + e.point.lat);
		map.removeEventListener("click", addSensor);
		$('#lng-input').val(e.point.lng);
		$('#lat-input').val(e.point.lat);
		var myDate = new Date();
		$('#date-input').val(myDate.toLocaleString());
		$('#sensorAdd').modal('show');
	}
    $('.sensor-add-click-map').click(function (e) {
        e.preventDefault();
        map.addEventListener("click", addSensor);
    });
    
	
</script>

</body>
</html>