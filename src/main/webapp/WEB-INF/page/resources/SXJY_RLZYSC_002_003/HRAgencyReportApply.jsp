<%@ page language="java" contentType="text/html; charset=utf-8" import="com.insigma.shiro.realm.SysUserUtil" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务机构业务报告</title>
    <rc:csshead/>
</head>
<% String aab998_login = SysUserUtil.getCurrentUser().getAab998();%>
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
        <form action="${contextpath}/resources/SXJY_RLZYSC_001_003/saveauditingbusinessdata">
        <div id="input_content">
	        <!-- 机构基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>业务报告信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
				        
				           <rc:hidden property="aef101"/>
				           <rc:textedit property="aef104" label="机构名称" cols="2,3"  readonly="true"/>
			               <rc:textedit  property="aee150"  required="false"  label="业务报告年度"  cols="2,3"  validate="{number:true,maxlength:4}" />
		               </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aee126" required="false"  label="农民工专场招聘会次数" cols="2,3"  validate="{number:true,maxlength:16}" />
				       	   <rc:textedit property="aee127" required="false"  label="毕业生专场招聘会次数" cols="2,3"  validate="{number:true,maxlength:16}" />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aee129" required="false"  label="招聘岗位" cols="2,3"  validate="{number:true,maxlength:16}" />
				           <rc:textedit property="aee128" required="false"  label="参会用人单位" cols="2,3"  validate="{number:true,maxlength:16}" />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group" style="height:35px">
				           <rc:textedit property="aee131" required="false" label="服务人员总数" cols="2,3"  validate="{number:true,maxlength:16}" />
				           <rc:textedit property="aee132" required="false"  label="登记求职和要求提供流动服务人员" cols="2,3" validate="{number:true,maxlength:16}"  />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group" style="height:35px">
				           <rc:textedit property="aee133" required="false"  label="帮助实现就业和流动人数" cols="2,3" validate="{number:true,maxlength:16}" />
				           <rc:textedit property="aee134" required="false"  label="服务用人单位（服务对象情况）" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group" style="height:35px">
				          <rc:textedit property="aee135" required="false" label="服务用人单位（劳务派遣）" cols="2,3" validate="{number:true,maxlength:16}"  />
				           <rc:textedit property="aee136" required="false" label="派遣人员总量" cols="2,3" validate="{number:true,maxlength:16}"  />  
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group" style="height:35px">
				          <rc:textedit property="aee137" required="false" label="登记要求派遣人员" cols="2,3" validate="{number:true,maxlength:16}"  />
				          <rc:textedit  property="aee138" required="false" label="服务用人单位数（人力资源管理咨询服务）" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
				         <div class="hr-line-dashed"></div>
				       <div class="form-group" style="height:35px">
				          <rc:textedit  property="aee139" required="false"  label="服务用人单位数（人力资源外包服务）" cols="2,3" validate="{number:true,maxlength:16}" />
			               <rc:textedit property="aee140" required="false"  label="现存档案数量" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
				         <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aee141" required="false"  label="依托档案提供服务" cols="2,3" validate="{number:true,maxlength:16}" />
				           <rc:textedit property="aee142" required="false"  label="举办培训班次数" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
				         <div class="hr-line-dashed"></div>
				       <div class="form-group">
				          <rc:textedit property="aee143" required="false"  label="参加培训人员" cols="2,3"  validate="{number:true,maxlength:16}" />
				          <rc:textedit  property="aee144" required="false" label="参加测评人数" cols="2,3" validate="{number:true,maxlength:16}"  />
				       </div>
				        <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit  property="aee130" required="false" label="参会求职人数" cols="2,3" validate="{number:true,maxlength:16}"  />
			               <rc:textedit  property="aee145" required="false"  label="委托推荐岗位数" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
				          <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aee146" required="false"  label="成功推荐人才" cols="2,3" validate="{number:true,maxlength:16}" />
				       	   <rc:textedit property="aee147" required="false"  label="建立人力资源数据库" cols="2,3" validate="{number:true,maxlength:16}" />
			           </div>
				        <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aee148" required="false"  label="数据库现存求职信息总量" cols="2,3" validate="{number:true,maxlength:16}" />
				       	    <rc:textedit label="全年新增入库求职信息"  property="aee149" cols="2,3"  validate="{number:true,maxlength:16}" />
			           </div>
				      
			       </div>
		       </div>
	        </div>
	        <!-- 机构基本信息结束 -->
	        
	    </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    //初始化查询机构信息
    $(function(){
    	//给aee150赋值
    	var date=new Date();
    	var year=date.getFullYear();
    	$("#aee150").val(year);
    	var aab998 ="<%=aab998_login%>";
    	var aee150=$("#aee150").val();
        if(aab998!=null){
        	var url = "<c:url value='/resources/SXJY_RLZYSC_001_003/getBRDataByAab998'/>/"+aab998+"/"+aee150;
         	rc.ajax(url,"",function(response){
         		if(response.success){
     				var jsondata=response.obj;
     				var dom_selector;
     				if(jsondata==null){
     					alert("对不起，您查询的数据不存在。");
     				}else {
     					//调用页面赋值方法
     	 				rc.evaluation(jsondata,dom_selector);
     	 				//自己写个赋值得方法
     	 				var inputs = $("form :input").not('.ignore_evaluation');
     	 				inputs.each(function(i, dom) {
     	 					var name = dom.name;
     	 					eval('var res=jsondata.ef11[0].' + name||'');
     	 					if($(dom).val() == null || $(dom).val() == ""){
     	 						$(dom).val(res);
     	 					}
     	 				});
     	 				$("#aee150").val(year);
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
    
    </script>
</body>
</html>