<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
	
	<%@ include file="../commons/mytaglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>任务详细信息</title>
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
        <p>您现在的位置 &gt;&gt; 查看任务 &gt;&gt; 任务详细信息</p>
        <h1>任务详细信息:</h1>

          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="579" colspan="5">${tkd.taskName }</td>
            </tr>
            <tr>
              <td class="tdcolor">任务描述</td>
              <td colspan="5">${tkd.taskDesc }</td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="15%">${tkd.beginDate }</td>
              <td width="20%" class="tdcolor">结束时间</td>
              <td width="50%" colspan="3"><p>${tkd.endDate }</p>              </td>
            </tr>
            <tr>
              <td class="tdcolor">实际开始时间</td>
              <td>${tkd.realBeginDate }</td>
              <td class="tdcolor">实际结束时间</td>
              <td colspan="3">${tkd.realEndDate }</td>
            </tr>
            <tr>
              <td class="tdcolor">实施人</td>
              <td>${tkd.assigner.employeeName }</td>
              <td class="tdcolor">任务状态</td>
              <td>${tkd.status }</td>
              <td class="tdcolor">计划数目</td>
              <td>${tkd.planCount }</td>
            </tr>
        </table>
	    <form id="form1" name="form1" method="post" action="program.do">
		  <h1>实施计划：</h1>
		  <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="15%" class="tdcolor">完成状态</td>
              <td width="20%" class="tdcolor">是否反馈</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
            <c:forEach items="${pbpls.data }" var="p">
            <tr>
              <td>${p.planName }</td>
              <td>${p.status }</td>
              <td>${p.isFeedback }</td>
              <td>${p.beginDate } </td>
              <td>${p.endDate }</td>
              <td><label>
                <input type="radio" name="planId" value="${p.planId }" />
              </label></td>
            </tr>
            </c:forEach>
          </table>
          <center>
           共${pbpls.totalRecords }条记录&nbsp;
   			 共${pbpls.lastPage }页&nbsp;
        <a href="taskdistribute.do?pageNo=${pbpls.firstPage}&pageSize=${pbpls.pageSize}">首页</a>
		<a href="taskdistribute.do?pageNo=${pbpls.previousPage}&pageSize=${pbpls.pageSize}">上一页</a>
		<a href="taskdistribute.do?pageNo=${pbpls.nextPage}&pageSize=${pbpls.pageSize}">下一页</a>
		<a href="taskdistribute.do?pageNo=${pbpls.lastPage}&pageSize=${pbpls.pageSize}">末页</a>
    第${pbpls.pageNo }页
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
