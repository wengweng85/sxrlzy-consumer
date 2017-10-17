<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>服务机构业务报告</title>
    <rc:csshead/>
</head>
<body class="gray-bg" style="margin-top:40px" >

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
        <form action="${contextpath}/resources/SXJY_RLZYSC_001_003/savebusinessdata">
        <div id="input_content">
	        <!-- 机构基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>业务报告信息</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
				         
			               <rc:textEditIcon  label="机构名称" property="aef101" url="${contextpath}/resources/SXJY_RLZYSC_001_003/toselect"  callback="select_demo_by_id" cols="2,3" /> 
			               <rc:textedit  property="aee150"  required="false"  label="年度"  cols="2,3" validate="{number:true,maxlength:4}"/>
		
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aee126" required="false"  label="农民工专场招聘会次数" cols="2,3"  validate="{number:true,maxlength:16}" />
				       	   <rc:textedit property="aee127" required="false"  label="毕业生专场招聘会次数" cols="2,3"  validate="{number:true,maxlength:16}" />
				         
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       <rc:textedit property="aee129" required="false"  label="招聘岗位" cols="2,3"   validate="{number:true,maxlength:16}" />
				       <rc:textedit property="aee128" required="false"  label="参会用人单位" cols="2,3"  validate="{number:true,maxlength:16}"  />
				      
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       <rc:textedit property="aee131" required="false" label="服务人员总数" cols="2,3"  validate="{number:true,maxlength:16}"  />
				       <rc:textedit property="aee132" required="false"  label="登记求职和要求提供流动服务人员" cols="2,3"  validate="{number:true,maxlength:16}"  />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aee133" required="false"  label="帮助实现就业和流动人数" cols="2,3" validate="{number:true,maxlength:16}" />
				           <rc:textedit property="aee134" required="false"  label="服务用人单位（服务对象情况）" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				          <rc:textedit property="aee135" required="false" label="服务用人单位（劳务派遣）" cols="2,3"  validate="{number:true,maxlength:16}"  />
				           <rc:textedit property="aee136" required="false" label="派遣人员总量" cols="2,3"  validate="{number:true,maxlength:16}"  />  
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				          <rc:textedit property="aee137" required="false" label="登记要求派遣人员" cols="2,3"  validate="{number:true,maxlength:16}"  />
				          <rc:textedit  property="aee138" required="false" label="服务用人单位数（人力资源管理咨询服务）" cols="2,3" validate="{number:true,maxlength:16}"  />
				       </div>
				         <div class="hr-line-dashed"></div>
				       <div class="form-group">
				          <rc:textedit  property="aee139" required="false"  label="服务用人单位数（人力资源外包服务）" cols="2,3" validate="{number:true,maxlength:16}"  />
			               <rc:textedit property="aee140" required="false"  label="现存档案数量" cols="2,3" validate="{number:true,maxlength:16}"  />
				       </div>
				         <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aee141" required="false"  label="依托档案提供服务" cols="2,3" validate="{number:true,maxlength:16}"  />
				           <rc:textedit property="aee142" required="false"  label="举办培训班次数" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
				         <div class="hr-line-dashed"></div>
				       <div class="form-group">
				          <rc:textedit property="aee143" required="false"  label="参加培训人员" cols="2,3" validate="{number:true,maxlength:16}"   />
				          <rc:textedit  property="aee144" required="false" label="参加测评人数" cols="2,3" validate="{number:true,maxlength:16}"   />
				       </div>
				        <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit  property="aee130" required="false" label="参会求职人数" cols="2,3"  validate="{number:true,maxlength:16}"  />
			               <rc:textedit  property="aee145" required="false"  label="委托推荐岗位数" cols="2,3"  validate="{number:true,maxlength:16}" />
				       </div>
				        <div class="hr-line-dashed"></div>
				       <div class="form-group">
				         <div class="form-group">
				       	   <rc:textedit property="aee147" required="false"  label="建立人力资源数据库" cols="2,3" validate="{number:true,maxlength:16}" />
				       	   <rc:textedit property="aee148" required="false"  label="数据库现存求职信息总量" cols="2,3" validate="{number:true,maxlength:16}" />
				       </div>
			           </div>
				        <div class="hr-line-dashed"></div>
				       <div class="form-group">
				        <rc:textedit label="全年新增入库求职信息"  property="aee149" cols="2,3" validate="{number:true,maxlength:16}" />
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
    function select_demo_by_id(aef101){
    	
    	var url = "<c:url value='/resources/SXJY_RLZYSC_001_003/getBRDataById'/>/"+aef101;
    	var aee150=$("#aee150").val();
    	var param={"aef101":aef101,"aee150":aee150};
    	rc.ajax(url,param,function(response){
 			if(response.success){
 				var jsondata=response.obj;
 				if(jsondata!=null){ 
 				var dom_selector;
 				//调用页面赋值方法
 				rc.evaluation(jsondata.obj,dom_selector);
 				//自己写个赋值得方法
 				var inputs = $("form :input").not('.ignore_evaluation');
 				inputs.each(function(i, dom) {
 					var name = dom.name;
 					eval('var res=jsondata.' + name||'');
 					if($(dom).val() == null || $(dom).val() == ""){
 						$(dom).val(res);
 					}
 				});}else{
 					alert("对不起，您查询的数据不存在。")
 				}
 			}else {
 				rc.errorMask(null,response.message);
 			}
 		});	   
    }
    $(function() {
    	//验证 ajax   
    	rc.validAndAjaxSubmit($("form"),demo_callback); 
    	
    	//给aee150赋值
    	var date=new Date();
    	var year=date.getFullYear();    	
    	$("#aee150").val(year);
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