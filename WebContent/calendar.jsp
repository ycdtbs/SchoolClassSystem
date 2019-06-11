<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tools.DBUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
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
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js">
        
       </script>
       <script type="text/javascript">
       function delteacher(teacherid,teachername){
       	var b=window.confirm("你确认要删除"+teachername+"教师的信息吗?");
       	if(b){
       		window.location.href="delteacher?teacherid="+teacherid+"";
       		}else{
       			returu;
       		}
       	
       }
       function updaterteacher(teacherid,teachername) {
    	   var newteachername=window.prompt("请输入你修改后的名称",teachername);
    	   if(newteachername==teachername||newteachername==""||newteachername==null){
       		return;
       	}
       	else{
       		window.location.href="updateteachername?name="+newteachername+"&id="+teacherid+"";
       	}
	}
       function updaterteachersubject(teacherid,subjectname) {
    	   var newsubjectname=window.prompt("请输入你修改后的名称",subjectname);
    	   if(newsubjectname==subjectname||newsubjectname==""||newsubjectname==null){
          		return;
          	}
    	   else{
       		window.location.href="updateteachersubjectname?subjectname="+newsubjectname+"&id="+teacherid+"";
    	   }
	}
       function updateuserid(userid) {
    	   var newuserid=window.prompt("请输入你修改后的id",userid);
    	   if(newuserid==userid||newuserid==""||newuserid==null){
          		return;
          	}
    	   else{
       		window.location.href="updateuserid?userid="+userid+"&newuserid="+newuserid+"";
    	   }
	}
       function updatepassword(userid,password) {
    	   var newpassword=window.prompt("请输入你修改后的密码",password);
    	   if(newpassword==password||newpassword==""||newpassword==null){
          		return;
          	}
    	   else{
       		window.location.href="updatepassword?newpassword="+newpassword+"&userid="+userid+"";
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
                    <a class="brand" href="#">智能排课系统</a>
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
                       
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">用户 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">用户列表</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">搜索</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">权限</a>
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
                        <div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>欢迎使用教师信息管理！</h4>
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
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">教师信息表</div>
                                    <div class="pull-right"><span class="badge badge-info">17</span>

                                    </div>
                                </div>
                               
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>姓名</th>
                                                <th>教师号<th>
                                                <th>密码<th>
                                                <th>所授科目</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        
                                        <%
                                        String sql="SELECT teacher.id,teacher.teachername,teacher.userid as userid,subject.subjectname,user.password as password FROM teacher  LEFT JOIN SUBJECT ON teacher.subjectid=subject.id LEFT JOIN USER ON teacher.userid=user.userid  group BY teachername ORDER BY id";
                                        List<Map<String, Object>> teacherlist= DBUtils.query(sql);
                                        for(Map<String, Object> teacher: teacherlist){
                                        	
                                        	
                                        	%> 
                                        	<tbody>
                                            <tr>
                                            
                                                <td><%=teacher.get("id") %></td>
                                                <td><%=teacher.get("teachername") %></td>
                                                <td><%=teacher.get("userid") %><th>
                                             	<td><%=teacher.get("password") %><td>
                                                <td><%=teacher.get("subjectname") %></td>
                                                <td>
                                               <a onclick="updaterteacher(<%=teacher.get("id") %>,'<%=teacher.get("teachername") %>')">修改姓名</a>
                                                <a onclick="updateuserid(<%=teacher.get("userid") %>)">修改教师号</a>
                                                <a onclick="updatepassword(<%=teacher.get("userid") %>,'<%=teacher.get("password") %>')">修改密码</a>
                                               	<a onclick="updaterteachersubject(<%=teacher.get("id") %>,'<%=teacher.get("subjectname") %>')">修改科目</a>
                                                
                                                <a onclick="delteacher(<%=teacher.get("id") %>,'<%=teacher.get("teachername") %>')">删除</a>
                                                </td>
                                            </tr>
                                           
                                           
                                        </tbody>
                                        	
                                        	<%}
                                        
                                        	%>
                                       
                                        
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                            <!-- 这里删除了一个表格，如果需要的话可以加回来 -->
                             <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">添加教师信息</div>
                                    <div class="pull-right"><span class="badge badge-info">812</span>

                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                <form action="addteacher" method="post">
                                    <table class="table table-striped">
                                        
                                        <tbody>
                                            <tr>
                                                <td>姓名</td>
                                                <td>所授科目</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" name="teachername"></td>
                                                <td>
                                                <select name="subjectname">
                                                <%
                                                String sql2="SELECT subjectname FROM subject";
                                                List<Map<String, Object>> subjectlist= DBUtils.query(sql2);
                                                for(Map<String, Object> subject: subjectlist){
                                                %>
                                                <option><%=subject.get("subjectname") %></option>
                                                <%
                                                }
                                                %>
                                                </select>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>用户名</td>
                                                <td>密码</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" name="userid" value="请输入工号"></td>
                                                <td><input type="text" name="password"></td>
                                                <td><a><button  class="btn btn-primary" type="submit">确认添加教师</button></a></td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                    </form>
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