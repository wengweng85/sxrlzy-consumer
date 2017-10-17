<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息受理</title>
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
                       <rc:textedit label="机构名称" property="aee114" cols="2,2"/>
			            <rc:select property="aee115" label="受理状态" cols="2,2" codetype="AEE115" />
			             <div class="col-sm-3" align="right">
		                  <a class="btn btn-info" onclick="demo_query()"><i class="fa fa-search"></i>&nbsp;查询</a>
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
                
                <a class="link" onclick="demo_edit_by_id('{{eee131}}','{{aee115}}')"><i class="fa fa-edit"></i>&nbsp;受理</a> 
                <a class="link" onclick="demo_delete_by_id('{{eee131}}')" ><i class="fa fa-remove"></i>&nbsp;删除</a> 
               
            </script>
            <div class="ibox-content">
			    <table id="ee13table" data-url="<c:url value='/resources/SXJY_RLZYSC_005_001/getEe13List'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-show-export="true"
                      data-page-size="10" >
			    <thead>
				    <tr>
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter" data-align="center" >序号</th>
	                    <th data-field="aee109" data-align="center" >投诉者姓名</th>
	                    <th data-field="aee113" data-align="center">投诉者电话</th>
	                    <th data-field="aee114" data-align="center">被投诉机构名称</th>
	                    <th data-field="aee110" data-align="center">投诉者标题</th>
	                    <th data-field="aae036" data-align="center">投诉时间</th>
	                    <th data-field="aee115" data-align="center" >受理状态</th>
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
    	$('#ee13table').inittable(demo_options);
    });
  
    
    //用户表格监听,双击 
    $('#ee13table').on('dbl-click-row.bs.table', function (e, row, $element) {
    	demo_view_by_id(row.eee131)
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
    	$('#ee13table').refreshtable();
    	
    }
    
  
    
    //删除数据
    function demo_delete_by_id(eee131){
   	  if(eee131){
   		layer.confirm('确定注销要此用户数据吗？', function(index){
   			var url= "<c:url value='/resources/SXJY_RLZYSC_005_001/deletebyid/'/>"+eee131;;
   			rc.ajax(url, null,function (response) {
   				if(response.success){
   					$('#ee13table').refreshtable();
   				}else{
   					alert(response.message);
   				}
   			});
   		});
   	  }else{
   		layer.alert('请先选择你要注销的数据');
   	  }
    }
    //编辑
    function demo_edit_by_id(eee131,aee115){
    	 //验证是否审核通过
    	if(aee115!='未受理'){
			layer.alert("该条记录已经做过受理，请勿重复操作！");                
			return;
		}else {
			layer.open({
		   		  type: 2,
		   		  title: '受理页面',
		   		  shadeClose: false,
		   		maxmin:true,
		   		  shade: 0.8,
		   		  area: ['80%', '90%'],
		   		 content: "<c:url value='/resources/SXJY_RLZYSC_005_001/toadd'/>/"+eee131 //iframe的url
			});
		}
    }
    //查看
    function demo_view_by_id(eee131){
    	layer.open({
	   		  type: 2,
	   		  title: '查看页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '70%'],
	   		  content:"<c:url value='/resources/SXJY_RLZYSC_005_001/toselect'/>/"+eee131 //iframe的url
 		});
    }
    
    
    //批量删除
    function demo_bat_delete(){
   		var selections=$('#ee13table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
   	    	layer.confirm('确定批量删除这些数据吗？', function(index){
   	    	   for(i=0;i<selections.length;i++){
   	   	     	   var item=selections[i];
   	   	     	   selectnodes+=item.eee131+',';
   	   	       }
   	   		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_005_001/batdelete'/>", {selectnodes:selectnodes},function (response) {
   	   		    	alert(response.message);
   	   		    	$('#ee13table').refreshtable();
   	   		   }); 
   	    	});
    	  }else{
    		layer.alert('请先选择你要删除的数据');
    	  }
    }
    
    </script>
</body>
</html>