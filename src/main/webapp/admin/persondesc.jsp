<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="../commons/mytaglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>分配人员</title>
<link href="${pageContext.request.contextPath }/css/css.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
	<link href="${pageContext.request.contextPath }/css/css.css"
		rel="stylesheet" type="text/css" />
	<div id="logo">
		<img src="${pageContext.request.contextPath }/images/top.jpg"
			width="1002" height="258" />
	</div>
	<!-- #EndLibraryItem -->
	<table width="1002" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="rightimg">
				<!-- #BeginLibraryItem "/Library/left3.lbi" -->
				<link href="${pageContext.request.contextPath }/css/css.css"
					rel="stylesheet" type="text/css" />
				<div id="left2">
					<p>
						<a href="queryall.do" target="_self">用户管理</a>
					</p>
					<p>
						<a href="input_remove.do" target="_self">员工管理</a>
					</p>
					<p>
						<a href="input_update.do" target="_self">分配人员</a>
					</p>
					<p>
						<a href="exit.do" target="_self">退出系统</a>
					</p>
				</div>
				<!-- #EndLibraryItem -->
				<div id="right">
					<p>您现在的位置 &gt;&gt; 分配人员</p>
					<h1>用户详细信息:</h1>
					<spf:form id="form0" name="form1" method="post" action="update.do" >
						<table width="700" border="0" cellpadding="0" cellspacing="0"
							class="table">
							<tr>
								<td class="tdcolor">用户名称</td>
								<td>${persondesc.employeeName }</td>
							</tr>
							<tr>
								<td width="15%" class="tdcolor">真实姓名</td>
								<td>${persondesc.realName }</td>
							</tr>
							<tr>
								<td class="tdcolor">行业角色</td>
								<td>${persondesc.role.roleName }</td>
							</tr>
							<tr>
								<td class="tdcolor">性&nbsp;&nbsp;&nbsp; 别</td>
								<c:choose>
									<c:when test="${persondesc.sex == 'F'}"><td>男</td></c:when>
									<c:otherwise>
   										<td>女</td>
   									 </c:otherwise>
								</c:choose>
								
							</tr>
							<tr>
								<td class="tdcolor">入职时间</td>
								<td><fmt:formatDate value="${persondesc.enrolldate }"
										pattern="yyyy-MM-dd"></fmt:formatDate>
								</td>
							</tr>
							<tr>
								<td class="tdcolor">职位信息</td>
								<td>${persondesc.duty }</td>
							</tr>
							<tr>
								<td class="tdcolor">出生年月</td>
								<td><fmt:formatDate value="${persondesc.birthday }"
										pattern="yyyy-MM-dd"></fmt:formatDate>
								</td>
							</tr>
							<tr>
								<td class="tdcolor">学历信息</td>
								<td>${persondesc.education }</td>
							</tr>
							<tr>
								<td class="tdcolor">专业信息</td>
								<td>${persondesc.major }</td>
							</tr>
							<tr>
								<td class="tdcolor">行业经验</td>
								<td>${persondesc.experience }</td>
							</tr>
							<tr>
								<td class="tdcolor">上级主管</td>
								<td><label> <select name="managerid">
									<c:forEach items="${allm }" var ="m">
									<option value="${m.employeeId }">${m.realName }</option>
									</c:forEach>
									
								</select></label>
								</td>
							</tr>
						</table>
						<p>&nbsp;</p>

						<p>
							<input name="Submit" type="reset" class="menu2" value="取消" /> <label>
								<input name="Submit2" type="submit" class="menu1" value="提交" />
							</label>
						</p>
					</spf:form>
				</div></td>
		</tr>
	</table>
	<!-- #BeginLibraryItem "/Library/bottom.lbi" -->
	<div id="bottom">
		<img src="${pageContext.request.contextPath }/images/button.jpg"
			width="1002" height="17" />
	</div>
	<!-- #EndLibraryItem -->
</body>
</html>
