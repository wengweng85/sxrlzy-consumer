<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>服务机构详细信息页面</title>
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content ">
         <table class="table table-bordered table-striped">
         <caption>机构基本信息</caption>
         <tr>
		      <td width="25%">机构名称</td><td width="25%">${ef11.ef11[0].aef104}</td>
		      <td width="25%">统一社会信用代码</td><td width="25%">${ef11.ef11[0].aab998}</td>
		 </tr>
		 <tr>
		      <td>机构状态</td><td>${ef11.ef11[0].aef105}</td>
		      <td>机构性质</td><td>${ef11.ef11[0].aef106}</td>
		 </tr>
		 <tr>
		      <td>举办农民工专场招聘会次数</td><td>${ef11.aee126}</td>
		      <td>举办高校毕业生专场招聘会次数</td><td>${ef11.aee127}</td>
		 </tr>
		  <tr>
		      <td>参会用人单位</td><td>${ef11.aee128}</td>
		      <td>提供招聘岗位</td><td>${ef11.aee129}</td>
		 </tr>
		 <tr>
		      <td>参会求职人员</td><td>${ef11.aee130}</td>
		      <td>服务人员总数</td><td>${ef11.aee131}</td>
		 </tr>
		 <tr>
		      <td>登记求职和要求提供流动服务人员</td><td>${ef11.aee132}</td>
		      <td>帮助实现就业和流动人数</td><td>${ef11.aee133}</td>
		 </tr>
		  <tr>
		      <td>服务用人单位（服务对象情况）</td><td>${ef11.aee134}</td>
		      <td>服务用人单位（劳务派遣）</td><td>${ef11.aee135}</td>
		 </tr>
		 <tr>
		      <td>现存档案数量</td><td>${ef11.aee140}</td>
		      <td>依托档案提供服务</td><td>${ef11.aee141}</td>
		 </tr>
		 </table>
    </div>
    <rc:jsfooter/>
    
   <script type="text/javascript">
	    $(function(){
	    	//$('#ef11table').inittable(demo_options);
	    }); 
   </script>
</body>
</html>