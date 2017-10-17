<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息发布新增页面</title>
    <!-- css引入 -->
    <rc:csshead/>
</head>
<body class="gray-bg" style="margin-top:40px">
<div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <!--fluid 是偏移一部分-->
                    <div class="container-fluid " style="padding: 0px 20px;">
	                      <div class="form-group" style="text-align: right;">
	              <a class="btn btn-primary " onclick="demo_save_data()"><i class="fa fa-save"></i>&nbsp;保存</a>
	        </div>
                </div>
            </div>
     </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <form action="${contextpath}/resources/SXJY_RLZYSC_006_001/saveData"  >
        <div id="input_content">
	        <!-- 信息发布开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>信息发布</h5>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				       <div class="form-group">
			               <rc:textedit  property="aee119" required="true" label="信息标题"  cols="2,4"   validate="{required:true,maxlength:200,messages:{required:'信息标题不能为空'}}"/>
			               <rc:select  property="aee118" required="true" label="信息发布类型"  codetype="AEE118" cols="2,3" validate="{required:true,messages:{required:'请选择信息发布类型'}}"  />
			           </div>
			           <div class="hr-line-dashed"></div>
			           <div class="form-group">
				           <rc:select property="aee121" required="true"  label="是否上传附件"  cols="2,2"  codetype="YESNO" onchange="isUploadFile(this)"  validate="{required:true,messages:{required:'请选择是否上传附件'}}"/>
				           <div id="attach" style="display:none"> 
				           <a  href="JavaScript:void(0)" onclick="fileupload()" >上传附件</a>
				           </div>
				       </div>
				       <div id="fujian"  style="display:none">
				          <div class="ibox-title">
				                <h5>公告附件信息</h5>
				                <div class="form-group" style="text-align: right;">
				                    <button id="btn_delete" type="button" class="btn btn-danger" onclick="demo_delete_file()">
							          <span class="glyphicon glyphicon-remove" aria-hidden="false"></span>删除文件
							        </button>
							    </div>
				          </div>
				          <div class="ibox-content">
						   <table id="ee14filetable" 
							          data-click-to-select="true"
				                      data-toolbar="#toolbar"
				                      data-show-export="false"
				                      data-show-toggle="false"
				                      data-pagination="false"
				                      data-page-size="10" >
							    <thead>
								<tr>
							        <th data-checkbox="true" ></th>
							        <th data-formatter="file_indexFormatter">序号</th>
							        <th data-field="file_uuid" >文件编号</th>
				                    <th data-field="file_name" >文件名</th>
				                    <th data-field="file_length" >文件大小(byte)</th>
				                    <th data-field="file_type" >文件类型</th>
							    </tr>
							    </thead>
							</table>
							<!-- 隐藏域 用于保存表格json数据 -->
							<rc:hidden property="selectnodes" />
							<!-- 隐藏域结束 -->    
						</div>
					   </div>
			           <div class="hr-line-dashed"></div>
			           <rc:textarea label="信息发布内容" property="aee120"   required="true" rows="7"   validate="{required:true,maxlength:2000,messages:{required:'信息发布内容不能为空'}}"/>
			       </div>
		       </div>
	        </div>
	        <!-- 信息发布结束 -->
	        
         </div>
        </form>
    </div>
    <rc:jsfooter/>
    <script type="text/javascript">
    var $table=$('#ee14filetable');
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    	$table.inittable();
    });
    //关闭
    function select_closeframe(){
    	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    	parent.layer.close(index); //再执行关闭   
    }
    function demo_callback(response){
    	if(response.success){
    		alert(response.message);
    		parent.inforelease_query();
           	select_closeframe();
    	}
    	else{
    		alert(response.message);
    	}
    	
    }
    //保存页面配置信息
	function demo_save_data(){
		var ids = $.map($table.bootstrapTable('getData'), function (row) {
            return row.bus_uuid;
        });
		if(ids.length==0){
			$('#aee121').val("0");
		}
    	$('#selectnodes').val(ids);
	   $('form').submit();
	}
	function file_indexFormatter(value, row, index) {
        return index+1;
    }
    //下拉框变动获取复选框值
	function isUploadFile(o){
		if(o.value=="0"){
			document.getElementById("attach").style.display="none";
			document.getElementById("fujian").style.display="none";
	    }else {
		    document.getElementById("attach").style.display=""; 
		    document.getElementById("fujian").style.display="";	  
	    }
	}
    //文件上传
    function fileupload(){
    	rc.open_file_upload_page('000000000000000000000000000000','001','file_upload_callback');
    }
    //文件上传回调函数
    function file_upload_callback(file_bus_id,message){
    	console.log(message);
    	var res=eval("("+message+")");//转换为json对象 
    	var index = $table.bootstrapTable('getData').length;
        $table.bootstrapTable('insertRow', {
            index: index,
            row:res
        }); 
    }
    //删除一行
    function demo_delete_file(){
    	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.bus_uuid;
         });
 	    if(ids.length>0){
 	       var layerindex=layer.confirm('确定批量删除这些数据吗,删除后将不可逆？', function(index){
	    	      console.log(ids.toString());
	    	
 			  rc.ajax("<c:url value='/common/fileload/batdelete'/>", {selectnodes:ids.toString()},function (response) {
  	   		    	alert(response.message);
	     	   		    $table.bootstrapTable('remove', {
		                    field: 'bus_uuid',
		                    values: ids
		                });
  	   		   }); 
 			  layer.close(layerindex);
 	       });
	    }else{
	       layer.alert('请先选择你要删除的数据');
	    }
    }
    </script>
</body>
</html>