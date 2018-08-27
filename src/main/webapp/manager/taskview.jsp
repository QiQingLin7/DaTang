<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查看任务</title>
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
<div id="logo"><img src="${pageContext.request.contextPath }/images/top.jpg" width="1002" height="258" /></div>
<!-- #EndLibraryItem --><table width="1002" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left.lbi" --><div id="left">
      <p><a href="#" target="_self">查看任务</a></p>
      <p><a href="addNewTask.do" target="_self">制定任务</a></p>
      <p><a href="taskundoneshow.do?pageNo=1&pageSize=4" target="_self">调整任务</a></p>
      <p><a href="doing.do?pageNo=1&pageSize=4" target="_self">跟踪任务</a></p>
      <p><a href="manage_byid.do?pageNo=1&pageSize=4" target="_self">查看人员</a></p>
      <p><a href="exit.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 查看任务 &gt;&gt; 任务信息</p>
        <h1>任务信息:</h1>
        <form action="taskdistribute.do" method="post" name="form1" target="_self" id="form1">
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="15%" class="tdcolor">实施人</td>
              <td width="15%" class="tdcolor">开始时间</td>
              <td width="15%" class="tdcolor">结束时间</td>
              <td width="15%" class="tdcolor">任务状态</td>
              <td width="15%" class="tdcolor">计划数目</td>
              <td width="10%" class="tdcolor">&nbsp;</td>
            </tr>
			<c:forEach items="${pbtasks.data }" var="t">
				<tr>
              		<td>${t.taskName }</td>
             	 	<td>${t.assigner.realName }</td>
              		<td>${t.beginDate }</td>
              		<td>${t.endDate } </td>
             		<td>${t.status }</td>
              		<td>${t.planCount }</td>
              		<td><input type="radio" name="taskId" value="${t.taskId }" />
              		<input type="hidden" name="pageNo" value="1" />
              		<input type="hidden" name="pageSize" value="2" /></td>
				</tr>
			</c:forEach>
          </table>
          <center>
          	  共${pbtasks.totalRecords }条记录&nbsp;
   			  共${pbtasks.lastPage }页&nbsp;
        		<a href="taskview.do?pageNo=${pbtasks.firstPage}&pageSize=${pbtasks.pageSize}">首页</a>
				<a href="taskview.do?pageNo=${pbtasks.previousPage}&pageSize=${pbtasks.pageSize}">上一页</a>
				<a href="taskview.do?pageNo=${pbtasks.nextPage}&pageSize=${pbtasks.pageSize}">下一页</a>
				<a href="taskview.do?pageNo=${pbtasks.lastPage}&pageSize=${pbtasks.pageSize}">末页</a>
  			  第${pbtasks.pageNo }页
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
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="${pageContext.request.contextPath }/images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>
</html>
