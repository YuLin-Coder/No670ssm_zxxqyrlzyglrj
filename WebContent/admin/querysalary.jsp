<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用网站工资管理系统</title>
<link rel="stylesheet" type="text/css" href="h-ui/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="h-ui/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="h-ui/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="h-ui/h-ui.admin/css/style.css" />
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="h-ui/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="h-ui/h-ui.admin/js/H-ui.admin.js"></script>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>员工薪资管理 <span class="c-gray en">&gt;</span>
		员工薪资查询 <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"> <i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="11">员工薪资查询</th>
				</tr>
				<tr class="text-c">
					<th class="center">部门</th>
					<th class="center">员工</th>
					<th class="center">基本工资</th>
					<th class="center">考勤工资</th>
					<th class="center">奖惩工资</th>
					<th class="center">其他工资</th>
					<th class="center">总计</th>
					<th class="center">年月</th>
					<th class="center">状态</th>
					<th class="center">备注</th>
				</tr>
			</thead>
			<c:forEach items="${salaryList}" var="salary">
				<tr class="text-c">
					<td class="center">${salary.deptname}</td>
					<td class="center">${salary.realname}</td>
					<td class="center">${salary.basic}</td>
					<td class="center">${salary.attend}</td>
					<td class="center">${salary.reward}</td>
					<td class="center">${salary.others}</td>
					<td class="center">${salary.total}</td>
					<td class="center">${salary.yearx}</td>
					<td class="center">${salary.status}</td>
					<td class="center">${salary.memo}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="cl pd-5 mt-20"></div>
		<div class="text-c">
			<form action="salary/querySalaryByCond.action" name="myform" method="post">
				查询条件： <span class="select-box" style="width: 200px;"><select name="cond" class="select">
						<option value="deptid">按部门查询</option>
						<option value="usersid">按员工查询</option>
						<option value="basic">按基本工资查询</option>
						<option value="attend">按考勤工资查询</option>
						<option value="reward">按奖惩工资查询</option>
						<option value="others">按其他工资查询</option>
						<option value="total">按总计查询</option>
						<option value="yearx">按年月查询</option>
						<option value="status">按状态查询</option>
						<option value="memo">按备注查询</option>
				</select></span>&nbsp;&nbsp;关键字<input type="text" name="name" required style="width: 200px" class="input-text" />
				<button type="submit" class="btn btn-success radius">
					<i class="Hui-iconfont">&#xe665;</i> 查询
				</button>
			</form>
		</div>
	</div>
</body>
</html>

