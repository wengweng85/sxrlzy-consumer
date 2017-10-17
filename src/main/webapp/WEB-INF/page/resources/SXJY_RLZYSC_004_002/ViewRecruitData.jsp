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
		                 <td width="25%">机构名称</td><td width="25%">${ef11.aef104}</td>	
		                 <td width="25%">数据所属期</td><td width="25%">${ee15.aee124}</td>
		            </tr>
		            <tr>
		                 <td>录入时间</td><td>${ee15.aee125_string}</td>
		                 <td>农民工专场招聘会次数</td><td>${ee15.aee126}</td>
		            </tr>
		            <tr>
		                 <td>高校毕业生专场招聘会</td><td>${ee15.aee127}</td>
		                 <td>参会用人单位</td><td>${ee15.aee128}</td>
		            </tr>
		            <tr>
		                 <td>参会求职人数</td><td>${ee15.aee130}</td>	               
		                 <td>招聘岗位</td><td>${ee15.aee129}</td>
		            </tr>
		            
            </table>		    
    </div>
    <rc:jsfooter/>  
</body>
</html>