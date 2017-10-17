<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查阅投诉信息</title>
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
                     <rc:textedit label="投诉者手机号码" property="aee113"  required="true"  cols="2,3"/>
                     <div class="col-sm-3" >
		                  <a class="btn btn-info" onclick="demo_query()"><i class="fa fa-search"></i>&nbsp;查询</a>
		                  <a class="btn btn-info" onclick="rc.clean($('query_form'))"><i class="fa fa-refresh"></i>&nbsp;重置</a>
		               </div>
		               
			       </div>
			      
		       </form>
		 <span style="font-size: 14px;width: 100px;font-style: inherit;"><font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注：请您输入投诉者联系电话，然后点击查询按钮，查看自己的受理状态或者历史记录。</font></span> 
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
                 <a class="link" onclick="demo_view_by_id('{{eee131}}')"><i class="fa fa-file-o"></i>&nbsp;查看</a> 
                
              
               
            </script>

			
            <div class="ibox-content">
			    <table id="ee13table" data-url="<c:url value='/resources/SXJY_RLZYSC_005_001/getEe13ByPhone'/>" 
			          data-click-to-select="false"
                      data-toolbar="#toolbar"
                      data-page-size="10" >
			    <thead>
				    <tr>
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter" data-align="center" >序号</th>
	                    <th data-field="aee109" data-align="center" >投诉者姓名</th>
	                    <th data-field="aee113" data-align="center">投诉者电话</th>
	                    <th data-field="aee114" data-align="center">被投诉机构名称</th>
	                    <th data-field="aee110" data-align="center">投诉者标题</th>
	                    <th data-field="aee111" data-align="center">投诉内容</th>
	                    <th data-field="aee116" data-align="center">投诉时间</th>
	                    <th data-field="aee115" data-align="center" >受理状态</th>
	                    <th data-field="aee112" data-align="center" >回复内容</th>
	                    <th data-formatter="demo_jobnameFormatter">操作</th>
				    </tr>
			    </thead>
			    </table>
            </div>
              <div class="form-group" style="text-align: right;">
	              <button  class="btn btn-primary " onclick="location.href='../../gotologin'">返回登录页面</button>
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
    	//$('.collapse-link').click();
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
    
    
  
    
    </script>
</body>
</html>