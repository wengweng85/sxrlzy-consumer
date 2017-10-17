<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务机构工作人员详细页面</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
         <table class="table table-bordered table-striped">
         <caption>机构工作人员详情</caption>
         <tr>
		      <td width="15%">姓名</td><td>${ec11.aac003}</td>
		      <td>身份证号码</td><td>${ec11.aac002}</td>
		 </tr>
		 <tr>
		      <td>性别</td><td>${ec11.aac004}</td>
		      <td>学历</td><td>${ec11.aac011}</td>
		 </tr>
		 <tr>
		      <td>政治面貌</td><td>${ec11.aac024}</td>
		      <td>岗位及职务</td><td>${ec11.aac023}</td>
		 </tr>
		 <tr>
		      <td>相关资格证号码</td><td>${ec11.aef001}</td>
		      <td>相关资格培训时间</td><td>${ec11.aef002_string}</td>
		 </tr>
	    </table>
    </div>
    <rc:jsfooter/>
</body>
    <script type="text/javascript">
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    });
    //关闭
    function select_closeframe(){
    	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    	parent.layer.close(index); //再执行关闭   
    }
    function demo_callback(response){
    	if(response.success){
    		alert(response.message);
    		parent.agencyPerson_query();
           	select_closeframe();
    	}
    	else{
    		alert(response.message);
    	}
    	
    }
    </script>
</body>
</html>