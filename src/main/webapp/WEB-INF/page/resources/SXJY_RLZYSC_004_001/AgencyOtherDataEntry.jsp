<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<%@ page import="com.insigma.shiro.realm.SysUserUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务其他数据录入</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<%  String aab998_login = SysUserUtil.getCurrentUser().getAab998();  %>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
         <!-- 基本信息开始 -->
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>基本信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
	            <form class="form-horizontal" id="query_form" >
	              <div id="input_content">
			        <div class="form-group">
			            <rc:hidden property="aef101" value="${aef101}"/>		            
			            <rc:date property="aee125_begin" label="录入开始时间" cols="2,3"/>
			            <rc:date property="aee125_end" label="录入截止时间" cols="2,3"/>
			            </div>
			            </div>
			            	
			            <div class="form-horizontal">
				        <div class="form-group">
			            <rc:textedit property="aee124" label="数据所属期" cols="2,2" datamask="999999"/>
			            <div align="right">     
		                  <a class="btn btn-info" onclick="demo_query()"><i class="fa fa-search"></i>查询</a>
		                  <a class="btn btn-info" onclick="rc.clean($('query_form'))"><i class="fa fa-refresh"></i>&nbsp;重置</a>
			       </div>
			      </div>
			      </div>
		       </form>
	       </div>
        </div>
     
        <!-- 基本信息结束 -->
            
        <!-- 查询招聘数据开始 -->    
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询结果列表</h5>
                <div class="ibox-tools">
                </div>
            </div>
            <!-- 模型 -->
            <script id="tpl" type="text/x-handlebars-template" >
                <a class="link" onclick="demo_view_by_id('{{eee151}}')"><i class="fa fa-file-o"></i>&nbsp;查看</a> 
                <a class="link" onclick="demo_edit_by_id('{{eee151}}')"><i class="fa fa-edit"></i>&nbsp;编辑</a> 
            </script>
            <!-- toolbar -->
            <div id="toolbar" class="btn-group">
				 <button id="btn_user" type="button" class="btn btn-info" onclick="add_recruitdata()">
				 <span class="glyphicon glyphicon-plus" aria-hidden="false" ></span>新增
				 </button>
			</div>
			
            <div class="ibox-content">
			    <table id="ee16table" data-url="<c:url value='/resources/SXJY_RLZYSC_004_001/getrecruitdata'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-show-export="true"
                      data-page-size="10" >
			    <thead>
				    <tr>
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter">序号</th>
	                    <th data-field="aee124" >数据所属期</th>
	                    <th data-field="aee131" >服务人员总数</th>
	                    <th data-field="aee132" >登记求职和要求提供流动服务人员</th>
	                    <th data-field="aee133" >帮助实现就业和流动人数</th>            
	                    <th data-field="aee125_string" >录入时间</th>
	                    <th data-formatter="demo_jobnameFormatter">操作</th>
				    </tr>
			    </thead>
			    </table>
            </div>
        </div>
       <!-- 查询招聘数据结束 -->
    </div>
    <!-- javascript引入 -->
    <rc:jsfooter/>
    <script type="text/javascript">
    var aab998 ="<%=aab998_login%>";
    var demo_options={
    	formid:'query_form'
    }
    //初始化
    $(function(){
    	//$('.collapse-link').click();
    	$('#ee16table').inittable(demo_options);
    });
  
    function select_demo_by_id(aef101){
    	rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_001_002/getEf11ById'/>/"+aef101,$('#input_content'));
    } 
    //用户表格监听,双击 
    $('#ee16table').on('dbl-click-row.bs.table', function (e, row, $element) {
    	demo_view_by_id(row.eee151);
    });  
    
    function add_recruitdata(){
    	layer.open({
 	   		  type: 2,
 	   		  title: '录入人力资源其他数据',
 	   		  shadeClose: false,
 	   		  maxmin:true,
 	   		  shade: 0.8,
 	   		  area: ['90%', '90%'],
 	   		  content: "<c:url value='/resources/SXJY_RLZYSC_004_001/toaddrecruitdata'/>/"+aab998 //iframe的url
 		    });
    } 
    function databack_agency(aef104){
    	if(aef104!=null){
    		layer.open({
  	   		  type: 2,
  	   		  title: '录入人力资源其他数据',
  	   		  shadeClose: false,
  	   		  maxmin:true,
  	   		  shade: 0.8,
  	   		  area: ['90%', '90%'],
  	   		  content: "<c:url value='/resources/SXJY_RLZYSC_004_001/toaddrecruitdata'/>/"+aab998 //iframe的url
  		    });
    	}
    }
    
    //操作编辑
    function demo_jobnameFormatter(value, row, index) {
        var tpl = $("#tpl").html();  
	  	//预编译模板  
	  	var template = Handlebars.compile(tpl);  
	  	return template(row);
    }
    
    function demo_indexFormatter(value, row, index) {
        return index+1;
    }
    
    //查询
    function demo_query(){
    	$('#ee16table').refreshtable();
    }
    
    //删除数据
    function demo_delete_by_id(aac001){
   	  if(aac001){
   		layer.confirm('确定删除要此用户数据吗？', function(index){
   			var url= "<c:url value='/demo/deletebyid/'/>"+aac001;
   			rc.ajax(url, null,function (response) {
   				if(response.success){
   					$('#ac01table').refreshtable();
   				}else{
   					alert(response.message);
   				}
   			});
   		});
   	  }else{
   		layer.alert('请先选择你要删除的数据');
   	  }
    }
    
    
    //编辑
    function demo_edit_by_id(eee151){
    	layer.open({
	   		  type: 2,
	   		  title: '编辑页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['90%', '90%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_004_001/updatetAdvice'/>/"+eee151+"/"+aab998 //iframe的url
 		});
    }
    
    //查看
    function demo_view_by_id(eee151){ 	
    	layer.open({
	   		  type: 2,
	   		  title: '查看页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['90%', '100%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_004_001/getrecruitdataView'/>/"+eee151+"/"+aab998 //iframe的url
 		});
    }
    
    
    //批量删除
    function demo_bat_delete(){
   		var selections=$('#ee15table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
   	    	layer.confirm('确定批量删除这些数据吗？', function(index){
   	    	   for(i=0;i<selections.length;i++){
   	   	     	   var item=selections[i];
   	   	     	   selectnodes+=item.aac001+',';
   	   	       }
   	   		   rc.ajax("<c:url value='/demo/batdelete'/>", {selectnodes:selectnodes},function (response) {
   	   		    	alert(response.message);
   	   		    	$('#ac01table').refreshtable();
   	   		   }); 
   	    	});
    	  }else{
    		layer.alert('请先选择你要删除的数据');
    	  }
    }
    
   
    </script>
</body>
</html>