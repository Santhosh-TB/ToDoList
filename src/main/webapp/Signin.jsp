<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sing-In</title>

<style>

body{
		background-image: url("orange cup.jpg");
background-repeat: no-repeat;
background-size: cover;
	}
div{
		width: 450px;
		margin-left: 500px;
		margin-top: 190px;
		background-color: white;
		padding: 25px;
		border-radius: 2pc;
	}
h1,form{
		text-align: center;
	}
button{
border-style: none;
text-decoration: none;
padding: 10px;
border-style: none;
border-radius: 2pc;
padding-left: 20px;
padding-right: 20px;
background-color: blue;
color: white;
font-weight: bold;
}
button:hover{
transform: scale(1.5, 1.5);
transition: 0.5s;
}

</style>


</head>



<body>

<div>
	<h1>Sign-In Form</h1> <br></br>
	
	<form action="userlogin" method="post">
		
		E-mail: &nbsp; &nbsp; &nbsp; <input type="text" placeholder="Enter Your E-Mail" name="Email"> <br><br>
	
		Password: &nbsp; <input type="password" placeholder="Enter Your Password" name="Password"> <br><br><br>
		
		<button name="button">SignIn</button> &nbsp;&nbsp;&nbsp;&nbsp;
		<button name="button" value="cancel">cancel</button>
		
		<% String msg = (String)request.getAttribute("msg"); 
		if(msg != null)
		{ 
		
			if(msg != "Password Changed SuccessFully............"){
		%>
			<h4 style="color: red;"><%= msg %></h4>
			<button style="background-color: black;" name="button" formaction="forgotpassword.jsp">Forgot Password</button> <%} 
			
			else { %>
			<h4 style="color: red;"><%= msg %></h4> <%} %>
			
		<% }%>

		
	</from>
	</div>
	
<script type="text/javascript">


</script>

</body>
</html>