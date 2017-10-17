<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改公告</title>
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
         <form action="${contextpath}/resources/SXJY_RLZYSC_003_001/saveEe11data" >
        <div id="input_content">
	        <!-- 人员选择基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>基本信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
		                <div class="form-group">
		                    <rc:hidden property="eee111" value="${ee11.eee111 }"/>
			                <rc:textedit property="aef101"  value="${ee11.aef101}"  label="机构编号"  cols="2,4" />
			                 <rc:select property="aab301"  value="${ee11.aab301}" label="行政区划" readonly="true" cols="2,2"  codetype="AAB802"  validate="{required:true,messages:{required:'隶属关系所在区县不能为空'}}"/>
			            </div>
			               <div class="hr-line-dashed"></div>
					    <div class="form-group">
					        <rc:textedit  property="aee102" required="true"  label="公告标题" cols="2,6"  value="${ee11.aee102}"/>
					    </div>
					       <div class="hr-line-dashed"></div>
					    <div class="form-group">
					         <rc:date label="起始时间" property="aee105" required="true"  cols="2,4" value="${ee11.aee105_string}"/>
					    </div>
					       <div class="hr-line-dashed"></div>
					    <div class="form-group">
					       <rc:date property="aee106" required="true"  label="截止时间" cols="2,4"  value="${ee11.aee106_string}" />
					    </div>
			             <div class="hr-line-dashed"></div>
					    <rc:textarea label="公告内容" property="aee103"   required="true" rows="6" value="${ee11.aee103}"  validate="{required:true,messages:{required:'备注信息不能为空'}}"/>
					    
					    <div class="hr-line-dashed"></div>
					    <div class="form-group">
					        <rc:select label="是否发布" property="aee107" cols="2,2" value="${ee11.aee107}" codetype="AEE107"/> 
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
    function select_demo_by_id(aef101){
    	rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_001_002/getEf11ById'/>/"+aef101,$('#input_content'));
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
    
    function aac003_change(obj){
    	alert(obj.value);
    }
    
    </script>
</body>
</html>



























