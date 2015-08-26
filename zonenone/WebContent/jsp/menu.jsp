<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="nav nav-tabs">
   <li <c:if test="${currentUrl eq 'plan' }">class="active"</c:if> ><a href="loadplan.do">Plan</a></li>
   <li <c:if test="${currentUrl eq 'map' }">class="active"</c:if> ><a href="map.do">Map</a></li>
   <li <c:if test="${currentUrl eq 'plan1' }">class="active"</c:if> ><a href="loadplan1.do">Plan</a></li>
   <%-- <li <c:if test="${currentUrl eq 'chart' }">class="active"</c:if> ><a href="chart.do">Chart</a></li> --%>
   <li <c:if test="${currentUrl eq 'chart' }">class="active"</c:if> ><a href="morrisbarchart.do">Chart</a></li>
</ul>