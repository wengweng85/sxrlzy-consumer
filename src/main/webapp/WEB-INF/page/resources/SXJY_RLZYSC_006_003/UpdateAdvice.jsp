<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改意见建议</title>
    <rc:csshead/>
</head>
<body class="gray-bg" style="margin-top:40px">
    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <!--fluid 是偏移一部分-->
                    <div class="container-fluid " style="padding: 0px 20px;">
	                      <div class="form-group" style="text-align: right;">
	                          <a class="btn btn-primary " onclick="demo_save_data()"><i class="fa fa-save"></i>&nbsp;保存</a>
	                      </div>
                </div>
            </div>
     </div>
    <div class="wrapper wrapper-content ">
         <form action="${contextpath}/resources/SXJY_RLZYSC_006_003/updateEe17data" >
        <div id="input_content">
	        <!-- 添加信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
			            <div class="hr-line-dashed"></div>
			             <div class="form-group">
			                <rc:hidden property="eee171" value="${ee17.eee171}"/>
			                <rc:textedit  property="aee150" readonly="true" required="true"  label="意见标题" cols="2,6" value="${ee17.aee150}" validate="{required:true,messages:{required:'标题信息不能为空'}}"/>
			            </div>		             			            
			            <div class="hr-line-dashed"></div>
					    <rc:textarea label="意见内容" property="aee151"   required="true" rows="6"  value="${ee17.aee151}" validate="{required:true,messages:{required:'备注信息不能为空'}}"/>					  					    			       
		       </div>
	        </div>	        
	         
         </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    function select_demo_by_id(eee171){
    	rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_006_003/getEe17ById'/>/"+eee171,$('#input_content'));
    } 
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    })
    
    //保存页面配置信息
	function demo_save_data(){
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
    		parent.demo_query();
           	select_closeframe();
    	}
    	else{
    		alert(response.message);
    	}
    	
    }
    
    </script>
</body>
</html>



























