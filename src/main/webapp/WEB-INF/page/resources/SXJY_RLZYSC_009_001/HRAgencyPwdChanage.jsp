<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>密码修改页面</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
         <!-- 查询条件开始 -->
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>用户密码修改</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
	            <form class="form-horizontal" action="${contextpath}/resources/SXJY_RLZYSC_009_001/tochanagepwd"  id="query_form" >
			       <div class="form-group">
			            <rc:textedit property="aec101" label="用户名"  value="${ec12.aec101 }" readonly="true" cols="2,3"/>
			       </div>
			       <div class="hr-line-dashed"></div>
			       <div class="form-group">
				        <rc:textedit property="aec102" type="password" required="true"  label="旧密码" cols="2,3" validate="{required:true,messages:{required:'旧密码不能为空'}}" onchange="isCheckOldPwd()"/>
				   </div>
				   <div class="hr-line-dashed"></div>
			       <div class="form-group">
				        <rc:textedit property="aec102_1" type="password" required="true"  label="新密码"  cols="2,3" onchange="isCheckNewPwd()"  validate="{required:true,messages:{required:'新密码不能为空'}}"/>
				   </div>
				   <div class="hr-line-dashed"></div>
				   <div class="form-group">
				        <div class="col-sm-3" align="right">
		                <a class="btn btn-info" onclick="demo_save_data()"><i class="fa fa-save"></i>&nbsp;修改</a>
		                <a class="btn btn-info" onclick="clean()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
		                </div>   
		           </div>
		       </form>
	       </div>
        </div>
        <!-- 查询条件结束 -->
            
    </div>
    <!-- javascript引入 -->
    <rc:jsfooter/>
    <script type="text/javascript">
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    });
    //清空form
    function clean(){
    	$('#aec102').val("");
    	$('#aec102_1').val("");
    }
    //保存页面配置信息
	function demo_save_data(){
		var aec102=$('#aec102').val();
    	if(!aec102){
    		layer.msg('旧密码不能为空');
    		$('#aec102').focus();
    		return ;
    	} 
		var aec102_1=$('#aec102_1').val();
    	if(aec102){
    		if(!aec102_1){
        		layer.msg('请输入新密码');
        		$('#aec102_1').focus();
        		return ;
        	}
    	} 
    	var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{6,16}$/;
    	var newPassword = reg.test(aec102_1);
    	if(newPassword == false){
    		layer.msg("密码必须由6-16数字和字母组成");
    		//$('#aec102_1').val("");
    		return ;
    	}
	   $('form').submit();
	}
	function demo_callback(response){
    	if(response.success){
    		alert(response.message);
    		$('#aec102').val("");
    		$('#aec102_1').val("");
    	}
    	else{
    		alert(response.message);
    	}
    }
	//校验旧密码
	function isCheckOldPwd(){
		var aec101=$('#aec101').val();
		var aec102=$('#aec102').val();
    	if(!aec102){
    		layer.msg('旧密码不能为空');
    		$('#aec102').focus();
    		return ;
    	} else {
    		//查询用户表，验证旧密码是否正确
    		var url = "<c:url value='/resources/SXJY_RLZYSC_009_001/getHRAgencyUserPwdById'/>/"+aec101+"/"+aec102;
     		var param = param=$('input_content').serializeObject();
     		$.ajax({
                type : "post",
                url : url,
                dataType : "json",
                data: param,  //传入组装的参数
                success:function(response,textStatus){
                	if(response.success){
                		$('#aec102_1').focus();
                	}else{
                		layer.msg(response.message);
                	    $('#aec102').val('');
                	    $('#aec102').focus();
                	}
                },
                error : function(response) {
                	layer.alert(response.message);
                }
            });
    	}
	}
	//校验新密码
	function isCheckNewPwd(){
		var aec102=$('#aec102').val();
      	var aec102_1=$('#aec102_1').val();
    	if(aec102){
    		if(!aec102_1){
        		layer.msg('请输入新密码');
        		$('#aec102_1').focus();
        		return ;
        	}
    	} 
    	var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{6,16}$/;
    	var newPassword = reg.test(aec102_1);
    	if(newPassword == false){
    		layer.msg("密码必须由6-16数字和字母组成");
    		//$('#aec102_1').val("");
    		return ;
    	}
        if(aec102&&aec102_1){
    		if(aec102_1==aec102){
        		layer.msg('新密码与旧密码相同,请输入不同的新密码');
        		$('#aec102_1').val("");
        		$('#aec102_1').focus();
        		return ;
        	}
    	}
	}
    </script>
</body>
</html>