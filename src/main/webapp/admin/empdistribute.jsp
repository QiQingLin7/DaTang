<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="../commons/mytaglib.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>分配人员</title>
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
<div id="logo"><img src="${pageContext.request.contextPath }/images/top.jpg" width="1002" height="258" /></div>
<!-- #EndLibraryItem --><table width="1002" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left3.lbi" -->
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
<div id="left2">
      <p><a href="queryall.do" target="_self" >用户管理</a></p>
      <p><a href="input_remove.do" target="_self">员工管理</a></p>
      <p><a href="input_update.do" target="_self">分配人员</a></p>
      <p ><a href="exit.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 用户管理 &gt;&gt; 用户列表</p>
        <h1>用户详细信息:</h1>
	  
	    <form id="form1" name="form1" method="post" action="desc.do" >
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">用户名称</td>
              <td class="tdcolor">用户密码</td>
              <td class="tdcolor">用户角色</td>
              <td class="tdcolor">真实姓名</td>
              <td class="tdcolor">入职时间</td>
              <td class="tdcolor">职位信息</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
            
            <c:forEach items="${all.data}" var="e">
								<tr>
									<td width="15%" class="tdcolor">${e.employeeName }</td>
									<td class="tdcolor">${e.password }</td>
									<td class="tdcolor">${e.role.roleName }</td>
									<td class="tdcolor">${e.realName }</td>
									<td class="tdcolor"><fmt:formatDate value="${e.enrolldate }"  pattern="yyyy-MM-dd"></fmt:formatDate></td>
									<td class="tdcolor">${e.duty }</td>
									<td class="tdcolor">&nbsp;</td>
									<td><label>
                <input type="radio" name="empId" value="${e.employeeId }" />
              </label></td>
								</tr>
							</c:forEach>
          </table>
	      <p>
            <label></label>
            <label>
            <input name="Submit2" type="submit" class="menu4" value="详情" />
            </label>
	      </p>
        </form>
        <center>
					<a>共${all.lastPage }页</a>
						<a
							href="${pageContext.request.contextPath }/input_update.do?pageNo1=${all.firstPage}&pageSize1=${all.pageSize}">首页</a>
						<a
							href="${pageContext.request.contextPath }/input_update.do?pageNo1=${all.previousPage}&pageSize1=${all.pageSize}">上一页</a>
						<a
							href="${pageContext.request.contextPath }/input_update.do?pageNo1=${all.nextPage}&pageSize1=${all.pageSize}">下一页</a>
						<a 
						    href="${pageContext.request.contextPath }/input_update.do?pageNo1=${all.lastPage}&pageSize1=${all.pageSize}">末页</a>
						<a>第${all.pageNo }页</a>
						<a>共${all.totalRecords }条记录</a>
						<a>共${all.lastPage }页</a>
						</center>
	    <p>&nbsp;</p>
</div></td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="${pageContext.request.contextPath }/images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>
</html>
