<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IoT 프로젝트 예제</title>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.2/angular.min.js"></script>
<script src="/resources/js/controller.js"></script>


</head>
<body>
<script type="text/javascript">
	$(function() {
		var todayTotalUse;
		<c:forEach items="${list}" var="dataList">
			todayTotalUse += ${dataList.value.use};	
		</c:forEach>
	});
</script>
<%--  
	<c:set var="total" value="${total + dataList.value.use}"/>
--%>
<c:set var="total" value="0"/>


	<div ng-app="app" ng-controller="controller">
		<button id="btn-id" ng-click="clickfunction()">Press for Time</button>
		<p ng-bind="welcome"></p>
	</div>

</body>
</html>