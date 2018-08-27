<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="../commons/mytaglib.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的任务</title>
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
<div id="logo"><img src="${pageContext.request.contextPath }/images/top.jpg" width="1002" height="258" /></div>
<!-- #EndLibraryItem --><table width="1002" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left2.lbi" -->
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
<div id="left">
      <p>
						<a href="${pageContext.request.contextPath }/input_task.do" target="_self">计划管理</a>
					</p>
					<p>
						<a href="${pageContext.request.contextPath }/plan_list.do" target="_self">查询计划</a>
					</p>
					<p>
						<a href="${pageContext.request.contextPath }/input_task.do" target="_self">我的任务</a>
					</p>
					<p>
						<a href="${pageContext.request.contextPath }/exit.do" target="_self">退出系统</a>
					</p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 我的任务 &gt;&gt; 任务信息</p>
        <h1>任务信息:</h1>
        <form id="form1" name="form1" method="post" action="plan.do">
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="15%" class="tdcolor">制定人</td>
              <td width="15%" class="tdcolor">开始时间</td>
              <td width="15%" class="tdcolor">结束时间</td>
              <td width="15%" class="tdcolor">任务状态</td>
              <td width="15%" class="tdcolor">计划数目</td>
              <td width="10%" class="tdcolor">&nbsp;</td>
            </tr>
	            <c:forEach items="${allTask.data}" var="e">
									<tr>
										<td width="15%" class="tdcolor">${e.taskName }</td>
										<td class="tdcolor">${e.assigner.realName}</td>
										<td class="tdcolor"><fmt:formatDate value="${e.beginDate }"  pattern="yyyy-MM-dd"></fmt:formatDate></td>
										<td class="tdcolor"><fmt:formatDate value="${e.endDate }"  pattern="yyyy-MM-dd"></fmt:formatDate></td>
										<td class="tdcolor">${e.status }</td>
										<td class="tdcolor">${e.planCount}</td>
										 <td><input type="radio" name="taskid" value="${e.taskId }" /></td>
									</tr>
			</c:forEach>
			
          </table>
    <p>
              <label>
              <input name="Submit" type="submit" class="menu3" value="计划管理" />
            </label>
          </p>
      </form>
      <center>
					<a>共${allTask.lastPage }页</a>
						<a
							href="${pageContext.request.contextPath }/input_task.do?pageNo1=${allTask.firstPage}&pageSize1=${allTask.pageSize}">首页</a>
						<a
							href="${pageContext.request.contextPath }/input_task.do?pageNo1=${allTask.previousPage}&pageSize1=${allTask.pageSize}">上一页</a>
						<a
							href="${pageContext.request.contextPath }/input_task.do?pageNo1=${allTask.nextPage}&pageSize1=${allTask.pageSize}">下一页</a>
						<a 
						    href="${pageContext.request.contextPath }/input_task.do?pageNo1=${allTask.lastPage}&pageSize1=${allTask.pageSize}">末页</a>
						<a>第${allTask.pageNo }页</a>
						<a>共${allTask.totalRecords }条记录</a>
						<a>共${allTask.lastPage }页</a>
						</center>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="${pageContext.request.contextPath }/images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>
</html>
