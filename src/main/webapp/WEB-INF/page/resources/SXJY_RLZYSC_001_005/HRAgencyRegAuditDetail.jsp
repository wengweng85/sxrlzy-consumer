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
		      <td width="25%">机构名称</td><td width="25%">${ef11.aef104}</td>
		      <td width="25%">统一社会信用代码</td><td width="25%">${ef11.aab998}</td>
		 </tr>
		 <tr>
		      <td>机构状态</td><td>${ef11.aef105}</td>
		      <td>机构性质</td><td>${ef11.aef106}</td>
		 </tr>
		 <tr>
		      <td>经营类型</td><td>${ef11.aef109}</td>
		      <td>注册机关</td><td>${ef11.aef108}</td>
		 </tr>
		 <tr>
		      <td>隶属关系所在市</td><td>${ef11.aef107}</td>
		      <td>隶属关系所在区县</td><td>${ef11.aef134}</td>
		 </tr>
		 <tr>
		      <td>注册资金</td><td>${ef11.aef117}</td>
		      <td>办公场地类型</td><td>${ef11.aef113}</td>
		 </tr>
		 <tr>
		      <td>办公场所面积</td><td>${ef11.aef114}</td>
		      <td>邮政编码</td><td>${ef11.aef112}</td>
		 </tr>
		 <tr>
		      <td>办公地址</td><td colspan="3">${ef11.aef111}</td>
		 </tr>
		 <tr>
		      <td>开户银行</td><td>${ef11.aef113}</td>
		      <td>开户账号</td><td>${ef11.aef119}</td>
		 </tr>
		 </table>
		 <table class="table table-bordered table-striped">
         <caption>机构联系信息</caption>
         <tr>
		      <td width="25%">机构联系人</td><td width="25%">${ef11.aef121}</td>
		      <td width="25%">机构联系人电话</td width="25%"><td>${ef11.aef122}</td>
		 </tr>
		 <tr>
		      <td>机构联系人电子邮箱</td><td>${ef11.aef123}</td>
		      <td>机构网站</td><td>${ef11.aef124}</td>
		 </tr>
		 <tr>
		      <td>机构电话号码</td><td>${ef11.aef115}</td>
		      <td>机构传真号码</td><td>${ef11.aef116}</td>
		 </tr>
		 </table>
		 <table class="table table-bordered table-striped">
         <caption>机构法人信息</caption>
         <tr>
		      <td width="25%">法人代表姓名</td><td width="25%">${ef11.aef125}</td>
		      <td width="25%">法人代表身份证号</td><td width="25%">${ef11.aef126}</td>
		 </tr>
		 <tr>
		      <td>法人代表联系电话</td><td>${ef11.aef127}</td>
		      <td>法人代表电子邮箱</td><td>${ef11.aef128}</td>
		 </tr>
		 </table>
    </div>
    <rc:jsfooter/>
</body>
</html>