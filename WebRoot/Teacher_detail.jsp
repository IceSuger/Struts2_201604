<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>Responsive HTML5 Website Template for Developers | 3rd Wave Media</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive HTML5 Website landing Page for Developers">
    <meta name="author" content="3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico">  
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> 
    <!-- Global CSS -->
    <link rel="stylesheet" href="assets_detailpage/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets_detailpage/plugins/font-awesome/css/font-awesome.css">
    <!-- github acitivity css -->
    <link rel="stylesheet" href="assets_detailpage/plugins/github-activity/dist/github-activity-0.1.1.min.css">
    <link rel="stylesheet" href="assets_detailpage/plugins/github-activity/dist/octicons/octicons.min.css">
    
    
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="assets_detailpage/css/styles.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head> 

<body>
	<s:push value="teacher">
    <!-- ******HEADER****** --> 
    <header class="header">
        <div class="container">                       
            <!-- <img class="profile-image img-responsive pull-left" src="assets_detailpage/images/profile.png" alt="James Lee" /> -->
			<img class="profile-image img-responsive pull-left" src="<s:property value="avatarUrl"/>"/>
            <div class="profile-content pull-left">
                <h1 class="name"><s:property value="name"/></h1>
                <h2 class="desc"><s:property value="teacherType" /></h2>   
                <ul class="social list-inline">
                    <li><a href="#intro"><i class="fa fa-twitter"></i></a></li>                   
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-github-alt"></i></a></li>                  
                    <li class="last-item"><a href="#"><i class="fa fa-hacker-news"></i></a></li>                 
                </ul> 
            </div><!--//profile-->
            <!-- <a class="btn btn-cta-primary pull-right" href="http://themes.3rdwavemedia.com/" target="_blank"><i class="fa fa-paper-plane"></i> Contact Me</a> -->             
        </div><!--//container-->
    </header><!--//header-->
    
    <div class="container sections-wrapper">
        <div class="row">
            <div class="primary col-md-8 col-sm-12 col-xs-12">
                <section class="about section">
                    <div class="section-inner">
                        <h2 class="heading" id="intro">简介</h2>
                        <div class="content">
							<s:property value="intro" />
                            
                        </div><!--//content-->
                    </div><!--//section-inner-->                 
                </section><!--//section-->
    
                
                <section class="projects section" id="success">
                    <div class="section-inner">
                        <h2 class="heading">个人履历</h2>
                        <div class="content">
							<s:iterator value="experience" var="e">
								<div class="item">
									<h3 class="title"><a href="#"><s:property value="#e.title"/></a></h3>
									<s:iterator value="#e.content" var="ee">
										<p class="summary"><s:property value="ee"/></p>
									</s:iterator>
								</div><!--//item-->
							</s:iterator>
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </section><!--//section-->
                
                <section class="experience section">
                    <div class="section-inner">
                        <h2 class="heading">成功案例</h2>
                        <div class="content">
							<s:iterator value="success" var="s">
								<div class="item">
									<h3 class="title"><s:property value="#s.title"/> - <span class="year">(<s:property value="#s.date"/>)</span></h3>
									<s:iterator value="#s.content" var="ss">
										<p><s:property value="ss"/></p>
									</s:iterator>
								</div><!--//item-->
							</s:iterator>
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </section><!--//section-->
				
				<section class="experience section">
                    <div class="section-inner">
                        <h2 class="heading">课程</h2>
                        <div class="content">
							<s:iterator value="courses" var="c">
								<div class="item">
									<h3 class="title"><s:property value="#c.name"/></h3>
									<p><s:property value="#c.introduce"/></p>
								</div><!--//item-->
							</s:iterator>
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </section><!--//section-->
                
                
            </div><!--//primary-->
            <div class="secondary col-md-4 col-sm-12 col-xs-12">
                 <aside class="info aside section">
                    <div class="section-inner">
                        <h2 class="heading sr-only">Basic Information</h2>
                        <div class="content">
                            <ul class="list-unstyled">
                                <li><i class="fa fa-map-marker"></i><span class="sr-only">Location:</span><s:property value="city" /></li>
                                <li><i class="fa fa-envelope-o"></i><span class="sr-only">Email:</span><s:property value="baseinfo" /></li>
								<li>学生总数：</span><s:property value="studentCount" /></li>
								<li>总教学时长：</span><s:property value="teachTimeCount" /> 小时</li>
                                <!-- <li><i class="fa fa-link"></i><span class="sr-only">Website:</span><a href="#">http://www.website.com</a></li> -->
                            </ul>
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </aside><!--//aside-->
                
                <aside class="skills aside section" id="commentsummary">
                    <div class="section-inner">
                        <h2 class="heading">总体评分</h2>
                        <div class="content">
                            <!-- <p class="intro">
                                Intro about your skills goes here. Keep the list lean and only show your primary skillset. You can always provide a link to your Linkedin or Coderwall profile so people can get more info there.</p>
                            -->
							
                            <div class="skillset">
                               
                                <div class="item">
                                    <h3 class="level-title"><s:property value="score" /><span class="level-label" data-toggle="tooltip" data-placement="left" data-animation="true" title="You can use the tooltip to add more info..."><!--可从summary中取信息写在这，如多少人给了评价等--></span></h3>
                                    <div class="level-bar">
                                        <div class="level-bar-inner" data-level=<s:property value="score_percent"/>>
                                        </div>                                      
                                    </div><!--//level-bar-->                                 
                                </div><!--//item-->
                                
                            </div>              
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </aside><!--//section-->
                
                <aside class="testimonials aside section">
                    <div class="section-inner">
                        <h2 class="heading">学生评价</h2>
                        <div class="content">
							<s:iterator value="comment" var="c">
								<div class="item">
									<blockquote class="quote">                                  
										<p><i class="fa fa-quote-left"></i><s:property value="#c.content" /></p>
									</blockquote>                
									<p class="source"><span class="name">Tim Adams</span><br /><span class="title">Curabitur commodo</span></p>                                                             
								</div><!--//item-->
							</s:iterator>
                            
                        </div><!--//content-->
                    </div><!--//section-inner-->
                </aside><!--//section-->
                
                <aside class="education aside section" id="tags">
                    <div class="section-inner">
                        <h2 class="heading">标签</h2>
                        <div class="content">
							<s:iterator value="tags" var="t">
							<span class="label label-theme"><s:property value="t"/></span>
							</s:iterator>
                        </div><!--//content-->
                    </div><!--//section-inner-->
                </aside><!--//section-->
                            
              
            </div><!--//secondary-->    
        </div><!--//row-->
    </div><!--//masonry-->
	</s:push>
    
    <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
                <small class="copyright">Designed with <i class="fa fa-heart"></i> by <a href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
        </div><!--//container-->
    </footer><!--//footer-->
 
    <!-- Javascript -->          
    <script type="text/javascript" src="assets_detailpage/plugins/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="assets_detailpage/plugins/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="assets_detailpage/plugins/bootstrap/js/bootstrap.min.js"></script>    
    <script type="text/javascript" src="assets_detailpage/plugins/jquery-rss/dist/jquery.rss.min.js"></script> 
    <!-- github activity plugin -->
    <script type="text/javascript" src="assets_detailpage/plugins/github-activity/dist/mustache/mustache.min.js"></script>
    <script type="text/javascript" src="assets_detailpage/plugins/github-activity/dist/github-activity-0.1.1.min.js"></script>
    <!-- custom js -->
    <script type="text/javascript" src="assets_detailpage/js/main.js"></script>            
</body>
</html> 

