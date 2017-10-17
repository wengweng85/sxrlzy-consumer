<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo查看页面</title>
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content ">
            <table class="table table-bordered table-striped">
		            <tr>
		                 <td width="15%">公告标题</td><td colspan="3">${ee11.aee102}</td>
		            </tr>
		            <tr>
		                 <td>生效时间</td><td>${ee11005}</td>
		                 <td>失效时间</td><td>${ee11006}</td>
		            </tr>
		            <tr>
		                 <td>是否发布</td><td>${ee11.aee107}</td>
		                 <td>行政区划</td><td>${ee11.aab301}</td>
		            </tr>
		            <tr>
		                 <td>详细内容</td><td colspan="3">${ee11.aee103}</td>
		            </tr>
            </table>
		    <!-- 人员附加信息结束-->
    </div>
    <rc:jsfooter/>
</body>
</html>