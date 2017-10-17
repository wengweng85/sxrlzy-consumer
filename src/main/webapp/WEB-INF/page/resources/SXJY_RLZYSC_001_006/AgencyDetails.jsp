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
        <form action="${contextpath}/demo/savedata" >
        <div id="input_content">
	        <!-- 机构基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构基本信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef104"   label="机构名称"  value="${ef11.aef104}"   readonly="true" cols="2,5" validate="{required:true,chinese:true,maxlength:100,messages:{required:'机构名称不能为空'}}"  />
			               <rc:textedit  property="aab998"   label="统一社会信用代码" value="${ef11.aab998}"  readonly="true"  cols="2,3" validate="{required:true,maxlength:18,messages:{required:'统一社会信息用代码不能为空'}}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:select property="aef105"   label="机构状态" value="${ef11.aef105}"  readonly="true" cols="2,2"  codetype="AEF105" />
				       	   <rc:select property="aef106"   label="机构性质" value="${ef11.aef106}"  readonly="true" cols="2,2"  codetype="AEF106" />
				       	   <rc:select property="aef109"   label="经营类型" value="${ef11.aef109}"  readonly="true" cols="2,2"  codetype="AEF109"  />
				       	   
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef108"   label="注册机关" value="${ef11.aef108}"  readonly="true" cols="2,2" validate="{required:true,maxlength:20}" />
				           <rc:select property="aef107"   label="隶属关系所在市" value="${ef11.aef107}"  readonly="true" cols="2,2" onchange="rc.code_value_select_data_change(this.value,'AAB802',['#aef107'])"     codetype="AAB301" validate="{required:true,messages:{required:'隶属关系所在市不能为空'}}"/>
			               <rc:select property="aef134"   readonly="true"  label="隶属关系所在区县" value="${ef11.aef134}"  cols="2,2"  codetype="AAB301"  validate="{required:true,messages:{required:'隶属关系所在区县不能为空'}}"/>
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef117"  label="注册资金" value="${ef11.aef117}" readonly="true"  cols="2,2" validate="{required:true,number:true,maxlength:10}" />
				           <rc:select property="aef113"  label="办公场地类型" value="${ef11.aef113}" readonly="true"  cols="2,2"  codetype="AEF113"/>
				           <rc:textedit property="aef114"   label="办公场所面积" value="${ef11.aef114}"  readonly="true"  cols="2,2" validate="{number:true,maxlength:16}"/>
				           
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef111"   label="办公地址" value="${ef11.aef111}"  readonly="true"  cols="2,4" validate="{required:true,maxlength:200}"/>
				           <rc:textedit property="aef112"   label="邮政编码"  value="${ef11.aef112}" readonly="true"  cols="2,2" validate="{number:true,maxlength:6}" />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef118"  label="开户银行" value="${ef11.aef118}"  readonly="true"  cols="2,4" validate="{chinese:true,maxlength:30}" />
				           <rc:textedit property="aef119"  label="开户账号" value="${ef11.aef119}"  readonly="true"  cols="2,4" validate="{number:true,maxlength:30}" />
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构基本信息结束 -->
	        
	        <!-- 机构联系信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构联系信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef121"  label="机构联系人" value="${ef11.aef121}"  readonly="true"  cols="2,2" validate="{required:true,maxlength:50}" />
			               <rc:textedit  property="aef122"   label="机构联系人电话" value="${ef11.aef122}" readonly="true"  cols="2,2" validate="{mobile:true,maxlength:20}"/>
			               <rc:textedit property="aef123"   label="机构联系人电子邮箱" value="${ef11.aef123}" readonly="true" cols="2,2"  validate="{email:true,maxlength:30}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef115"   label="机构电话号码" value="${ef11.aef115}" readonly="true" cols="2,2" validate="{phone:true,maxlength:20}"/>
				           <rc:textedit property="aef116"   label="机构传真号码" value="${ef11.aef116}" readonly="true" cols="2,2" validate="{maxlength:20}"/>
				           <rc:textedit property="aef124"   label="机构网站" value="${ef11.aef124}"  readonly="true" cols="2,2" validate="{maxlength:200}" />
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构联系信息结束 -->
	         <!-- 机构法人信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构法人信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef125"  label="法人代表姓名" value="${ef11.aef125}" readonly="true"  cols="2,2" validate="{maxlength:50}" />
			               <rc:textedit  property="aef126"   label="法人代表身份证号" value="${ef11.aef126}" readonly="true"  cols="2,3" validate="{idcard:true,maxlength:18}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef127"   label="法人代表联系电话" value="${ef11.aef127}" readonly="true" cols="2,2" validate="{mobile:true,maxlength:20}" />
				       	   <rc:textedit property="aef127"   label="法人代表电子邮箱" value="${ef11.aef127}" readonly="true" cols="2,2" validate="{email:true,maxlength:50}" />
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