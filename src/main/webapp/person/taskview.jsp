<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="../commons/mytaglib.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>计划信息</title>
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
        <p>您现在的位置 &gt;&gt; 计划管理 &gt;&gt; 计划信息</p>
        <form id="form1" name="form1" method="post" action="input_addplan.do">
		<h1>任务详细信息:</h1>
          
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="579" colspan="3">${taskdesc.taskName }</td>
            </tr>
            <tr>
              <td class="tdcolor">任务描述</td>
              <td colspan="3">${taskdesc.taskDesc }</td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="579"><fmt:formatDate value="${taskdesc.beginDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
              <td width="579" class="tdcolor">结束时间</td>
              <td width="579"><fmt:formatDate value="${taskdesc.endDate }" pattern="yyyy-MM-dd"></fmt:formatDate></p>              </td>
            </tr>
            
            <tr>
              <td class="tdcolor">实施人</td>
              <td>${taskdesc.implementor.realName }</td>
              <td class="tdcolor">任务状态</td>
              <td>${taskdesc.status }
              </td>
            </tr>
        </table>


		  <h1>计划信息：</h1>
		  <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="15%" class="tdcolor">完成状态</td>
              <td class="tdcolor">是否反馈</td>
              <td class="tdcolor">开始时间</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
							<c:forEach items="${allPlan.data}" var="e">
								<tr>
									<td width="15%" class="tdcolor"><a href="feedback_input?planId=${e.planId }" target="_self">${e.planName }</a>
									</td>
									<c:choose>
										<c:when test="${e.status != null}">
											<td class="tdcolor">已完成</td>
										</c:when>
										<c:otherwise>
											<td class="tdcolor">未完成</td>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${e.isFeedback eq 'Y'}">
											<td class="tdcolor">已反馈</td>
										</c:when>
										<c:otherwise>
											<td class="tdcolor">未反馈</td>
										</c:otherwise>
									</c:choose>

									<td class="tdcolor"><fmt:formatDate
											value="${e.beginDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
									</td>
									<td class="tdcolor"><fmt:formatDate value="${e.endDate }"
											pattern="yyyy-MM-dd"></fmt:formatDate></td>
									<c:choose>
										<c:when test="${e.status eq '已完成'}">
											<td class="tdcolor">&nbsp;</td>
										</c:when>
										<c:otherwise>
											<td><label> <input type="checkbox" name="planId"
													value="${e.planId }" /> </label>
											</td>
										</c:otherwise>
									</c:choose>

								</tr>
								
							</c:forEach>
							
						</table>
		  <p>
		    <input name="Submit2" type="submit" class="menu2" value="新建" />
		   <input name="Submit" type="submit" class="menu1" value="删除" />
          </p>
      </form>
       <center>
					<a>共${allPlan.lastPage }页</a>
						<a
							href="${pageContext.request.contextPath }/page.do?pageNo1=${allPlan.firstPage}&pageSize1=${allPlan.pageSize}">首页</a>
						<a
							href="${pageContext.request.contextPath }/page.do?pageNo1=${allPlan.previousPage}&pageSize1=${allPlan.pageSize}">上一页</a>
						<a
							href="${pageContext.request.contextPath }/page.do?pageNo1=${allPlan.nextPage}&pageSize1=${allPlan.pageSize}">下一页</a>
						<a 
						    href="${pageContext.request.contextPath }/page.do?pageNo1=${allPlan.lastPage}&pageSize1=${allPlan.pageSize}">末页</a>
						<a>第${allPlan.pageNo }页</a>
						<a>共${allPlan.totalRecords }条记录</a>
						<a>共${allPlan.lastPage }页</a>
						</center>
    </div>    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="${pageContext.request.contextPath }/images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>
</html>

