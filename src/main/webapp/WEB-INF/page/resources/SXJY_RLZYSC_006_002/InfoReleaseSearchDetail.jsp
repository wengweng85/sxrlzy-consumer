<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息展示详细信息页面</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
         <table class="table table-bordered table-striped">
         <%-- <caption>信息发布详情</caption> --%>
         <tr>
		      <td width="15%">标题</td><td>${ee14.aee119}</td>
		 </tr>
		 <tr>
		      <td>发布时间</td><td>${ee14.aee123_string}</td>
		 </tr>
		 <tr>
		      <td>发布内容</td><td colspan="3">${ee14.aee120}</td>
		 </tr>
	    </table>
	    <c:if test="${not empty fileList}">
	    <div>
	       <p>附件：</p>
	       <c:forEach var="item" items="${fileList}">
	               <a class="link" onclick="rc.download_file_by_id('${item.bus_uuid}')">${item.file_name}</a><br>
	       </c:forEach>
	    </div>
	    </c:if> 
    </div>
    <rc:jsfooter/>
</body>
</html>