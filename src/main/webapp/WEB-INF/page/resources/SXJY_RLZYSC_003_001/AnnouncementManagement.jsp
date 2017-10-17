<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公告管理</title>
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
                        <rc:textedit property="aee102" label="公告标题"  cols="2,3" />
			       </div>
			       <div class="hr-line-dashed"></div>
			       <div class="form-group">
			           <div  align="right" >
		                  <rc:date property="aee105" label="公告生效时间"  cols="2,3" />
			              <rc:date property="aee106" label="公告失效时间"  cols="2,3"/>		               
			           </div>
			       </div>
			       <div class="hr-line-dashed"></div>
			       
			       <div class="form-group">
			           <div  align="right" >
		                  <a class="btn btn-info" onclick="demo_query()" ><i class="fa fa-search"></i>&nbsp;查询</a>
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
                <a class="link" onclick="demo_view_by_id('{{eee111}}')"><i class="fa fa-file-o"></i>&nbsp;查看</a> 
                <a class="link" onclick="demo_edit_by_id('{{eee111}}')"><i class="fa fa-edit"></i>&nbsp;编辑</a> 
                <a class="link" onclick="demo_delete_by_id('{{eee111}}')" ><i class="fa fa-remove"></i>&nbsp;删除</a> 
               
            </script>
            <!-- toolbar -->
            <div id="toolbar" class="btn-group">
                 <button type="button" class="btn btn-info" onclick="demo_add()">
                 <span class="glyphicon glyphicon-plus" aria-hidden="false"></span>新增
                 </button>
				 <button id="btn_delete" type="button" class="btn btn-danger" onclick="demo_bat_delete()">
				 <span class="glyphicon glyphicon-remove" aria-hidden="false"></span>批量删除
				 </button>
			</div>
			
            <div class="ibox-content">
			    <table id="ee11table" data-url="<c:url value='/resources/SXJY_RLZYSC_003_001/getEe11List'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-show-export="true"
                      data-page-size="10" >
			    <thead>
				    <tr>
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter">序号</th>
	                    <th data-field="aee102" >标题</th>
	                    <th data-field="aee107" >发布</th>
	                    <th data-field="aee105" >发布时间</th>
	                    <th data-field="aee106" >失效时间</th>
	                    <th data-field="aab301" >行政区划</th>
	                    <th data-formatter="demo_jobnameFormatter">操作</th>
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
    	$('#ee11table').inittable(demo_options);
    });
  
    
    //用户表格监听,双击 
    $('#ee11table').on('dbl-click-row.bs.table', function (e, row, $element) {
    	demo_view_by_id(row.eee111)
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
    function demo_query(){
    	$('#ee11table').refreshtable();
    	//$('.collapse-link').click();
    }
    
    //增加  demo_add()"
    function demo_add(){
    	layer.open({
	   		  type: 2,
	   		  title: '增加页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '90%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_003_001/toadd'/>/" //iframe的url
		});
    }
    
    //删除数据
    function demo_delete_by_id(eee111){
   	  if(eee111){
   		layer.confirm('确定删除要此用户数据吗？', function(index){
   			var url= "<c:url value='/resources/SXJY_RLZYSC_003_001/deletebyid/'/>"+eee111;
   			rc.ajax(url, null,function (response) {
   				if(response.success){
   					$('#ee11table').refreshtable();
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
    function demo_edit_by_id(eee111){
    	layer.open({
	   		  type: 2,
	   		  title: '编辑页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '90%'],
	   		 content: "<c:url value='/resources/SXJY_RLZYSC_003_001/toupdate'/>/"+eee111 //iframe的url
 		});
    }
    
    //查看
    function demo_view_by_id(eee111){
    	layer.open({
	   		  type: 2,
	   		  title: '查看页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['40%', '90%'],
	   		  content:"<c:url value='/resources/SXJY_RLZYSC_003_001/toselect'/>/"+eee111 //iframe的url
 		});
    }
    
    
    //批量删除
    function demo_bat_delete(){
   		var selections=$('#ee11table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
   	    	layer.confirm('确定批量删除这些数据吗？', function(index){
   	    	   for(i=0;i<selections.length;i++){
   	   	     	   var item=selections[i];
   	   	     	   selectnodes+=item.eee111+',';
   	   	       }
   	   		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_003_001/batdelete'/>", {selectnodes:selectnodes},function (response) {
   	   		    	alert(response.message);
   	   		    	$('#ee11table').refreshtable();
   	   		   }); 
   	    	});
    	  }else{
    		layer.alert('请先选择你要删除的数据');
    	  }
    }
    
    </script>
</body>
</html>