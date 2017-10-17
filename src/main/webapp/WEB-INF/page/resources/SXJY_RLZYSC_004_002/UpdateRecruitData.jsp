<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改招聘数据</title>
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
         <form action="${contextpath}/resources/SXJY_RLZYSC_004_002/updateRecruitdata" >
        <div id="input_content">
	        <!-- 添加信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
			            <div class="hr-line-dashed"></div>
			             <div class="form-group">
			                <rc:hidden property="eee151" value="${ee15.eee151}"/>
			                <rc:hidden property="aef101" value="${ef11.aef101}" />			             
			                <rc:textedit property="aef104"  readonly="true" label="机构名称" cols="2,3" value="${ef11.aef104}" />
			                <rc:textedit property="aee124"  label="数据所属期" cols="2,3" value="${ee15.aee124}"  datamask="999999" validate="{required:true,messages:{required:'数据所属期不能为空'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>		             			            
			            <div class="form-group" style="height:40px">		          		             
			                <rc:textedit property="aee126"   label="农民工专场招聘会次数" cols="2,3" value="${ee15.aee126}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee127"   label="高校毕业生专场招聘会" cols="2,3" value="${ee15.aee127}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group">			             
			                <rc:textedit property="aee128"   label="参会用人单位" cols="2,3" value="${ee15.aee128}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee129"   label="招聘岗位" cols="2,3" value="${ee15.aee129}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group">			             
			                <rc:textedit property="aee130"   label="参会求职人数" cols="2,3" value="${ee15.aee130}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>		            		            
       
		       </div>
	        </div>	        
	         
         </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    function select_demo_by_id(eee161){
    	rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_004_002/getrecruitdata'/>/"+eee151,$('#input_content'));
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



























