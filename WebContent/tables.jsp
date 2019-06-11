
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
    
    <% response.setCharacterEncoding("UTF-8");%>
<%

		String sql="SELECT id,gradename,year FROM grade";//查询年级信息
		List<Map<String, Object>> gradelist = DBUtils.query(sql);



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
        
        function updategradeyear(index) {
			var b=window.confirm("你确定要修改学年吗");
			
			if(b){
			window.location.href="gradeupdateserverlet?index="+index+"";
				
			}
		}
        function deletgrade(id){
			var b=window.confirm("你确定要删除年级吗");
			if(b){
			window.location.href="deletgradeserverlet?id="+id+"";
				
			}
        }
        <% response.setCharacterEncoding("UTF-8");%>
        function updategradename(id,name){
        	var gradename=window.prompt("请输入你修改后的名称",name);
        	alert(gradename);
        	//window.prompt(gradename,name);
        	if(gradename==name||gradename==""||gradename==null){
        		return;
        	}
        	else{
        		window.location.href="updategradename?name="+gradename+"&id="+id+"";
        	}
        }
        function addgrade(){
        	var gradename=window.prompt("请输入新添加的年级的名称","");
        	
        	if(gradename!=""&&gradename!=null){
        		window.location.href="addgrade?name="+gradename+"";
        	}
        }
        function addclazz(year){
        	var clazzname=window.prompt("请输入新添加的班级的名称","");
       
        	if(clazzname==name||clazzname==""||clazzname==null){
        		return;
        	}
        	else{
        		window.location.href="addclazz?year="+year+"&clazzname="+clazzname+"";
        	}
        }
        function delclazz(year){
        	var clazzname=window.prompt("请输你要删除的班级的名称","");
        	if(clazzname==name||clazzname==""||clazzname==null){
        		return;
        	}
        	else{
        		window.location.href="delclazz?year="+year+"&clazzname="+clazzname+"";
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
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            <button  class="btn btn-primary" onclick="addgrade()">添加年级</button>
                            
                            <button  class="btn btn-primary" onclick="updategradeyear(<%="1" %>)">升级学年</button>
                            <button  class="btn btn-primary" onclick="updategradeyear(<%="2" %>)">降低学年</button>
                            
                              
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table class="table">
						              <thead>
						                <tr>
						                  <th>编号</th>
						                  <th>年级名称</th>
						                  <th>入学年份</th>
						                  <th>班级列表</th>
						                  <th>操作</th>
						                  
						                </tr>
						              </thead>
						              <%
						              for(Map<String, Object> grade: gradelist){
						            	  String year=grade.get("year").toString();//toString 的作用是将数据转换为字符串类型
						            	  String sql2="SELECT * FROM clazz where year='"+year+"' ";//查询年级信息
						          		List<Map<String, Object>> clazzlist = DBUtils.query(sql2);
						            	  String clazznamestr="";
						            	  for(Map<String, Object> clazz: clazzlist){
						            		  clazznamestr=clazz.get("clazzname").toString()+"&nbsp&nbsp&nbsp"+clazznamestr;
						            	  }
						            	  
						            	  %>
						            	   <tbody>
						            	<tr>
						                  <td><%=grade.get("id") %></td>
						                  <td><%=grade.get("gradename") %></td>
						                  <td><%=grade.get("year") %></td>
						                  <td><%=clazznamestr %></td>
						                  <td>
						                  <a onclick="addclazz(<%=grade.get("year") %>)">添加班级</a>
						                  <font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font>
						                  <a onclick="delclazz(<%=grade.get("year") %>)">删除班级</a>
						                  <font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font>
						                  <a onclick="deletgrade(<%=grade.get("id") %>)">删除年级</a>
						                  <font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font>
						                  <a onclick="updategradename(<%=grade.get("id") %>,'<%=grade.get("gradename") %>')">修改年级名称</a>
						                  </td>
						               	</tr>
						               </tbody>  
						            	  
						            	  <%
						              }
						              
						              
						              %>
						              
						            
						            
						            
						            </table>
                                </div>
                            </div>
                        </div>
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