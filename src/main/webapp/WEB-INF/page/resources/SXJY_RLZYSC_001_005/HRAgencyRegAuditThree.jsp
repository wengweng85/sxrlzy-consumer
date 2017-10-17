<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务机构设立终审页面</title>
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
			            <rc:select property="eae052" label="审核状态" cols="2,2" codetype="EAE052" />
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
                 <div class="form-group" style="text-align: right;">
                       <a class="btn btn-info" onclick="hragency_reg_bataudit()"><i class="fa fa-check-square"></i>&nbsp;审核通过</a>
                       <a class="btn btn-info" onclick="hragency_detail_aef101()"><i class="fa fa-info-circle"></i>&nbsp;详细信息</a>
			     </div>    
            </div>
            <!-- 模型 -->
            <script id="tpl" type="text/x-handlebars-template" >
                <a class="btn btn-info btn-xs" onclick="hragency_reg_singleaudit('{{aab998}}','{{eae052}}')" ><i class="fa fa-check-square"></i>&nbsp;&nbsp;审核通过&nbsp;&nbsp;</a> 
                <a class="btn btn-info btn-xs" onclick="hragency_reg_notauditpass('{{aab998}}','{{eae052}}')" ><i class="fa fa-minus-square"></i>审核不通过</a> 
            </script>
            <div class="ibox-content">
			    <table id="ef11table" data-url="<c:url value='/resources/SXJY_RLZYSC_001_005/getEf11List?flag=3'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-show-export="true"
                      data-page-size="10" >
			    <thead>
				    <tr >
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter" data-align="center">序号</th>
	                    <th data-field="aef104" data-align="center" data-width="180px">&nbsp;&nbsp;机&nbsp;&nbsp;构&nbsp;&nbsp;名&nbsp;&nbsp;称&nbsp;&nbsp;</th>
	                    <th data-field="aab998" data-align="center">统一社会信用代表</th>
	                    <th data-field="aef109" data-align="center">经营类型</th>
	                    <th data-field="aef122" data-align="center">机构联系电话</th>
	                    <th data-field="aef125" data-align="center">法人代表</th>
	                    <th data-field="aae010" data-align="center">&nbsp;&nbsp;&nbsp;申报人&nbsp;&nbsp;&nbsp;</th>
	                    <th data-field="aae036" data-align="center">&nbsp;&nbsp;申报时间&nbsp;&nbsp;</th>
	                    <th data-field="eae052" data-align="center">&nbsp;审核状态&nbsp;&nbsp;</th>
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
    	$('#ef11table').inittable(demo_options);
    }); 
  
    
    //用户表格监听,双击表格记录事件 
    $('#ef11table').on('dbl-click-row.bs.table', function (e, row, $element) {
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
    	$('#ef11table').refreshtable();
    	//$('.collapse-link').click();
    }
    
  //点击详细信息按钮触发
    function hragency_detail_aef101(){
        var selections=$('#ef11table').getAllTableSelections();
        //选中的值
   	    var aab998;
        var aef101;
        if(selections.length>0){
            if(selections.length!=1){
            	layer.alert('只能选择一条数据查看');
       		    return;
             }
            for(i=0;i<selections.length;i++){
 	     	   var item=selections[i];
 	     	   aab998=item.aab998;
 	     	   aef101=item.aef101;
 	    }
            view_details_info(aab998,aef101);
        }else{
     		  layer.alert('请至少选中一条记录');
     		  return;
     	  }
     }
    //显示机构详细信息
    function view_details_info(aab998,aef101){
    	layer.open({
	   		  type: 2,
	   		  title: '机构详细信息页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['85%', '90%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_001_005/todetail'/>/"+aab998+"/"+aef101 //iframe的url
 		  });
    }
    //批量审核通过
    function hragency_reg_bataudit(){
   		var selections=$('#ef11table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
			   for(i=0;i<selections.length;i++){
	     	      var item=selections[i];
	     	      selectnodes+=item.aab998+',';
	     	      if(item.eae052!='未审核'){
	   			     layer.alert("该条记录已经做过审核，请勿重复操作！");                
				     return;
			      }	
	           }
		layer.confirm('确定要批量审核所选数据吗？',function(index){
		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_001_005/bataudit?flag=3'/>", {selectnodes:selectnodes},function (response) {
		    	alert(response.message);
		    	$('#ef11table').refreshtable();
		   }); 
	    }); 
   	    }else{
   	 	   layer.alert("请至少选中一条记录");                
   			   return;
   	    }
    }
  //单个审核通过
    function hragency_reg_singleaudit(aab998,eae052){
        //验证是否审核通过
    	if(eae052!='未审核'){
			layer.alert("该条记录已经做过审核，请勿重复操作！");                
			return;
		}	
		layer.confirm('确定要审核该条记录吗？',function(index){
		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_001_005/singleaudit?flag=3'/>", {aab998:aab998},function (response) {
		    	alert(response.message);
		    	$('#ef11table').refreshtable();
		   }); 
	    }); 
    }
    function hragency_reg_notauditpass(aab998,eae052){
    	//验证是否审核通过
    	if(eae052!='未审核'){
			layer.alert("该条记录已经做过审核，请勿重复操作！");                
			return;
		}
    	layer.open({
	   		  type: 2,
	   		  title: '人力资源服务机构审核不通过页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['70%', '60%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_001_005/notauditpass/3'/>/"+aab998//iframe的url
		  });  
    }
    </script>
</body>
</html>