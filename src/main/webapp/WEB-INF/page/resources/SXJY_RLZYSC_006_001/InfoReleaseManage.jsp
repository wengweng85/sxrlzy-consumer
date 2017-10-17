<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息发布管理页面</title>
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
			            <rc:textedit property="aee119" label="信息标题"  cols="2,3"/>
			            <rc:select property="aee118" label="信息发布类型" cols="2,2" codetype="AEE118" multiple="true"	/>
			           <div class="col-sm-3" align="right">
		                  <a class="btn btn-info" onclick="inforelease_query()"><i class="fa fa-search"></i>&nbsp;查询</a>
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
                <a class="link" onclick="inforelease_edit_by_id('{{eee141}}')"><i class="fa fa-edit"></i>&nbsp;编辑</a> 
                <a class="link" onclick="inforelease_delete_by_id('{{eee141}}')" ><i class="fa fa-remove"></i>&nbsp;删除</a> 
            </script>
            <!-- toolbar -->
            <div id="toolbar" class="btn-group">
				  <button id="btn_delete" type="button" class="btn btn-danger" onclick="inforelease_bat_delete()">
				 <span class="glyphicon glyphicon-remove" aria-hidden="false"></span>批量删除
				 </button>
				 <!--<button id="btn_edit" type="button" class="btn btn-info" >
				 <span class="glyphicon glyphicon-pencil" aria-hidden="false"></span>修改
				 </button> -->
				 <button id="btn_user" type="button" class="btn btn-info"  onclick="releaseInfoAdd()">
				 <span class="glyphicon glyphicon-plus" aria-hidden="false"></span>发布信息
				 </button>
			</div>
            <div class="ibox-content">
			    <table id="ee14table" data-url="<c:url value='/resources/SXJY_RLZYSC_006_001/getEe14List'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-show-export="true"
                      data-page-size="10" >
			    <thead>
				    <tr >
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter" data-align="center">序号</th>
	                    <th data-field="aee119" data-align="center" data-width="230px">信息标题</th>
	                    <th data-field="aee118" data-align="center">信息发布类型</th>
	                    <th data-field="aee121" data-align="center">是否有附件</th>
	                    <th data-field="aee123" data-align="center">发布时间</th>
	                    <th data-field="aae010" data-align="center">发布人</th>
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
    }
     //初始化
    $(function(){
    	//$('.collapse-link').click();
    	$('#ee14table').inittable(demo_options);
    }); 
  
    
    //用户表格监听,双击表格记录事件 
    $('#ee14table').on('dbl-click-row.bs.table', function (e, row, $element) {
    	view_details_info(row.eee141);
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
    function inforelease_query(){
    	$('#ee14table').refreshtable();
    }
    
    //点击发布信息按钮触发
    function releaseInfoAdd(){
    	layer.open({
	   		  type: 2,
	   		  title: '发布信息页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '95%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_006_001/toadd'/>" //iframe的url
		  });
     }
    //信息发布详细信息页面
    function view_details_info(eee141){
    	layer.open({
	   		  type: 2,
	   		  title: '信息发布详细信息页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '70%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_006_001/todetail'/>/"+eee141  //iframe的url
 		  });
    }
  //删除数据
    function inforelease_delete_by_id(eee141){
   	  if(eee141){
   		layer.confirm('确定要删除该条数据吗？', function(index){
   			var url= "<c:url value='/resources/SXJY_RLZYSC_006_001/deletebyid/'/>"+eee141;
   			rc.ajax(url, null,function (response) {
   				if(response.success){
   					$('#ee14table').refreshtable();
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
    function inforelease_edit_by_id(eee141){
    	layer.open({
	   		  type: 2,
	   		  title: '信息发布编辑页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '90%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_006_001/toedit'/>/"+eee141 //iframe的url
 		});
    }
    //批量删除
    function inforelease_bat_delete(){
   		var selections=$('#ee14table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
   	    	layer.confirm('确定批量删除这些数据吗？', function(index){
   	    	   for(i=0;i<selections.length;i++){
   	   	     	   var item=selections[i];
   	   	     	   selectnodes+=item.eee141+',';
   	   	       }
   	   		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_006_001/batdelete'/>", {selectnodes:selectnodes},function (response) {
   	   		    	alert(response.message);
   	   		    	$('#ee14table').refreshtable();
   	   		   }); 
   	    	});
    	  }else{
    		layer.alert('请先选择你要删除的数据');
    	  }
    }
    </script>
</body>
</html>