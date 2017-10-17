<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>密码重置页面</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
         <!-- 查询条件开始 -->
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询条件</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
	            <form class="form-horizontal" id="query_form" >
			       <div class="form-group">
			           <rc:textedit property="aef104" label="机构名称"  cols="2,3"/>
			           <rc:textedit property="aec101" label="用户名"  cols="2,2"/>
			           <div class="col-sm-3" align="right">
		                  <a class="btn btn-info" onclick="hragency_query()"><i class="fa fa-search"></i>&nbsp;查询</a>
		                  <a class="btn btn-info" onclick="rc.clean($('query_form'))"><i class="fa fa-refresh"></i>&nbsp;重置</a>
		               </div>
			       </div>
		       </form>
	       </div>
        </div>
        <!-- 查询条件结束 -->
            
        <!-- 查询结果开始 -->    
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询结果列表</h5>
                <div class="ibox-tools">
                </div>
            </div>
            <!-- 模型 -->
            <script id="tpl" type="text/x-handlebars-template" >
                <a class="btn btn-danger" onclick="resetPwd('{{eec121}}')" ><i class="fa fa-cog"></i>&nbsp;重置密码</a> 
            </script>
            <!-- toolbar -->
            <div id="toolbar" class="btn-group">
				  <button id="btn_delete" type="button" class="btn btn-danger" onclick="batResetPwd()">
				 <span class="glyphicon glyphicon-remove" aria-hidden="false"></span>批量重置密码
				 </button>
			</div>
            <div class="ibox-content">
			    <table id="ec12table" data-url="<c:url value='/resources/SXJY_RLZYSC_009_001/getHRAgencyUserInfoList'/>" 
                      data-pagination="true" 
                      data-toolbar="#toolbar"
                      data-page-size="10" >
			    <thead>
				    <tr >
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter" data-align="center">序号</th>
	                    <th data-field="aec101" data-align="center">用户名</th>
	                    <th data-field="aab998" data-align="center">统一社会信用代码</th>
	                    <th data-field="aef104" data-align="center" data-width="230px">机构名称</th>
	                    <th data-formatter="demo_jobnameFormatter" data-align="center">操作</th>
				    </tr>
			    </thead>
			    </table>
            </div>
        </div>
       <!-- 查询结果结束 -->
    </div>
    <!-- javascript引入 -->
    <rc:jsfooter/>
    <script type="text/javascript">
    var demo_options={
        	formid:'query_form'
    };
    //初始化
    $(function(){
    	//$('.collapse-link').click();
    	$('#ec12table').inittable(demo_options);
    });   
  //用户表格监听,双击表格记录事件 
    $('#ec12table').on('dbl-click-row.bs.table', function (e, row, $element) {
    	view_details_info(row.aab998,row.aef101);
    });  
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
    function hragency_query(){
    	$('#ec12table').refreshtable();
    }
    //密码重置
    function resetPwd(eec121){
    	if(eec121!=null){
    		layer.confirm('确定要重置该用户密码吗？',function(index){
    	 		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_009_001/resetpwdData'/>", {eec121:eec121},function (response) {
    	 		    	alert(response.message);
    	 		    	$('#ec12table').refreshtable();
    	 		   }); 
    	 	    });
    	}
    }
    function batResetPwd(){
    	var selections=$('#ec12table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
   	    	for(i=0;i<selections.length;i++){
				   var item=selections[i];
		     	      selectnodes+=item.eec121+',';
	           }
		layer.confirm('确定要批量重置所选用户密码吗？',function(index){
		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_009_001/batresetpwdData'/>", {selectnodes:selectnodes},function (response) {
		    	alert(response.message);
		    	$('#ec12table').refreshtable();
		   }); 
	    }); 
   	    }else{
   	 	   layer.alert("请至少选中一条记录");                
   			   return;
   	    }
    }
    </script>
</body>
</html>