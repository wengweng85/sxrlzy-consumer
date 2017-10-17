<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>新增投诉举报</title>
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
         <form action="${contextpath}/resources/SXJY_RLZYSC_005_001/saveEe13data" >
        <div id="input_content">
	        <!-- 人员选择基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
                <h5>新增投诉信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
		                <div class="form-group">
		                <rc:select property="aef107" required="true"  label="隶属关系所在市"  cols="2,2" onchange="rc.code_value_select_data_change(this.value,'AAB802',['#aef134','#aee114'])"     codetype="AAB801" validate="{required:true,messages:{required:'隶属关系所在市不能为空'}}"/>
			            <rc:select property="aef134" required="true"  label="隶属关系所在区县" readonly="true" cols="2,2" onchange="rc.code_value_select_data_change(this.value,'AEF104',['#aee114'])"  codetype="AAB802"  validate="{required:true,messages:{required:'隶属关系所在区县不能为空'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			             <div class="form-group">
			               	<rc:select property="aee114"   label="被投诉机构名称"  required="true"  readonly="true"  cols="2,2" codetype="AEF104"  validate="{required:true,messages:{required:'被投诉机构不能为空'}}"/>
			               	<rc:textedit property="aee110" label="投诉标题"  required="true" validate="{required:true,messages:{required:'投诉标题不能为空'}}" cols="2,2"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			             <div class="form-group">
			               <rc:textedit  property="aee109" required="true"  label="投诉者姓名" cols="2,2"  validate="{required:true,messages:{required:'投诉者姓名不能为空'}}"/>
			               <rc:textedit  property="aee113" required="true"  label="投诉者电话" cols="2,2"  validate="{required:true,messages:{required:'投诉者电话不能为空'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
					    <rc:textarea label="投诉内容" property="aee111"   required="true" rows="6"  />
					    
			       </div>
		       </div>
	        </div>
	        <!-- 人员基本信息结束 -->
	        
	   
	        <div class="form-group" style="text-align: right;">
	              
	              <button  class="btn btn-primary " onclick="location.href='../../gotologin'">返回登录页面</button>
	        </div>
         </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    function select_demo_by_id(eee131){
    	rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_001_002/getEf11ById'/>/"+eee131,$('#input_content'));
    } 
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    })
    
    //保存页面配置信息
	function demo_save_data(){
	   $('form').submit();
	}
    
    function demo_callback(response){
    	if(response.success){
           	alert(response.message);
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



























