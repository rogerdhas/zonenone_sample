<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="nav nav-tabs">
   <li <c:if test="${currentChartUrl eq 'morrisBar' }">class="active"</c:if> ><a href="morrisbarchart.do">Bar</a></li>
   <li <c:if test="${currentChartUrl eq 'liquidguage' }">class="active"</c:if> ><a href="liquidfillgauagechart.do">Liquid Gauage</a></li>
   <li <c:if test="${currentChartUrl eq 'bubble' }">class="active"</c:if> ><a href="bubblechart.do">Bubble</a></li>
   <li <c:if test="${currentChartUrl eq 'chloropeth' }">class="active"</c:if> ><a href="chloropethbarchart.do">Chloropeth Bar</a></li>
</ul>