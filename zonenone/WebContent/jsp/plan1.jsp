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
	src="js/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container"><%@ include file="header.jsp"%><%@ include file="menu.jsp"%>
<%-- Start of Plan List --%>
<div class="col-md-12" style="margin-top:20px;">
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="text-center">Existsing Plan <!--<span
	class="fa fa-edit pull-right bigicon"></span>

-->
<button class="btn btn-primary btn-sm pull-right" data-toggle="modal"
	data-target="#myModal">Add New Plan</button>
</h4>
</div>
<div class="panel-body text-center">
<div id="grid"></div>
</div>
</div>
</div>
<script type="text/javascript" src="js/grid.js"></script> <c:forEach
	var="planBean" items="${planBean.planFormBeans}" varStatus="count">
	<script>
	addGridData("<c:out value="${count.index}"/>","<c:out value="${planBean.id }"/>","<c:out value="${planBean.planNme }"/>",
			"<c:out value="${planBean.voice }"/>","<c:out value="${planBean.text }"/>","<c:out value="${planBean.data }"/>",
			"<c:out value="${planBean.amt }"/>");
</script>
</c:forEach> <%-- End of Plan List --%> <%@ include file="footer.jsp"%>
</div>
<!-- you need to include the shieldui css and js assets in order for the grids to work -->
<link rel="stylesheet" type="text/css" href="css/all.min.css" />
<script type="text/javascript" src="js/shieldui-lite-all.min.js"></script>
<script type="text/javascript" src="js/plan.js"></script>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"
	aria-hidden="true">&times;</button>
<h4 class="modal-title" id="myModalLabel">New Plan</h4>
</div>
<div class="modal-body">
<div class="modal-error">
</div>
<div class="panel panel-default">
<form:form name="planForm"
	action="saveplan.do" method="post" commandName="planFormBean">
	<div class="panel-heading">
	<div class="panel-body text-center">
	<div class="form-group"><form:input class="form-control"
		id="planNme" path="planNme" placeholder="Name" /></div>
	<div class="form-group"><form:input class="form-control"
		id="voice" path="voice" placeholder="Voice" /></div>
	<div class="form-group"><form:input class="form-control"
		id="text" path="text" placeholder="# Of SMS" /></div>
	<div class="form-group"><form:input class="form-control"
		id="data" path="data" placeholder="Data Size" /></div>
	<div class="form-group"><form:input class="form-control" id="amt"
		path="amt" placeholder="Plan Amount" /></div>
	</div>
</form:form>
	</div>
	</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close
</button>
<button type="button" class="btn btn-primary" id="submitBtn" onclick="submitBtn();">
Submit changes</button>
</div></div>
<!-- /.modal-content --></div>
<!-- /.modal-dialog --></div>
<!-- /.modal -->

<script type="text/javascript" >
function submitBtn() {
	$.ajax({
        url: "saveplan.do", //this is the submit URL
        type: 'POST', //or POST
        data: {
    		planNme : $("#planNme").val(),
    		voice : $("#voice").val(),
    		text : $("#text").val(),
    		data : $("#data").val(),
    		amt : $("#amt").val()
    	},
        success: function(data){
    		window.location.replace('loadplan.do');
        },
        error : function(data){
            $(".modal-error").html("Error :"+ data);
        }
    });
}
</script></body>
</html>