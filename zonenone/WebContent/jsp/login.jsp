<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<!--Pulling Awesome Font -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="css/login.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
	function submitForm() {
		document.forms["loginForm"].submit();
	}
</script>
</head>
<body>
<form:form name="loginForm" action="login.do" method="post" commandName="loginFormBean">
	<div class="container">
	<div class="row">
	<div class="col-md-offset-5 col-md-3">
	<div class="form-login">
	<h4>ZoneNone Login</h4>
	<c:if test="${not empty errorMsg }">
	<div class="alert alert-error bg-danger">  
	  <a class="close" data-dismiss="alert">×</a>  
  		<strong>Error!</strong>${errorMsg}
  	</div>
  	</c:if>
	<form:input id="userName" path="userName"
		class="form-control input-sm chat-input" placeholder="username" /> </br>
	<form:password id="userPassword" path="password"
		class="form-control input-sm chat-input" placeholder="password" /> </br>
	<div class="wrapper"><span class="group-btn"> <button type="submit"
		href="#" class="btn btn-primary btn-md">login <i
		class="fa fa-sign-in"></i></button> </span></div>
	</div>

	</div>
	</div>
	</div>
</form:form>
</body>
</html>