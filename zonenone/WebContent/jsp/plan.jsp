<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ZoneNone - Plan</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<!--Pulling Awesome Font -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="css/plan.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="js/validation.js"></script>
</head>
<body>
<div class="container">
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<div class="col-md-5" style="margin-top:20px;">

<div class="panel panel-default">
<div class="panel-heading"><form:form name="planForm" novalidate="novalidate"
	action="saveplan.do" method="post" commandName="planFormBean" id="planValidate">
	<h4 class="text-center">Add New Plan</h4>
	<div class="panel-body text-center">
		<c:if test="${not empty errorMsg }">
		<div class="alert alert-error bg-danger">  
		  <a class="close" data-dismiss="alert">×</a>  
	  		<strong>Error!</strong>${errorMsg}
	  	</div>
	  	</c:if>
		<div class="form-group"><form:input class="form-control"
			id="name" path="planNme" placeholder="Name"/></div>
		<div class="form-group"><form:input class="form-control"
			id="voice" path="voice" placeholder="Voice" /></div>
		<div class="form-group"><form:input class="form-control"
			id="text" path="text" placeholder="# Of SMS" /></div>
		<div class="form-group"><form:input class="form-control"
			id="data" path="data" placeholder="Data Size" /></div>
		<div class="form-group"><form:input class="form-control" id="amt"
			path="amt" placeholder="Plan Amount" /></div>
		<div class="form-group">
		<button type="submit" id="submitBtn" name="submit"
			class="btn btn-primary pull-right">Add Plan</button>
		</div>
	</div>
</form:form></div>
</div>
</div>
<%-- Start of Plan List --%>
<div class="col-md-7" style="margin-top:20px;">
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="text-center">Existsing Plan <span
	class="fa fa-edit pull-right bigicon"></span></h4>
</div>
<div class="panel-body text-center">
<div id="grid"></div>
</div>
</div>
</div>
<script type="text/javascript" src="js/grid.js"></script>
<c:forEach var="planBean" items="${planBean.planFormBeans}" varStatus="count">
<script>
	addGridData("<c:out value="${count.index}"/>","<c:out value="${planBean.id }"/>","<c:out value="${planBean.planNme }"/>",
			"<c:out value="${planBean.voice }"/>","<c:out value="${planBean.text }"/>","<c:out value="${planBean.data }"/>",
			"<c:out value="${planBean.amt }"/>");
	</script>
</c:forEach>
<%-- End of Plan List --%>
<%@ include file="footer.jsp" %>
</div>
<!-- you need to include the shieldui css and js assets in order for the grids to work -->
<link rel="stylesheet" type="text/css" href="css/all.min.css" />
<script type="text/javascript" src="js/shieldui-lite-all.min.js"></script>
<script type="text/javascript" src="js/plan.js"></script>
</body>
</html>