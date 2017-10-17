<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查阅投诉历史信息</title>
    <rc:csshead/>
</head>
<body class="gray-bg" style="width: 100%" marginheight="50">
    <div class="wrapper wrapper-content "  style="width:100% ">
            <table class="table table-bordered table-striped" >
		            <tr >
		                 <td width="20%">投诉者姓名</td><td>${ee13.aee109}</td>
		                 <td>投诉者联系电话</td><td>${ee13.aee113}</td>
		            </tr>
		           
		             <tr>
		                 <td width="20%">被投诉机构名称</td><td>${ee13.aee114}</td>
		                 <td>投诉标题</td><td >${ee13.aee110}</td>
		            </tr>
		             <tr>
		               <td width="20%">受理状态</td><td colspan="3">${ee13.aee115}</td>
		             </tr>
		              <tr>
		                <td width="20%">投诉内容</td><td colspan="3">${ee13.aee111}</td>
		              </tr>
		             
		              <tr>
		             
		                 <td width="20%">回复内容</td><td colspan="3">${ee13.aee112}</td>
		            </tr>
		       </table>
    </div>
    <rc:jsfooter/>
</body>
</html>