<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript">
	//创建模块
	var app = angular.module("app", []);
	//创建controller
	app.controller("MyController", [ "$scope", function($scope) {
		$scope.ss = [ {
			id : 1,
			name : "张三"
		}, {
			id : 2,
			name : "李四"
		}, {
			id : 3,
			name : "王五"
		}, {
			id : 4,
			name : "赵六"
		}, {
			id : 5,
			name : "田七"
		}, ];
		//先指定flag的状态是没被选中的
		$scope.flag = false;
		//然后点击ck就是进行选中
		$scope.ck = function() {
			$scope.flag = !$scope.flag;
			//给下面的多选框进行赋值  上面的多选框选了下面的多选框也进行选择  
			$(".comm").prop("checked", $scope.flag);
		};

		$scope.cks = function() {
			//比较未选框的长度和被选框的长度是否相等
			var ck = $(".comm").length;
			var cks = $(".comm:checked").length;
			$scope.flag = (ck == cks);
		};

		$scope.del = function() {
			//取出被选框
			var ck = $(".comm:checked");
			var ids = "";
			for ( var i = 0; i < ck.length; i++) {
			//如果i==0说明id只有一个
				if (i == 0) {
					ids += ck[i].value;
				} else {
				//否则就是多个id   需要用","进行分开
					ids += "," + ck[i].value;
				};
			}
			alert(ids)
		};
	} ]);
</script>

</head>
<body ng-app="app" ng-controller="MyController">
	<table border="1">
		<tr>
			<td colspan="3"><button ng-click="del()">批量删除</button></td>
		</tr>
		<tr>
			<td><input type="checkbox" ng-checked="flag" ng-click="ck()"></td>
			<td>编号</td>
			<td>名字</td>
		</tr>
		<tr ng-repeat="s in  ss">
			<td><input type="checkbox" class="comm" ng-click="cks()"
				value="{{s.id}}"></td>
			<td>{{s.id}}</td>
			<td>{{s.name}}</td>
		</tr>
	</table>
</body>
</html>
