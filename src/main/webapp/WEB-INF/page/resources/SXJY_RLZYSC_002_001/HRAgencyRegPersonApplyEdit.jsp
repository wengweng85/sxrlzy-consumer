<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务机构工作人员修改页面</title>
    <!-- css引入 -->
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
    <div class="wrapper wrapper-content animated fadeInRight">
        <form action="${contextpath}/resources/SXJY_RLZYSC_002_001/saveEc11Data"  >
        <div id="input_content">
	        <!-- 机构工作人员新增开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构工作人员信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				       <div class="form-group">
				           <rc:hidden property="eec111" value="${ec11.eec111 }" />
				           <rc:hidden property="index" value="${index}"/>
			               <rc:textedit  property="aac003" readonly="true" value="${ec11.aac003 }" required="true" label="姓名"  cols="2,3"   validate="{required:true,maxlength:50,messages:{required:'姓名不能为空'}}"/>
			               <rc:textedit  property="aac002" readonly="true" value="${ec11.aac002 }" required="true" label="身份证号码"  cols="2,3" validate="{idcard:true,required:true,messages:{required:'身份证号码不能为空'}}"  />
			           </div>
			           <div class="hr-line-dashed"></div>
			           <div class="form-group">
			               <rc:select  property="aac004" required="true" value="${ec11.aac004 }" label="性别"  codetype="AAC004" cols="2,3" validate="{required:true,messages:{required:'请选择性别'}}"  />
				           <rc:select property="aac011" required="true"  value="${ec11.aac011 }" label="学历"  cols="2,3"  codetype="AAC011"   validate="{required:true,messages:{required:'请选择学历'}}"/>
				       </div>
				       <div class="hr-line-dashed"></div>
			           <div class="form-group">
				           <rc:select property="aac024" required="true" value="${ec11.aac024 }"  label="政治面貌"  cols="2,3"  codetype="AAC024"   validate="{required:true,messages:{required:'请选择政治面貌'}}"/>
				           <rc:textedit property="aac023" required="true" value="${ec11.aac023 }"  label="岗位及职务"  cols="2,3"    validate="{required:true,maxlength:20,messages:{required:'请选择岗位及职务'}}"/>
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				            <rc:textedit  property="aef001" required="true" value="${ec11.aef001 }" label="从业资格证号码"  cols="2,3"   validate="{required:true,maxlength:30,messages:{required:'从业资格证号码不能为空'}}"/>
				            <rc:date property="aef002" label="从业资格培训时间" required="true" value="${ec11.aef002_string}"  cols="2,3" />      
					   </div>         
			       </div>
		       </div>
	        </div>
	        <!-- 机构工作人员新增结束 -->
	        
         </div>
        </form>
    </div>
    <rc:jsfooter/>
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
    	var index = $('#index').val();
    	if(response.success){
    		//alert(response.message);
    		parent.agencyPersonEdit_callback(index,response.message);
           	select_closeframe();
    	}
    	else{
    		alert(response.message);
    	}
    	
    }
    //保存页面配置信息
	function demo_save_data(){
	   $('form').submit();
	}
	function file_indexFormatter(value, row, index) {
        return index+1;
    }
    </script>
</body>
</html>