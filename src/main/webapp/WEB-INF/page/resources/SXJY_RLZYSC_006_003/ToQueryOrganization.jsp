<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>机构基本信息选择框</title>
     <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper">
         <!-- 查询条件 -->
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
			           <!-- 隐藏域 -->
			           <rc:hidden property="callback_fun_name" value="${callback_fun_name}"/>
			           <rc:hidden property="code"/>
			           <rc:hidden property="value"/>
			           <!-- 隐藏域 结束 -->
                       <rc:textedit property="aef104" cols="2,3" label="机构名称"/>
			           <rc:textedit property="aab998" cols="3,4" label="统一社会信用代码"/>
			       </div>
			       <div class="hr-line-dashed"></div>
			       <div class="form-group">
			           <div class="col-sm-12 col-xs-12" align="right">
		                  <a class="btn btn-info" onclick="select_query()"><i class="fa fa-search"></i>&nbsp;查询</a>
		                  <a class="btn btn-info" onclick="select_reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
		               </div>
			       </div>
		       </form>
	       </div>
        </div>
            
        <!-- 查询结果 -->    
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询结果列表</h5>
                <div class="ibox-tools">
                                                     双击选中
                </div>
            </div>
            <div class="ibox-content">
			    <table id="ef11querytable" data-url="<c:url value='/resources/SXJY_RLZYSC_001_002/getEf11List'/>"
			     data-pagination="true"
			     data-page-size="10">
			    <thead>
				    <tr>
				        <th data-formatter="select_indexFormatter">序号</th>
				        <th data-field="aef101" hidden="true" >机构编号</th>
	                    <th data-field="aef104" >机构名称</th>
	                    <th data-field="aab998" >统一社会信用代码</th>
	                    <th data-field="aef107" >隶属关系所属市</th>
	                    <th data-field="aef134" >隶属关系所属区县</th>
	                    <th data-field="aef106" >机构性质</th>
	                    <th data-field="aef109" >经营类型</th>
				    </tr>
			    </thead>
			    </table>
            </div>
            <div class="col-sm-12 col-xs-12" align="right">
                <button disabled="disabled" id="btn_confirm" class="btn btn-info" onclick="select_confirmframe()"><i class="fa fa-save"></i>&nbsp;确定</button>
                <button class="btn btn-danger"  onclick="select_closeframe()"><i class="fa fa-remove"></i>&nbsp;取消</button>
            </div>
        </div>
        <!-- End Panel Basic -->
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    var demo_options={
        	formid:'query_form'
        }
        //初始化
        $(function(){
        	$('#ef11querytable').inittable(demo_options);
        	$('#ef11querytable').on('click-row.bs.table', function (e, row, $element) {
            	select_click(row);
            }).on('dbl-click-row.bs.table', function (e, row, $element) {
            	select_click(row);
            	select_confirmframe();
            }) 
        });
       
        //列选中后将机构编号赋到页面隐藏域中
        function select_click(row){
            $('#code').val(row.aef101);
        	$('#value').val(row.aef104);
            $('#btn_confirm').removeAttr("disabled");
           /*  alert("机构编号赋值结束") */
        }
        //
        function select_indexFormatter(value, row, index) {
            return index+1;
        }
        //
        function select_confirmframe(){
        	/* alert("进入确认页面"); */
        	var ff=$('#callback_fun_name').val();
        	if(ff){
        		var code=$('#code').val();
            	var value=$('#value').val();
            	if(code){
            		parent.${callback_fun_name}(code,value);
            		select_closeframe();
            	}else{
            		layer.alert('请先选择一条记录');
            	}
        	}else{
        		layer.alert('页面设计缺少相关回调函数,请联系开发人员');
        	}
        }
        //关闭
        function select_closeframe(){
        	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        	parent.layer.close(index); //再执行关闭   
        }
        //查询
        function select_query(){
        	$('#ef11querytable').refreshtable();
        }
        
        function select_reset(){
        	rc.clean($('query_form'));
        	$('#btn_confirm').attr('disabled',"true")
        }
    </script>
</body>
</html>