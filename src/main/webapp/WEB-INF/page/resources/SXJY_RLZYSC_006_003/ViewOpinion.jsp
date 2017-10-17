<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看详细信息</title>
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content ">
            <table class="table table-bordered table-striped">
		            <tr>
		                 <td>机构名称</td><td>${ee17.aef104}</td>
		            </tr>
		            <tr>
		                 <td>意见标题</td><td>${ee17.aee150}</td>
		            </tr>
		            <tr>
		                 <td>意见内容</td><td>${ee17.aee151}</td>
		            </tr>
		            <tr>
		                 <td>是否回复</td><td>${ee17.aee152}</td>
		            </tr>
		            <tr>
		                 <td>回复内容</td><td>${ee17.aee153}</td>
		            </tr>
		            <tr>
		                 <td>提交时间</td><td>${ee17.aee154_string}</td>
		            </tr>
		   
            </table>		    
    </div>
    <rc:jsfooter/>  
</body>
</html>