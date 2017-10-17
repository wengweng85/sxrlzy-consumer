<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>投诉受理页面</title>
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
         <form action="${contextpath}/resources/SXJY_RLZYSC_005_001/updateEe13data" >
        <div id="input_content">
	        <!-- 人员选择基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>投诉信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal" >
		                 <div class="form-group">
		                    <rc:hidden property="eee131" value="${ee13.eee131}"/>
			                <rc:textedit label="被投诉者姓名" cols="2,3" property="aee109"  readonly="true" value="${ee13.aee109}"/>
			                <rc:textedit  property="aee113"  cols="2,3" readonly="true" label="被投诉者手机号码"   value="${ee13.aee113}"/>
			             </div>
					     <div class="hr-line-dashed"></div>
					     <div class="form-group">
					        <rc:textedit label="被投诉机构名称" property="aee114" value="${ee13.aee114}" readonly="true" cols="2,3"/>
					        <rc:textedit label="投诉标题" property="aee110" value="${ee13.aee110}" readonly="true" cols="2,3"/>
					     </div>
					     <div class="hr-line-dashed"></div>
					     <div class="form-group">
					        <rc:textedit label="投诉时间" property="aee116" value="${aee116}"  readonly="true" cols="2,3"/>
					     </div>
			             <div class="hr-line-dashed"></div>
			             <rc:textarea label="投诉内容" property="aee111" rows="3" value="${ee13.aee111}"/>
					     <div class="hr-line-dashed"></div> 
					     <rc:textarea label="回复内容" property="aee112" rows="3" />
					     </div>
			       </div>
		       </div>
	        </div>
	        <!-- 人员基本信息结束 -->
	        
	     
         </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    })
    
       //关闭
    function select_closeframe(){
    	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    	parent.layer.close(index); //再执行关闭   
 
    }
  
  
    
    //保存页面配置信息
	function demo_save_data(){
	   $('form').submit();
	}
    
	  function demo_callback(response){
	    	if(response.success){
	    		alert(response.message);
	    		parent.demo_query();
	           	select_closeframe();
	    	}
	    }
    
    function aac003_change(obj){
    	alert(obj.value);
    }
    
    </script>
</body>
</html>



























