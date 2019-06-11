<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tools.DBUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <script>
        function addclazz(){
		var subjectname=window.prompt("请输入新添加的课程的名称","");
		        	
		        	if(subjectname!=""&&subjectname!=null){
		        		window.location.href="addsubject?name="+subjectname+"";
		        	}else{
		        		return;
		        	}
        	
        }
        function delsubject(subjectid) {
        	var b=window.confirm("你确认要删除本门课程吗?");
           	if(b){
           		window.location.href="delsubject?subjectid="+subjectid+"";
           		}else{
           			returu;
           		}
		}
        function updatesubject(subjectid,subjectname) {
        	var newsubjectname=window.prompt("请输入你修改后的名称",subjectname);
     	   if(newsubjectname==subjectname||newsubjectname==""||newsubjectname==null){
           		return;
           	}
     	   else{
        		window.location.href="updatesubjectname?subjectname="+newsubjectname+"&id="+subjectid+"";
     	   }
		}
        
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
                    <a class="brand" href="#">欢迎使用宇宙无敌课表系统</a>
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
                        <ul class="nav">
                           
                            
                           
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
                            <a href="form.jsp?classid=0"><i class="icon-chevron-right"></i> 课表设置</a>
                        </li>
                        <li>
                            <a href="tables.jsp"><i class="icon-chevron-right"></i> 管理年级信息</a>
                        </li>
                        <li>
                            <a href="selectclass.jsp?classid=0"><i class="icon-chevron-right"></i> 按照班级查看课表</a>
                        </li>
                        <li>
                            <a href="selectteacherclass.jsp?name=null"><i class="icon-chevron-right"></i> 按照教师查看课表</a>
                        </li>
                    </ul>
                </div>
                
                <!--/span-->
                <div class="span10" id="content">
                    <div class="row-fluid">
                        
                        	
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
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">
                                    <button  class="btn btn-primary" onclick="addclazz()">添加课程</button>
                                    </div>
                                    <div class="pull-right"><span class="badge badge-info">17</span>

                                    </div>
                                </div>
                                
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>课程名称</th>
                                                <th>操作</th>
                                                
                                            </tr>
                                        </thead>
	                                        <%
	                                String sql="SELECT * FROM SUBJECT ";
	                                List<Map<String, Object>> subjectlist=DBUtils.query(sql);
	                                for(Map<String, Object> subject: subjectlist){
	                                	%>
	                                	<tbody>
                                            <tr>
                                                <td><%=subject.get("id") %></td>
                                                <td><%=subject.get("subjectname") %></td>
                                                <td>
                                                <a onclick="delsubject(<%=subject.get("id") %>)">删除课程</a>
                                                <a onclick="updatesubject(<%=subject.get("id") %>,'<%=subject.get("subjectname") %>')">修改课程名称</a>
                                                
                                                </td>
                                                
                                            </tr>
                                            
                                            
                                        </tbody>
	                                	
	                                	
	                                	<%
					            	  }
	                                
	                                %>
                                        
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                           
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