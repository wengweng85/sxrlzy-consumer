<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>服务机构复审不通过页面</title>
    <rc:csshead/>
</head>
<body class="gray-bg" style="margin-top:40px">
<div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <!--fluid 是偏移一部分-->
                    <div class="container-fluid " style="padding: 0px 20px;">
	                    <div class="form-group" style="text-align: right;">
	              <a class="btn btn-primary " onclick="notpass_update_data()"><i class="fa fa-save"></i>&nbsp;保存</a>
	         </div>
                </div>
            </div>
     </div>
    <div class="wrapper wrapper-content ">
        <form action="${contextpath}/resources/SXJY_RLZYSC_001_005/notpassupdatedata?flag=2" >
        <div id="input_content">
	        <!-- 机构基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
				           <rc:hidden property="aab998" value="${ef11.aab998}" />
				           <rc:hidden property="eef121" value="${ef11.eef121}" />
			               <rc:textedit  property="aef104"   label="机构名称"  value="${ef11.aef104}"   readonly="true" cols="2,5"  />
			            </div>
			            <div class="hr-line-dashed"></div>
			            <rc:textarea label="审核不通过原因" property="aae203"   required="true" rows="3"   validate="{required:true,maxlength:2000,messages:{required:'审核不通过原因不能为空'}}"/>
			            
			       </div>
		       </div>
	        </div>
	        <!-- 机构基本信息结束 -->
	        
         </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    })
    
    //保存页面配置信息
	function notpass_update_data(){
	   $('form').submit();
	}
    
     //关闭
    function select_closeframe(){
    	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    	parent.layer.close(index); //再执行关闭   
    }
  
    function demo_callback(response){
    	if(response.success){
           	alert(response.message);
           	parent.hragency_query();
           	select_closeframe();
    	}
    	else{
    		alert(response.message);
    	}
    }
    
    </script>
</body>
</html>