
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tools.DBUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="tools.DBUtil"
    import="java.sql.Connection"
    import="java.sql.ResultSet"
    import="java.io.IOException"
    %>   
<!DOCTYPE html>
<html>
    
    <head>
        <title>班级信息管理</title>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js">
        </script>
        <script charset ="UTF-8">
        
      
        </script>
    </head>
    
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">欢迎使用宇宙无敌排课系统</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>管理员<i class="caret"></i>

                                </a>
                                
                                <ul class="dropdown-menu">
                                    <li>
                                     
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
                            <a href="index.jsp"><i class="icon-chevron-right"></i> 首页</a>
                        </li>
                        <li>
                            <a href="calendar.jsp"><i class="icon-chevron-right"></i> 管理教师信息</a>
                        </li>
                        <li>
                            <a href="stats.jsp"><i class="icon-chevron-right"></i> 课程信息管理</a>
                        </li>
                        <li>
                            <a href="form.jsp"><i class="icon-chevron-right"></i> 课表设置</a>
                        </li>
                        <li>
                            <a href="tables.jsp"><i class="icon-chevron-right"></i> 管理年级信息</a>
                        </li>
                        
                    </ul>
                </div>
                <!--/span-->
                <div class="span10" id="content">
                
							<div class="alert alert-success">
							<form action="form3.jsp" method="post">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>请选择你要进行修改的年级与班级</h4>
                            <br>
                            
                            <select name="selectyear">
                            <option><%=request.getParameter("selectyear") %></option>
                            </select>
                            <select name="selectclazz">
                        	<%
                        	String year=request.getParameter("selectyear");
                        	String sql="select clazzname from clazz where year="+year+"";
                        	System.out.println("from2测试点"+year);
                        	List<Map<String, Object>> clazzlist=DBUtils.query(sql);
                        	for(Map<String, Object> clazz: clazzlist){
                        		%>
                        		<option><%=clazz.get("clazzname") %></option>
                        		<%
                        	}
                        	%>
                        	
                        	</select>
                        	<div class="muted pull-left">
                                    <button  class="btn btn-primary">确定班级</button>
                                    </div>
                        		</form>
                        	</div>
                        	
                    
                    <div class="row-fluid">
                        <!-- block -->
                      
                        <!-- /block -->
                    </div>

                    <div class="row-fluid">
                        <!-- block -->
                        
                        <!-- /block -->
                    </div>

                    <div class="row-fluid">
                        <!-- block -->
                        
                        <!-- /block -->
                    </div>

                    <div class="row-fluid">
                        <!-- block -->
                       
                        <!-- /block -->
                    </div>

                    <div class="row-fluid">
                        <!-- block -->
                        
                        <!-- /block -->
                    </div>

                    <div class="row-fluid">
                        <!-- block -->
                        
                        <!-- /block -->
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

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>
        <script>
        $(function() {
            
        });
        </script>
    </body>

</html>