<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../commons/mytaglib.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查询计划</title>
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
        <p>您现在的位置 &gt;&gt; 查询计划 &gt;&gt; 查询</p>
        <spf:form name="form1" id="form1" action="plan_query.do" modelAttribute="dto" method="post">
          <h1>查询信息:</h1>
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="579">
				 <spf:input path="planName" size="15" />
			  </td>
            </tr>
            <tr>
              <td class="tdcolor">所属任务</td>
              <td><spf:select path="task.taskId">
              	<spf:options items="${requestScope.allTask }"
              	itemLabel="taskName" itemValue="taskId" />
              </spf:select>
              </td>
            </tr>
            
            <tr>
              <td class="tdcolor">开始时间</td>
              <td>从
                <spf:input path="beginDate1" size="15" />
              到
              <spf:input path="beginDate2" size="15" />            </td>
            </tr>
            <tr>
              <td class="tdcolor">结束时间</td>
              <td>从
                <spf:input path="endDate1" size="15" />
到
<spf:input path="endDate2" size="15" /></td>
            </tr>
            <tr>
              <td class="tdcolor">是否反馈</td>
              <td><label>
                <spf:input path="isFeedback" size="15" />
              </label></td>
            </tr>
          </table>
          <p>
            <input name="Submit" type="submit" class="menu3" value="查询计划" />
          </p>
		  
		  		  <h1>计划信息：</h1>
		  <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="15%" class="tdcolor">所属任务</td>
              <td class="tdcolor">开始时间</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">计划状态</td>
              <td class="tdcolor">是否反馈</td>
            </tr>
            <c:forEach items="${all.data }" var="a">
            <tr>
              <td><a href="feedback_input?planId=${a.planId }" target="_self">${a.planName }</a></td>
              <td>${a.task.taskName }</td>
              <td><fmt:formatDate value="${a.beginDate }" pattern="yyyy-MM-dd" /> </td>
              <td><fmt:formatDate value="${a.endDate }" pattern="yyyy-MM-dd" /></td>
              <td>${a.status }</td>
              <td><label>${a.isFeedback }</label></td>
            </tr>
            </c:forEach>
            <tr>
            <td colspan="6">
            <c:if test="${flag eq 'all' }">
            <center>
           			<a href="${pageContext.request.contextPath }/plan_list.do?pageNo1=${all.firstPage}&pageSize1=${all.pageSize}">首页</a>
					<a href="${pageContext.request.contextPath }/plan_list.do?pageNo1=${all.previousPage}&pageSize1=${all.pageSize}">上一页</a>
					<a href="${pageContext.request.contextPath }/plan_list.do?pageNo1=${all.nextPage}&pageSize1=${all.pageSize}">下一页</a>
					<a href="${pageContext.request.contextPath }/plan_list.do?pageNo1=${all.lastPage}&pageSize1=${all.pageSize}">末页</a>
					<a>第${all.pageNo }页</a>
					<a>共${all.totalRecords }条记录</a>
					<a>共${all.lastPage }页</a></center>
            </c:if>
            <c:if test="${flag eq 'adv' }">
            <center>
           			<a href="${pageContext.request.contextPath }/plan_query.do?pageNo1=${all.firstPage}&pageSize1=${all.pageSize}">首页</a>
					<a href="${pageContext.request.contextPath }/plan_query.do?pageNo1=${all.previousPage}&pageSize1=${all.pageSize}">上一页</a>
					<a href="${pageContext.request.contextPath }/plan_query.do?pageNo1=${all.nextPage}&pageSize1=${all.pageSize}">下一页</a>
					<a href="${pageContext.request.contextPath }/plan_query.do?pageNo1=${all.lastPage}&pageSize1=${all.pageSize}">末页</a>
					<a>第${all.pageNo }页</a>
					<a>共${all.totalRecords }条记录</a>
					<a>共${all.lastPage }页</a></center>
            </c:if>
           	</td>
            </tr>
          </table>
        </spf:form>
      </div>    </td>
  </tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="../images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>
</html>
