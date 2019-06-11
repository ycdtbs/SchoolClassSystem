<%@page import="tools.DBUtils"%>
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
    <%System.out.println("inf界面标题"); %>
    <head>
        <title>个人信息</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script type="text/javascript">
        function root(userid,password,username) {
        	var newpassword=window.prompt("请输入你修改后的密码",password);
     	   if(newpassword==password||newpassword==""||newpassword==null){
           		return;
           	}
     	   else{
        		window.location.href="updatepassword2?newpassword="+newpassword+"&userid="+userid+"&username="+username+"";
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
                    <a class="brand" href="#">宇宙无敌智能课表系统</a>
                   <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                            <%System.out.println("inf界面标题2"); %>
                            <%
                            System.out.println("inf界面标题3");
                            String name=request.getAttribute("name").toString();
                            System.out.println("inf界面标题4");
                            System.out.println("inf界面测试点一"+name);
                            %>
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><%=name %><i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
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
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">个人信息</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     
                                      <fieldset>
                                      <legend>个人信息</legend>
                                      <%
                                      request.setCharacterEncoding("utf-8");
                                      response.setCharacterEncoding("utf-8");
                                     
                                      
                                      
                                      System.out.println("inf界面测试点二"+name);
                                      String sql="select userid,username,password,role from user where username='"+name+"'";
                                      List<Map<String, Object>> resultlist=DBUtils.query(sql);
                                      String type=null;
                                      
                                      for (Map<String, Object> map : resultlist) {
                                    	  int role= Integer.parseInt(map.get("role").toString());
                                    	  if(role==2){
                                    		  type="管理员";
                                    	  }else if(role==1){
                                    		  type="教师";
                                    	  }
                                    	  
                                    	  %>
                                    	  <div class="control-group">
                                          <label class="control-label" for="focusedInput">姓名:<%=name %></label>
                                          
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label">用户名:<%=map.get("userid") %></label>
                                         </div>
                                         <div class="control-group success">
                                          <label class="control-label" for="selectError">密码:<%=map.get("password") %> 
                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          <a onclick="root(<%=map.get("userid") %>,'<%=map.get("password")%>','<%=name %>')"><font color="red">修改密码</font></a>
                                          </label>
                                          
                                         </div>
                                         <div class="control-group">
                                          <label class="control-label">用户类别:<%=type %></label>
                                         </div>
                                    	 
                                          <%
                                      }
                                      %>
                                        
                                        
                                      </fieldset>
                                    

                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                     <div class="row-fluid">
                        <!-- block -->
                       
                        <!-- /block -->
                    </div>

                     <!-- wizard -->
                    <div class="row-fluid section">
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
        <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
        <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

        <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/jquery.uniform.min.js"></script>
        <script src="vendors/chosen.jquery.min.js"></script>
        <script src="vendors/bootstrap-datepicker.js"></script>
        <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
		<script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script>
        $(function() {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
        });
        </script>
    </body>

</html>