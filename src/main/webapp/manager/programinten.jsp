<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
	
	<%@ include file="../commons/mytaglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>跟踪计划信息</title>
<script type="text/javascript" src="js/jquery-1.12.0.js" ></script>
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css" />
<style>
   .cl{
      border:none;
   }
</style>
<script>
   function Ckclick(id){
      if($("#tr"+id+":hidden").length>0){
      	 $("#tr"+id).css("display","block");
      	 }
      	 else{
      	 $("#tr"+id).css("display","none");
      }
   }
</script>
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
        <p>您现在的位置 &gt;&gt; 跟踪任务 &gt;&gt; 跟踪计划信息</p>
		 <spf:form id="form1" modelAttribute="proTask" name="form1" method="post" action="promodify.do">
		<h1>任务详细信息:</h1>
          
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="579" colspan="3"><spf:input path="taskName" class="cl"/></td>
            </tr>
            <tr>
              <td class="tdcolor">任务描述</td>
              <td colspan="3"><spf:input path="taskDesc" class="cl"/></td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="579"><spf:input path="beginDate" class="cl"/></td>
              <td width="579" class="tdcolor">结束时间</td>
              <td width="579"><p><spf:input path="endDate" class="cl"/></p>              </td>
            </tr>
            
            <tr>
              <td class="tdcolor">实施人</td>
              <td><spf:input path="assigner.employeeName" class="cl"/></td>
              <td class="tdcolor">任务状态</td>
              <td>
               
                  <select name="status">
                    <option value="实施中">实施中</option>
                    <option value="已完成">已完成</option>
                  </select>              </td>
            </tr>
        </table>
		<input name="Submit" type="submit" class="menu4" value="提交" />
		</spf:form>
             <form id="form2" name="form1" method="post" action="doing.do?pageNo=1&pageSize=4">
		  <h1>计划信息：</h1>
		  <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="15%" class="tdcolor">完成状态</td>
              <td class="tdcolor">是否反馈</td>
              <td class="tdcolor">开始时间</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">反馈信息</td>
            </tr>
            <c:if test="${empty pbplist.data }">
           		 没有计划！
            </c:if>
            <c:forEach items="${pbplist.data }" var="p">
            <tr>
              <td>${p.planName }</td>
              <td>${p.status }</td>
              <td>${p.isFeedback }</td>
              <td>${p.beginDate } </td>
              <td>${p.endDate }</td>
              <td>
              <c:if test="${p.isFeedback eq '已反馈' }">
              <label>
                <input type="checkbox" class="ck" onclick="Ckclick(${p.planId})" name="radiobutton" value="radiobutton" />
              </label>
              </c:if>
              </td>
            </tr>
            <tr style="display: none" id="tr${p.planId }">
             
              <td colspan="6"> ${p.feedbackInfo }</td>
              
            </tr>
            </c:forEach>
          </table>
          <center>
          	共${pbplist.totalRecords }条记录&nbsp;
   			  共${pbplist.lastPage }页&nbsp;
        		<a href="programinten.do?pageNo=${pbplist.firstPage}&pageSize=${pbplist.pageSize}&taskId=${tk.taskId}">首页</a>
				<a href="programinten.do?pageNo=${pbplist.previousPage}&pageSize=${pbplist.pageSize}&taskId=${tk.taskId}">上一页</a>
				<a href="programinten.do?pageNo=${pbplist.nextPage}&pageSize=${pbplist.pageSize}&taskId=${tk.taskId}">下一页</a>
				<a href="programinten.do?pageNo=${pbplist.lastPage}&pageSize=${pbplist.pageSize}&taskId=${tk.taskId}">末页</a>
  			  第${pbplist.pageNo }页
  			  </center>
		  <p>
              <label>
              <input name="Submit" type="submit" class="menu3" value="返回" />
            </label>
          </p>
      </form>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/copyright.lbi" --><div class="copyright">COPYRIGHT 2007 DATANG TELECOM TECHNOLOGY CO.LTD 京ICP备06071639号</div><!-- #EndLibraryItem --><!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="${pageContext.request.contextPath }/images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>
</html>
