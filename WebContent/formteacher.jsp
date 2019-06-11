<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tools.DBUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    <head>
        <title>设置课表界面</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
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
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script>
        function selectclazz() {
			var classid=$("#classid").val();
			
			window.location.href="formteacher.jsp?classid="+classid+"";
		}
        function changelesson(weekday,lesson,classid) {
			var a =window.prompt("你要修改本节课的教师为","");
			if(a==null||a==""){
				return;
			}
			window.location.href="changelesson?weekday="+weekday+"&lesson="+lesson+"&teacher="+a+"&classid="+classid+"";
			
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
                    <a class="brand" href="#">欢迎使用宇宙无敌排课系统</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                            <%
                            String name=request.getParameter("name").toString();
                            name=new String(name.trim().getBytes("ISO-8859-1"), "UTF-8");
                            
                            %>
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><%=name %><i class="caret"></i>

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
					
                  <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">课表设置</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table class="table">
						              <thead>
						                <tr>
						                  <th>序号</th>
						                  <th>星期一</th>
						                  <th>星期二</th>
						                  <th>星期三</th>
						                  <th>星期四</th>
						                  <th>星期五</th>
						                  <th>星期六</th>
						                  <th>星期日</th>
						                  
						                </tr>
						              </thead>
						              <tbody>
						                <%
						                
						               	
						               	String selectsql="SELECT lesson.weekdayid AS weekdayid,lesson.classnumber AS classnumber,clazz.clazzname AS clazzname,teacher.teachername AS teachername,subject.subjectname AS subjectname,lesson.clazzid AS clazzid" 
						        				+" FROM lesson"
						        				+" JOIN clazz ON lesson.clazzid=clazz.id"
						        				+" JOIN teacher ON teacher.id=lesson.teacherid"
						        				+" JOIN SUBJECT ON teacher.subjectid=subject.id"
						        				+" where teachername='"+name+"'";
						               	List<Map<String, Object>> lessonlist = DBUtils.query(selectsql);
						               	Map<String, Object> lessonmap = new HashMap<String, Object>();
						               	String clazzid=null;
						               	for (Map<String, Object> map : lessonlist) {
						        			int weekdayid = Integer.parseInt(map.get("weekdayid").toString());
						        			int lessonnumber = Integer.parseInt(map.get("classnumber").toString());
						        			String tname=map.get("teachername").toString();
						        			String classid=map.get("clazzid").toString();
						        			String subjectname=map.get("subjectname").toString();
						        			String sql2="SELECT CONCAT(grade.gradename,clazz.clazzname) AS clazzname FROM clazz JOIN grade ON grade.year=clazz.year WHERE clazz.id="+classid+"";
						            		List<Map<String, Object>> classlist=DBUtils.query(sql2);
						            		String classname=classlist.get(0).get("clazzname").toString();
						            		
						        			lessonmap.put(weekdayid+"_"+lessonnumber,classname);
						        		
						        		
						        		
						        	}
						        		
						                for(int i=1;i<=9;i++){
						                	%>
						                	<tr>
						                		<td>第<%=i %>节课</td>
						                		<% 
						                		for(int j=1;j<=7;j++){
							                		if(name==null){
							                			%>
							                			<td></td>
							                		
							                		<%
							                		}else{
							                			%>
							                			<td>
							                			<%
							                			if(lessonmap.containsKey(j+"_"+i)){
							                				
							                				
							                				%>
							                				<%=lessonmap.get(j+"_"+i) %>
							                				
							                				
							                				
							                				
							                				<%
							                			}
							                			%>
							                			
							                			</td>
							                		
							                		<%
							                		}
							                		
							                		
							                		
							                	}
						                		
						                		%> 
						                	
						                	
						                	</tr>
						                	
						                	
						                	<% 
						                	
						                }
						                
						                
						                
						        		
						                
						                %>
						              
						              </tbody>
						            </table>
                                </div>
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