<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务机构变更</title>
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
        <form action="${contextpath}/resources/SXJY_RLZYSC_001_002/editData">
          <div id="input_content">
	        <!-- 机构基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构基本信息</h5>
	                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
				          <rc:textEditIcon property="aef101"  label="机构名称"  url="${contextpath}/resources/SXJY_RLZYSC_001_002/toselect"  callback="select_demo_by_id" cols="2,4" />
 			              <rc:textedit  property="aab998"   required="true"  label="统一社会信用代码" readonly="true" cols="2,4" validate="{required:true,maxlength:18,messages:{required:'统一社会信息用代码不能为空'}}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:select property="aef105"  required="true" readonly="true"  label="机构状态" cols="2,2"  codetype="AEF105" />
				       	   <rc:select property="aef106"  required="true" readonly="true" label="机构性质" cols="2,2"  codetype="AEF106" />
				       	   <rc:select property="aef109"  required="true" readonly="true"  label="经营类型" cols="2,2"  codetype="AEF109"  />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				         <rc:textedit property="aef108" required="true"  readonly="true"  label="注册机关" cols="2,2"  />
				         <rc:select property="aef107"  required="true" size="5"  label="隶属关系所在市"  cols="2,2" onchange="rc.code_value_select_data_change(this.value,'AAB802',['#aef134'])"     codetype="AAB801" validate="{required:true,messages:{required:'隶属关系所在市不能为空'}}"/>
				         <rc:select property="aef134"  required="true" size="5"  label="隶属关系所在区县"  cols="2,2"  codetype="AAB802"  readonly="true"  validate="{required:true,messages:{required:'隶属关系所在区县不能为空'}}"/>
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <label class="col-sm-2 col-xs-1 control-label">
				       	         注册资金
				       	         <span class="require">*<span>
				       	   </label>
				       	   <div class="col-sm-1 col-xs-1">
				       	        <input class="form-control" style="width:125px;" placeholder="请输入注册资金"  type="text" name="aef117" validate="{required:true,messages:{required:'请输入注册资金'},number:true,maxlength:16}"/>
				       	   </div><label class="col-sm-1 control-label">万元</label>
				           <rc:select property="aef113" required="true" label="办公场地类型" cols="2,2"  codetype="AEF113" validate="{required:true,messages:{required:'办公场地类型不能为空'}}"/>
				           <label class="col-sm-2 col-xs-1 control-label">
				       	         办公场所面积
				       	         <span class="require">*<span>
				       	   </label>
				       	   <div class="col-sm-1 col-xs-1">
				       	        <input class="form-control" style="width:110px;" type="text" placeholder="请输入办公场所面积"  name="aef114" validate="{required:true,messages:{required:'请输入办公场所面积'},number:true,maxlength:16}"/>
				       	   </div><label class="col-sm-1 control-label">平方米</label>
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef111"  required="true"  label="办公地址" cols="2,4" validate="{required:true,maxlength:200,messages:{required:'办公地址不能为空'}}"/>
				           <rc:textedit property="aef112" label="邮政编码" cols="2,2"  />
				       </div>
				        <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef118"  label="开户银行" cols="2,4"  />
				           <rc:textedit property="aef119" label="开户账号" cols="2,4"  />
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构基本信息结束 -->
	        
	        <!-- 机构联系信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构联系信息</h5>
	                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef121"  required="true" readonly="true" label="机构联系人" cols="2,2" />
			               <rc:textedit  property="aef122"  required="true" label="机构联系人电话" cols="2,2" validate="{mobile:true}"/>
			               <rc:textedit property="aef123"   label="机构联系人电子邮箱" cols="2,2"  validate="{email:true}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef115"   label="机构电话号码" cols="2,2" validate="{phone:true}"/>
				           <rc:textedit property="aef116"   label="机构传真号码" cols="2,2"/>
				           <rc:textedit property="aef124"   label="机构网站" cols="2,2"  />
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构联系信息结束 -->
	         <!-- 机构法人信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构法人信息</h5>
	                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef125"  required="true" readonly="true" label="法人代表姓名" cols="2,3"  />
			               <rc:textedit  property="aef126"  required="true" readonly="true" label="法人代表身份证号" cols="2,3" validate="{idcard:true,maxlength:18}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef127"   label="法人代表联系电话" cols="2,3"/>
				       	   <rc:textedit property="aef128"   label="法人代表电子邮箱" cols="2,3"/>
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构法人信息结束 -->
	       
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
    });   
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
    
    </script>
</body>
</html>