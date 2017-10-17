<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<%@ page import="com.insigma.shiro.realm.SysUserUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务机构设立申请</title>
    <rc:csshead/>
</head>
<%  String aab998_login = SysUserUtil.getCurrentUser().getAab998();  %>
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
        <form action="${contextpath}/resources/SXJY_RLZYSC_002_004/cancelData">
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
				           <rc:hidden property="aef101" value="${aef101}"/>
			               <rc:textedit  property="aef104" required="false" label="机构名称" readonly="true" cols="2,5" validate="{required:true,chinese:true,maxlength:100,messages:{required:'机构名称不能为空'}}"  />
			               <rc:textedit  property="aab998" required="false"  label="统一社会信用代码" readonly="true" cols="2,3" validate="{required:true,maxlength:18,messages:{required:'统一社会信息用代码不能为空'}}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:select property="aef105" required="false"  label="机构状态" cols="2,2" readonly="true" codetype="AEF105" />
				       	   <rc:select property="aef106" required="false"  label="机构性质" cols="2,2" readonly="true" codetype="AEF106" />
				       	   <rc:select property="aef109" required="false"  label="经营类型" cols="2,2" readonly="true" codetype="AEF109"  />
				       </div>
				       <div class="hr-line-dashed" ></div>
					   <div class="form-group"   id="zy" style="border: 0px solid transparent">
                           <rc:textedit  label="经营范围" property="aef110_1"   required="false"  cols="2,10" />
                       </div>
                       <div class="hr-line-dashed" style="display:none"></div>
                       <div class="form-group"  id="rc" style="display:none;height:50px">
                           <rc:checkbox  label="经营范围"    property="aef110" cols="2,10" codetype="AEF110"/>
                       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef108" required="false"  label="注册机关" readonly="true" cols="2,2"  />
				           <rc:select property="aef107" required="false"  label="隶属关系所在市"   readonly="true" cols="2,2" onchange="rc.code_value_select_data_change(this.value,'AAB802',['#aef134'])"     codetype="AAB801" validate="{required:true,messages:{required:'隶属关系所在市不能为空'}}"/>
			               <rc:select property="aef134" required="false"  readonly="true"  label="隶属关系所在区县"  cols="2,2"  codetype="AAB802"  validate="{required:true,messages:{required:'隶属关系所在区县不能为空'}}"/>
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
				           <rc:textedit property="aef111" required="false"  label="办公地址" readonly="true" cols="2,4" />
				           <rc:textedit property="aef112" required="false" label="邮政编码" readonly="true" cols="2,2"  />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef118" required="false" label="开户银行"  readonly="true" cols="2,4"  />
				           <rc:textedit property="aef119" required="false" label="开户账号"  readonly="true" cols="2,4"  />
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
			               <rc:textedit  property="aef121" required="false" label="机构联系人" readonly="true" cols="2,2" />
			               <rc:textedit  property="aef122" required="false"  label="机构联系人电话"  readonly="true" cols="2,2" validate="{mobile:true}"/>
			               <rc:textedit property="aef123" required="false"  label="机构联系人电子邮箱" readonly="true" cols="2,2"  validate="{email:true}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef115" required="false"  label="机构电话号码" readonly="true" cols="2,2" validate="{phone:true}"/>
				           <rc:textedit property="aef116" required="false"  label="机构传真号码" readonly="true" cols="2,2"/>
				           <rc:textedit property="aef124" required="false"  label="机构网站" readonly="true" cols="2,2"  />
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
			               <rc:textedit  property="aef125" required="false" label="法人代表姓名" cols="2,3" readonly="true" />
			               <rc:textedit  property="aef126" required="false"  label="法人代表身份证号" cols="2,3" readonly="true" validate="{idcard:true,maxlength:18}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef127" required="false"  label="法人代表联系电话" cols="2,3" readonly="true"/>
				       	   <rc:textedit property="aef128" required="false"  label="法人代表电子邮箱" cols="2,3" readonly="true"/>
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构法人信息结束 -->
	        <!-- 机构法人信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>注销信息</h5>
	                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef130" required="true" label="注销原因" cols="2,4" validate="{required:true,messages:{required:'注销原因不能为空'}}" />
			               <rc:date  property="aef129" required="true"  label="注销时间" cols="2,3" validate="{required:true,messages:{required:'注销时间不能为空'}}"/>
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
        
    //初始化查询机构信息
    $(function(){
    	var aab998 ="<%=aab998_login%>";
        if(aab998!=null){
         	var url = "<c:url value='/resources/SXJY_RLZYSC_002_001/getHRAgencyChangeById'/>/"+aab998;
      		var param = $('input_content').serializeObject();
         	rc.ajax(url,param,function(response){
     			if(response.success){
     				var jsondata=response.obj;
     				var dom_selector;
     				//调用页面赋值方法
     				rc.evaluation(response.obj,dom_selector);
     				//动态显示复选框的值
     		    	var aef109= jsondata.aef109;
     		    	if(aef109=="0")
     				{
     					document.getElementById("zy").style.display="";
     					document.getElementById("aef110_1").value="求职、用人登记；职业介绍、职业指导；收集、发布职业供求、培训信息；为家庭用工提供中介服务；互联网职业信息服务；法律、法规和政策咨询";
     				    document.getElementById("rc").style.display="none";
     					
     				}else {
     					document.getElementById("zy").style.display="none";
     					document.getElementById("rc").style.display=""; 
     				}
     			}else {
     				rc.errorMask(null,response.message);
     			}
     		});	        
         } 
    });
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
    //下拉框变动获取复选框值
	function cFw(o){
		if(o.value=="0")
		{
			document.getElementById("zy").style.display="";
			document.getElementById("aef110_1").value="求职、用人登记；职业介绍、职业指导；收集、发布职业供求、培训信息；为家庭用工提供中介服务；互联网职业信息服务；法律、法规和政策咨询";
		    document.getElementById("rc").style.display="none";
			
		}else {
			document.getElementById("zy").style.display="none";
			document.getElementById("rc").style.display=""; 
		} 	     
	}
    </script>
</body>
</html>