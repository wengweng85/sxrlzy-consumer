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
		                 <td>机构名称</td><td>${ef11.aef104}</td>	
		                 <td>机构状态</td><td>${ef11.aef105}</td>
		            </tr>
		            <tr>
		                 <td>机构性质</td><td>${ef11.aef106}</td>
		                 <td>隶属关系</td><td>${ef11.aef107}</td>
		            </tr>
		            <tr>
		                 <td>统一社会信用代码</td><td>${ef11.aab998}</td>
		                 <td>注册机关</td><td>${ef11.aef108}</td>
		            </tr>
		            <tr>
		                 <td>经营类型</td><td>${ef11.aef109}</td>
		                 <td>机构法人代表</td><td>${ef11.aef125}</td>
		            </tr>		            
		            <tr>
		                 <td>办公场地类型</td><td>${ef11.aef113}</td>
		                 <td>机构联系号码</td><td>${ef11.aef115}</td>
		            </tr>		            
		            <tr>
		                 <td>机构地址</td><td>${ef11.aef111}</td>
		                 <td>注册资金</td><td>${ef11.aef117}</td>	               
		            </tr>	            
		            <tr>
		                 <td>开户账号</td><td>${ef11.aef119}</td>
		                 <td>机构联系人</td><td>${ef11.aef121}</td>
		            </tr>
		            <tr>
		                 <td>机构联系人电话</td><td>${ef11.aef122}</td>
		                 <td>法人代表姓名</td><td>${ef11.aef125}</td>		                 
		            </tr>	          
		            <tr>
		                 <td>法人代表身份证号</td><td>${ef11.aef126}</td>
		                 <td>法人代表联系电话</td><td>${ef11.aef127}</td>
		            </tr>		            		            

            </table>		    
    </div>
    <rc:jsfooter/>  
</body>
</html>