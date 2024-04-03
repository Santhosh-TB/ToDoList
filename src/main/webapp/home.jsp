<%@page import="dto.TaskDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="dto.Dto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome User | Home</title>

<style>
body{
background-image: linear-gradient(90deg, #020024 0%, #090979 35%, #00d4ff 100%);
}
div{
border-radius: 25px;
width: 400px;
margin-left: 15%;
padding: 22px;
padding-left: 80px;
background-color: white;
}
a{
border-radius: 2pc;
padding: 10px;
text-decoration: none;
font-size: larger;
font-weight: bold;
padding-left: 40px;
padding-right: 40px;

color: black;
background-color: white;
}
a:hover{
transition: 0.5s;
transform: scale(1.2, 1.2);
color: white;
background-color: black;
}

table,th,td {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 10px;
	text-align:center;
	letter-spacing: 2px;
	background-color: white;
}
th{
padding-left: 40px;
padding-right: 40px;
background-color: #009878;
color: white;
}
</style>


</head>

<body>

<h1 style="text-align: center; color: white">Welcome To The Home Page</h1>
<br><br>

<% HttpSession ses = request.getSession(); 
  Dto user = (Dto)ses.getAttribute("Dto");
  int id = user.getUserid();
  String name = user.getUsername();
  String email = user.getUseremail();
  long contact = user.getUsercontact();
   %>

<% String image = new String(Base64.getEncoder().encode(user.getUserimage())); %>
<img alt="No Image" src="data:image/jpeg;base64,<%= image %>" width="220" height="250" style="float:left">

<div>
<h1>Name: <%= name %> </h1>
<h3>UserID: <%= id %></h3>
<h3>Email: <%= email %></h3>
<h3>Contact: <%= contact %></h3>
</div>
<br> <br>

	<a href="AddTask.jsp" > Add Task </a> <br><br>
	
	
	<% List<TaskDto> tasks = (List)request.getAttribute("tasks"); %>

<table>
<thead>
<tr>
<th>ID</th>
<th>Title</th>
<th>Desription</th>
<th>Priority</th>
<th>Due-date</th>
<th>Status</th>
</tr>
</thead>

<tbody>

<% for(TaskDto task:tasks)
{ %>
	<tr>
	<td> <%= task.getTaskid() %></td>
	<td> <%= task.getTasktitle() %></td>
	<td> <%= task.getTaskdescription() %></td>
	<td> <%= task.getTaskpriority() %></td>
	<td> <%= task.getTaskduedate() %></td>
	<td> <%= task.getTaskstatus() %></td>
    </tr>
    
    <%
    } %>
</tbody>
</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>