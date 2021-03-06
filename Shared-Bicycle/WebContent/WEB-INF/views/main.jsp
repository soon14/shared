<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>管理平台</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/web-resources/libs/bootstrap-3.1.1/css/bootstrap.min.css"/>'>
</head>
<body>
	
	<div class="container" style="padding-top: 10px">
		<input type="hidden" id="login_account" value="${sessionScope.login_user.account}"/>
		<div align="right" style="margin-bottom: 10px; padding-right: 10px;">
			您好,
			<c:choose>
				<c:when test="${sessionScope.login_user.role eq 1}">
					管理员_admin,
				</c:when>
				<c:when test="${sessionScope.login_user.role eq 2}">
					维修人员_${sessionScope.repair_info.realname},
				</c:when>
				<c:when test="${sessionScope.login_user.role eq 3}">
					尊敬的用户_${sessionScope.user_info.nickname}_${sessionScope.user_info.account},
				</c:when>
				<c:otherwise>${sessionScope.login_user.account},</c:otherwise>
			</c:choose>  
			<a href="/logout" id="logout">退出</a>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading text-center">
				<h3 class="panel-title">共享单车管理平台</h3>
			</div>
		</div>
		<div class="row">
            <div class="col-md-2">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <h4 class="panel-title">菜单栏</h4>
                    </div>
                    <ul class="list-group">
                    	<!-- 管理员 -->
	                    <c:if test="${sessionScope.login_user.role eq 1 }">
	                    	<li class="list-group-item">
	                           <a href="javascript:void(0)" id="user_manage">用户管理</a>
	                        </li>
	                        <li class="list-group-item">
	                           <a href="javascript:void(0)" id="bike_manage">单车管理</a>
	                        </li>
	                        <li class="list-group-item">
	                           <a href="javascript:void(0)" id="repair_manage">维修人员管理</a>
	                        </li>
	                        <li class="list-group-item">
	                           <a href="javascript:void(0)" id="location_manage">位置管理</a>
	                        </li>
	                    </c:if>
                    	
                    	<!-- 维修 -->
	                    <c:if test="${sessionScope.login_user.role eq 2 }">
	                    	<li class="list-group-item">
	                           <a href="javascript:void(0)" id="repair_info">基本信息</a>
	                        </li>
	                        <c:if test="${sessionScope.login_user.role eq 2 and sessionScope.repair_info.isPass eq 2}">
		                        <li class="list-group-item">
		                           <a href="javascript:void(0)" id="repair_bike">已报修车辆</a>
		                        </li>
		                    </c:if>
	                    </c:if>
                    	
                    	<!-- 用户 -->
	                    <c:if test="${sessionScope.login_user.role eq 3 }">
	                    	<li class="list-group-item">
	                           <a href="javascript:void(0)" id="user_info">基本信息</a>
	                        </li>
	                        <li class="list-group-item">
	                           <a href="javascript:void(0)" id="balance">我的账户</a>
	                        </li>
	                        <li class="list-group-item">
	                           <a href="javascript:void(0)" id="rent_bike">附近车辆</a>
	                        </li>
	                        <li class="list-group-item">
	                           <a href="javascript:void(0)" id="my_repair">我报修的车辆</a>
	                        </li>
	                    </c:if>
                     </ul>
                </div>
            </div>
            <div class="col-md-10">
                <div id="content">
                
                </div>
            </div>
        </div>
	</div>
	
	<%@ include file="/WEB-INF/views/bike/add.jsp"%>
	
	<script type="text/javascript"
		src='<c:url value="/web-resources/libs/jquery/jquery-2.1.1.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/libs/bootstrap-3.1.1/js/bootstrap.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/index.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/user_manage.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/bike_manage.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/repair_manage.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/near_bike.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/location_manage.js"/>'></script>
</body>
</html>