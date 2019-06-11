<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<%
for(int i=0;i<=10;i++){
	if(i%2==0){
		%>
		
		<tr>
			<td>第一列</td>
			<td>第二列</td>
		
		
	<%}%>
	<% 
	if(i%2!=0){
		%>
		<td>第三列</td>
		</tr>
		<% 
	}
	%>	
	
		
		<%
	}%>

</table>
</body>
</html>