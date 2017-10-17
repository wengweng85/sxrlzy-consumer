<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>行政区划服务机构</title>
<!-- css头文件  -->
<rc:csshead />
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="col-sm-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>行政机构树</h5>
				</div>
				 <div id="result"></div>
	             <div >
	              <rc:textedit label="" property="" cols="1,8"/>
	              <button class="btn btn-info"  onclick="select_closeframe()"><i class="fa fa-search"></i>&nbsp;查询</button>
	             </div>
			   <!--  <span id=input-content>
			  
			     <input type="text" class="form-control" id="input_search"  name="input_search"  value="快速搜索" width="50px">
	             <a class="btn btn-primary " onclick="queryTreeByName()"><i class="fa fa-select"></i>&nbsp;查询</a>
			    </span> -->
				 <ul class="nav nav-tabs">
                     <li class="active"><a data-toggle="tab" href="#tab-1">服务机构代码树</a></li>
                     <li class=""><a data-toggle="tab" href="#tab-2">管理机构代码树</a></li>
                </ul>
                <div class="tab-content ">
                  <div id="tab-1" class="tab-pane active">
                      <div class="panel-body">
                          <div id="tree-div" class="ztree" style="overflow: auto; width:100%; height: 450px; "></div>
                      </div>
                  </div>
                  <div id="tab-2" class="tab-pane active">
                      <div class="panel-body">
                          <div id="tree-div" class="ztree" style="overflow: auto; width:100%; height: 450px; "></div>
                      </div>
                  </div>
                </div>
			</div>
		   <div style="border: 1px solid #fff" >
	         <div class="col-sm-2 col-xs-2">
	            <div class="nput-group-btn">
		            <!-- 隐藏域 -->
				    <rc:hidden property="codetype" value="${codetype}"/>
				    <rc:hidden property="code"/>
		            <span class="btn btn-outline btn-info" id="value"></span>
	            </div>
	            <!--<script id="tpl" type="text/x-handlebars-template" >
	                {{name}}
	            </script>  -->
                
	         </div>
            </div>
		</div>
		<div class="col-sm-8">
			<div class="row">
			    <div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>机构信息</h5>
						</div>
						<div class="ibox-content" >
							<form class="form-horizontal" id="group_form" action="${contextpath}/resources/SXJY_RLZYSC_003_002/saveEe11data">
								<!-- 隐藏区域 -->
								<rc:hidden property="groupid"/>
								<div class="form-group">
									<rc:textedit property="aef104" label="机构名称"  cols="2,6" readonly="true" />
								</div>
								<div class="hr-line-dashed"></div>
								<div class="form-group">
								    <rc:textedit  property="aee102" required="true"  label="公告标题" cols="2,6" />
								</div>
							    <div class="hr-line-dashed"></div>
			                    <div class="form-group">
			                    <rc:date label="起始时间" property="aee105" required="true"  cols="2,4"/>
			                     <rc:date property="aee106" required="true"  label="截止时间" cols="2,4"   />
			                    </div>
			                    <div class="hr-line-dashed"></div>
					            <rc:textarea label="公告内容" property="aee103"   required="true" rows="6"   validate="{required:true,messages:{required:'备注信息不能为空'}}"/>
					            <div class="hr-line-dashed"></div>
					            <div class="form-group">
					            <rc:select label="是否发布" property="aee107" cols="2,2"  codetype="AEE107"/> 
					            </div>
					            <div class="hr-line-dashed"></div>
					            <div class="form-group" style="text-align: right;">
	                            <a class="btn btn-primary " onclick="demo_save_data()"><i class="fa fa-save"></i>&nbsp;保存</a>
	                            </div>
							</form>
						</div>
					</div>
				</div>
		    </div>
		</div>
    </div>
<!-- 引用js -->
<rc:jsfooter />
<script type="text/javascript">
//初始化树
$(function(){
	   //queryTreeByName();
// 	   if(!$('#codetype').val()){
// 	       layer.alert('页面设计缺少相关代码类型参数,请联系开发人员');
// 	   }else{
			//$('#codetype').val('610000')
	       $.fn.zTree.init($("#tree-div"), code_type_setting); 
// 	   }
})

//树配置
var code_type_setting = {
	  view: {
        showLine: true
	  },	
	  check: {
		enable: false
	  },
	  data: {
		simpleData: {
			enable: true,
			pIdKey: "pid"
		}
	  },
	  callback: {
	      onClick:onClick
	  },
	  async: {
		 enable: true,
		 url: "<c:url value='/resources/SXJY_RLZYSC_003_002/treedata'/>",
		 autoParam:["id"]
	  }
};
//代码搜索框
// $("#input_search").bsSuggest({
//   url:"<c:url value='/resources/SXJY_RLZYSC_003_002/getCodeValueFromCache'/>?code_type=${codetype}",
//   effectiveFields: ['code_describe'],
//   searchFields: [ "code_describe"],
//   idField: "code_value",
//   keyField: "code_describe",
//   allowNoKeyword:true,
//   multiWord:false
// }).on('onSetSelectValue', function (e, keyword, data) {
//   //console.log('onSetSelectValue: ', keyword);
//   $('#code').val(keyword.id);
// 	 $('#value').html(keyword.key);
//   $('#btn_confirm').removeAttr("disabled");
// })

 /**
 * 树节点的模糊查询
 */
   function queryTreeByName() {
    var searchname = $("#input_search").val(); //获取树搜索的树名称
        if (searchname != null && searchname != '') {
             setting.async.url = "radowAction.do?method=doEvent&pageModel=pages.assistance.SXJY_JYYZGL_002_011.Company&eventNames=queryTree&searchname=" + searchname;
             $.fn.zTree.init($("#tree-div"), setting);
             } else {
             setting.async.url = "radowAction.do?method=doEvent&pageModel=pages.assistance.SXJY_JYYZGL_002_011.Company&eventNames=queryTree";
             $.fn.zTree.init($("#tree-div"), setting);
              }
            }
            
//点击事件
function onClick(event, treeId, treeNode, clickFlag) {
	$('#code').val(treeNode.id);
	$('#value').html(treeNode.code_describe);
 $('#btn_confirm').removeAttr("disabled");
}


// function select_confirmframe(){
// 	var ff=$('#callback_fun_name').val();
// 	if(callback_fun_name){
// 		var code=$('#code').val();
//   	var value=$('#value').text();
//   	if(code){
//   		parent.${callback_fun_name}(code,value);
//   		select_closeframe();
//   	}else{
//   		layer.alert('请先选择一条记录');
//   	}
// 	}else{
// 		layer.alert('页面设计缺少相关回调函数,请联系开发人员');
// 	}
// }

//关闭
function select_closeframe(){
	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	parent.layer.close(index); //再执行关闭   
}

</script>
</body>
</html>