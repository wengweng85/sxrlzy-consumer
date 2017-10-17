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
    <!-- 固定浮动框  navbar-fixed-top 顶部、navbar-fixed-bottom 底部-->
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
	<!-- 浮动框结束 -->
    <div class="wrapper wrapper-content ">
         <form action="${contextpath}/resources/SXJY_RLZYSC_004_001/updataRecruitdata" >
        <div id="input_content">
	        <!-- 添加信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
			            <div class="hr-line-dashed"></div>		             			            
			            <div class="form-group">
			                <rc:hidden property="aef101" value="${ef11.aef101}" />			             
			                <rc:textedit property="aef104"  readonly="true" label="机构名称" cols="2,3" value="${ef11.aef104}" />
			                <rc:textedit property="aee124"  label="数据所属期" cols="2,3" value="${ee15.aee124}"  datamask="999999" validate="{required:true,messages:{required:'数据所属期不能为空'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			             <div class="form-group">
			                <rc:hidden property="eee151" value="${ee15.eee151}"/>
			                <rc:textedit property="aee144"   label="参加评测人数" cols="2,3" value="${ee15.aee144}" validate="{number:true,messages:{required:'请输入数字'}}"/>		               
			                <rc:textedit property="aee131"   label="服务人员总数" cols="2,3" value="${ee15.aee131}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group" style="height:40px">			             
			                <rc:textedit property="aee132"   label="登记求职和要求提供流动服务人员" cols="2,3" value="${ee15.aee132}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee133"   label="帮助实现就业和流动人数" cols="2,3" value="${ee15.aee133}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group" style="height:40px">			             
			                <rc:textedit property="aee134"   label="服务用人单位（服务对象情况）" cols="2,3" value="${ee15.aee134}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee135"   label="服务用人单位（劳务派遣）" cols="2,3" value="${ee15.aee135}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group">			             
			                <rc:textedit property="aee136"   label="派遣人员总量" cols="2,3" value="${ee15.aee136}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee137"   label="登记要求派遣人员" cols="2,3" value="${ee15.aee137}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group" style="height:50px">			             
			                <rc:textedit property="aee138"   label="服务用人单位数（人力资源管理咨询服务）" cols="2,3" value="${ee15.aee138}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee139"   label="服务用人单位（人力资源外包服务）" cols="2,3" value="${ee15.aee139}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group">			             
			                <rc:textedit property="aee140"   label="现存档案数量" cols="2,3" value="${ee15.aee140}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee141"   label="依托档案提供服务" cols="2,3" value="${ee15.aee141}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group">			             
			                <rc:textedit property="aee142"   label="举办培训班次数" cols="2,3" value="${ee15.aee142}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee143"   label="参加培训人员" cols="2,3" value="${ee15.aee143}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group">			             
			                <rc:textedit property="aee145"   label="委托推荐岗位数" cols="2,3" value="${ee15.aee145}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee146"   label="成功推荐人才" cols="2,3" value="${ee15.aee146}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group" style="height:40px">			             
			                <rc:textedit property="aee147"   label="建立人力资源数据库" cols="2,3" value="${ee15.aee147}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			                <rc:textedit property="aee148"   label="数据库现存求职信息总量" cols="2,3" value="${ee15.aee148}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            <div class="hr-line-dashed"></div>
			            <div class="form-group" style="height:40px">			             
			                <rc:textedit property="aee149"   label="全年新增入库求职信息" cols="2,3" value="${ee15.aee149}" validate="{number:true,messages:{required:'请输入数字'}}"/>
			            </div>
			            
		       </div>
	        </div>	        
	         
         </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    function select_demo_by_id(eee151){
    	rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_004_001/getrecruitdata'/>/"+eee151,$('#input_content'));
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



























