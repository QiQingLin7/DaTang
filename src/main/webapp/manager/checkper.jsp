<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../commons/mytaglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看人员</title>
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
<div id="logo"><img src="${pageContext.request.contextPath }/images/top.jpg" width="1002" height="258" /></div>
<!-- #EndLibraryItem --><table width="1002" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left.lbi" --><div id="left">
      <p><a href="taskview.do?pageNo=1&pageSize=4" target="_self">查看任务</a></p>
      <p><a href="addNewTask.do" target="_self">制定任务</a></p>
      <p><a href="taskundoneshow.do?pageNo=1&pageSize=4" target="_self">调整任务</a></p>
      <p><a href="doing.do?pageNo=1&pageSize=4" target="_self">跟踪任务</a></p>
      <p><a href="manage_byid.do?pageNo=1&pageSize=4" target="_self">查看人员</a></p>
      <p><a href="exit.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 查看人员 &gt;&gt; 人员信息</p>
        <h1>人员信息:</h1>
        <form id="form1" name="form1" method="post" action="manage_allunder.do">
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">姓名</td>
              <td class="tdcolor">性别</td>
              <td class="tdcolor">入职时间</td>
              <td class="tdcolor">职位</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
            <c:if test="${empty employeeNormalList.data }">
            				没有员工!
           					 </c:if>
							<c:forEach items="${employeeNormalList.data }" var="employee">
								<tr>
									<td>${employee.employeeName }</td>
									<td>${employee.sex }</td>
									<td><fmt:formatDate value="${employee.enrolldate }"
											pattern="yyyy-MM-dd" /></td>
									<td>${employee.duty }</td>
									<td><label> <input type="radio" name="empId"
											value="${employee.employeeId }" /> </label>
									</td>
								</tr>
							</c:forEach>
							
          </table>
          <center>
                                      共${employeeNormalList.totalRecords }条记录&nbsp;
   			  共${employeeNormalList.lastPage }页&nbsp;
        		<a href="manage_byid.do?pageNo=${employeeNormalList.firstPage}&pageSize=${employeeNormalList.pageSize}">首页</a>
				<a href="manage_byid.do?pageNo=${employeeNormalList.previousPage}&pageSize=${employeeNormalList.pageSize}">上一页</a>
				<a href="manage_byid.do?pageNo=${employeeNormalList.nextPage}&pageSize=${employeeNormalList.pageSize}">下一页</a>
				<a href="manage_byid.do?pageNo=${employeeNormalList.lastPage}&pageSize=${employeeNormalList.pageSize}">末页</a>
  			  第${employeeNormalList.pageNo }页
  			  </center>
    <p>
              <label>
              <input name="Submit" type="submit" class="menu3" value="详细信息" />
            </label>
          </p>
      </form>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="../images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>
</html>
