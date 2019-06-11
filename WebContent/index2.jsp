<%@page import="tools.DBUtils"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tools.DBUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Date"
    import=" java.text.SimpleDateFormat"
    
    %>
<!DOCTYPE html>
<html class="no-js">    
    <head>
        <title>欢迎使用宇宙无敌排课系统</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">欢迎使用宇宙最强课表系统</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                            <%
                            request.setCharacterEncoding("utf-8");
                            String name=request.getAttribute("name").toString();
                            
								
                            System.out.println("index2界面的测试点一"+name);
                            %>
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><%=name %><i class="caret"></i>

                                </a>
                                
                                
                                <ul class="dropdown-menu">
                                    <li>
                                    <%
                                    request.setCharacterEncoding("utf-8");
                                    response.setCharacterEncoding("utf-8");
                                    System.out.println(name+"index2测试点二"); %>
                                        <a tabindex="-1" href="inf?name=<%=name%>">个人资料</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="login.jsp">退出</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        
                                        
                           
                            
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li class="active">
                            <a href="formtoindex2?name=<%=name%>"><i class="icon-chevron-right"></i> 首页</a>
                        </li>
                        <li>
                            <a href="formteacher.jsp?name=<%=name%>"><i class="icon-chevron-right"></i> 查看我的课表</a>
                        </li>
                        
                        
                    </ul>
                </div>
                
                <!--/span-->
                <div class="span10" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>成功提示</h4>
                        	您已经登陆成功了</div>
                        	<div class="navbar">
                            	<div class="navbar-inner">
	                         <%
	                         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd ");//设置日期格式
	                         // new Date()为获取当前系统时间
	                         %>
	                         
	                         <h5>欢迎您,现在的日期是&nbsp;&nbsp;&nbsp;<%=df.format(new Date()) %></h5>      
                            	</div>
                        	</div>
                    	</div>
                    <div class="row-fluid">
                        <!-- block -->
                        
                        <!-- /block -->
                    </div>
                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                            
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                            
                            <!-- /block -->
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                           
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                 <div class="muted pull-left">通知</div>
                                    <div class="pull-right"><span class="badge badge-info">812</span>
                                    
                                    </div>
                                    
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        
									<% String sql="SELECT id,blog FROM blog ORDER BY id DESC ";
									 List<Map<String, Object>> bloglist=DBUtils.query(sql);
		                                for(Map<String, Object> blog: bloglist){
									%>
									<tr>
										<td><%=blog.get("blog") %></td>
									</tr>
									<tr>
										
									</tr>
									
									<%
		                                }
									%>
									
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                    </div>
                    <div class="row-fluid">
                        <!-- block -->
                        
                        <!-- /block -->
                    </div>
                </div>
            </div>
            <hr>
            <footer>
                <p>&copy; BootAdmin 2013</p>
            </footer>
        </div>
        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
        <script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
    </body>

</html>