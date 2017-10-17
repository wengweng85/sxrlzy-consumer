<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<%@ page import="com.insigma.shiro.realm.SysUserUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>服务机构意见建议查询</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<%  String aab998_login = SysUserUtil.getCurrentUser().getAab998();  %>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
         <!-- 查询条件开始 -->
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询区</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
            <form class="form-horizontal" id="query_form" > 	                
			        <div class="form-group" >      
			            <rc:textedit property="aef104" label="机构名称" cols="2,2" />
			            <rc:textedit property="aee150" label="意见标题" cols="2,2"/>
	                   </div>
	                    <div class="hr-line-dashed"></div>
			            <div class="form-group">
			            <div align="left">
			             <rc:select property="aee152" label="是否回复" cols="2,2" codetype="YESNO" />	     
			            </div>
	                    <div align="right">
		                  <a class="btn btn-info" onclick="demo_query()"><i class="fa fa-search"></i>&nbsp;查询</a>
		                  <a class="btn btn-info" onclick="rc.clean($('query_form'))"><i class="fa fa-refresh"></i>&nbsp;清空</a>	            
		               </div>	           
			       </div>      
		       </form>
	       </div>
        </div>
        <!-- 查询条件结束 -->
            
        <!-- 查询结果开始 -->    
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>机构意见建议信息列表</h5>
                <div class="ibox-tools">
                </div>
            </div>
           
            <script id="tpl" type="text/x-handlebars-template" >
               <a class="link" onclick="demo_edit_by_id('{{eee171}}','{{aee152}}','{{aee150}}')"><i class="fa fa-edit"></i>&nbsp;受理</a>     
            </script>
                 
            <div class="ibox-content">
			    <table id="ee17table" data-url="<c:url value='/resources/SXJY_RLZYSC_006_003/selectByHui'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-show-export="true"
                      data-page-size="10" >
			    <thead>
				    <tr>
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter" data-align="center">序号</th>
	                    <th data-field="aee150" data-align="center">意见建议标题</th>
	                    <th data-field="aef104" data-align="center">机构名称</th>
	                    <th data-field="aee152" data-align="center">是否回复</th>
	                    <th data-field="aee154_string" data-align="center">意见建议提交时间</th>
	                    <!--  <th data-formatter="demo_jobnameFormatter"data-align="center">操作</th>-->
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
    var aab998 ="<%=aab998_login%>";
    function select_demo_by_id(aef101){
    	rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_001_002/getEf11ById'/>/"+aef101,$('#input_content'));
    } 
    var demo_options={
    	formid:'query_form'
    }
    //初始化
    $(function(){
    	//$('.collapse-link').click();
    	$('#ee17table').inittable(demo_options);
    });
  
    
    //用户表格监听,双击 
    $('#ee17table').on('dbl-click-row.bs.table', function (e, row, $element) {
    	demo_view_by_id(row.eee171)
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
    	$('#ee17table').refreshtable();
    	//$('.collapse-link').click();
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
    function demo_edit_by_id(eee171,aee152,aee150){
    	layer.open({
	   		  type: 2,
	   		  title: '受理页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['60%', '80%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_006_003/replyAdvice'/>/"+eee171+"/"+aab998 //iframe的url
 		});
    }
    
    //查看
    function demo_view_by_id(eee171){
    	layer.open({
	   		  type: 2,
	   		  title: '查看详细信息页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['70%', '70%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_007_003/viewSelectOpinion'/>/"+eee171+"/"+aab998 //iframe的url
 		});
    }
    
    
    //批量删除
    function demo_bat_delete(){
   		var selections=$('#ac01table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
   			   for(i=0;i<selections.length;i++){
   	     	   var item=selections[i];
   	     	   selectnodes+=item.aac001+',';
   	       }
   		   rc.ajax("<c:url value='/demo/batdelete'/>", {selectnodes:selectnodes},function (response) {
   		    	alert(response.message);
   		    	$('#ac01table').refreshtable();
   		   }); 
   	    }else{
   	 	   layer.alert("请至少选中一条记录");                
   			   return;
   	    }
    }
    </script>
</body>
</html>