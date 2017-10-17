<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息发布展示页面</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
            
        <!-- 查询结果开始 -->    
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>政策法规信息列表</h5>
                <div class="ibox-tools">
                </div>
            </div>
            <div class="ibox-content">
			    <table id="ee14table" data-url="<c:url value='/resources/SXJY_RLZYSC_006_002/getEe14List'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-page-size="10" >
			    <thead>
				    <tr >
				        <th data-formatter="demo_indexFormatter" data-align="center">序号</th>
	                    <th data-field="aee119" data-align="center" data-width="230px">标题</th>
	                    <th data-field="aee118" data-align="center">发布类型</th>
	                    <th data-field="aee123" data-align="center">发布时间</th>
	                    <th data-field="aae010" data-align="center">发布人</th>
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
    
    //信息发布详细信息页面
    function view_details_info(eee141){
    	layer.open({
	   		  type: 2,
	   		  title: '信息发布详细信息页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '70%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_006_002/todetail'/>/"+eee141  //iframe的url
 		  });
    }
    </script>
</body>
</html>