<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<%@ page import="com.insigma.shiro.realm.SysUserUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力资源服务机构设立申请</title>
    <rc:csshead/>
</head>
<%  String aab998_login = SysUserUtil.getCurrentUser().getAab998();  %>
<body class="gray-bg" style="margin-top:40px" >
<div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <!--fluid 是偏移一部分-->
                    <div class="container-fluid " style="padding: 0px 20px;">
	                     <div class="form-group" style="text-align: right;">
	              <a class="btn btn-info " onclick="demo_save_data()"><i class="fa fa-save"></i>&nbsp;保存</a>
	        </div>
                </div>
            </div>
     </div>
    <div class="wrapper wrapper-content animated fadeInRight" id="query_form" >
        <form action="${contextpath}/resources/SXJY_RLZYSC_002_001/saveData"  >
        <div id="input_content">
	        <!-- 机构基本信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构基本信息</h5>
	                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
				           <rc:hidden property="eef101" value="${eef101}"/>
			               <rc:textedit property="aef104" required="true" label="机构名称"   cols="2,5" validate="{required:true,maxlength:100,messages:{required:'机构名称不能为空'}}"  />
			               <rc:textedit property="aab998" required="true"  label="统一社会信用代码"  cols="2,3" onchange="search_resources_ab01()" validate="{required:true,maxlength:18,messages:{required:'统一社会信息用代码不能为空'}}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:select property="aef105" required="true"  label="机构状态" cols="2,2"  codetype="AEF105" validate="{required:true,messages:{required:'机构状态不能为空'}}"/>
				       	   <rc:select property="aef106" required="true"  label="机构性质" cols="2,2"  codetype="AEF106" validate="{required:true,messages:{required:'机构性质不能为空'}}"/>
				       	   <rc:select property="aef109" required="true" label="经营类型" 
									cols="2,2" codetype="AEF109"  onchange="cFw(this)" 
									validate="{required:true,messages:{required:'经营类型不能为空'}}" />
				       </div>
				       <div class="hr-line-dashed" ></div>
					   <div class="form-group"   id="zy" style="border: 0px solid transparent">
                           <rc:textedit  label="经营范围" property="aef110_1" readonly="true" required="true"  cols="2,10" />
                       </div>
                       <div class="hr-line-dashed" style="display:none"></div>
                       <div class="form-group"  id="rc" style="display:none;height:50px">
                           <rc:checkbox  label="经营范围"  required="true" property="aef110" cols="2,10" codetype="AEF110"/>
                       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef108" required="true"  label="注册机关" cols="2,2" validate="{required:true,maxlength:20,messages:{required:'注册机关不能为空'}}" />
				           <rc:select property="aef107" required="true" size="5"  label="隶属关系所在市"  cols="2,2" onchange="rc.code_value_select_data_change(this.value,'AAB802',['#aef134'])"     codetype="AAB801" validate="{required:true,messages:{required:'隶属关系所在市不能为空'}}"/>
			               <rc:select property="aef134" required="true" size="5"  readonly="true"  label="隶属关系所在区县"  cols="2,2"  codetype="AAB802"  validate="{required:true,messages:{required:'隶属关系所在区县不能为空'}}"/>
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <label class="col-sm-2 col-xs-1 control-label">
				       	         注册资金
				       	         <span class="require">*<span>
				       	   </label>
				       	   <div class="col-sm-1 col-xs-1">
				       	        <input class="form-control" style="width:125px;" placeholder="请输入注册资金"  type="text" name="aef117" validate="{required:true,messages:{required:'请输入注册资金'},number:true,maxlength:16}"/>
				       	   </div><label class="col-sm-1 control-label">万元</label>
				           <rc:select property="aef113" required="true" label="办公场地类型" cols="2,2"  codetype="AEF113" validate="{required:true,messages:{required:'办公场地类型不能为空'}}"/>
				           <label class="col-sm-2 col-xs-1 control-label">
				       	         办公场所面积
				       	         <span class="require">*<span>
				       	   </label>
				       	   <div class="col-sm-1 col-xs-1">
				       	        <input class="form-control" style="width:110px;" type="text" placeholder="请输入办公场所面积"  name="aef114" validate="{required:true,messages:{required:'请输入办公场所面积'},number:true,maxlength:16}"/>
				       	   </div><label class="col-sm-1 control-label">平方米</label>
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef111" required="true"  label="办公地址" cols="2,4" validate="{required:true,maxlength:200,messages:{required:'办公地址不能为空'}}"/>
				           <rc:textedit property="aef112" required="false" label="邮政编码" cols="2,2" validate="{number:true,maxlength:6}" />
				       </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				           <rc:textedit property="aef118" required="false" label="开户银行" cols="2,4" validate="{maxlength:30}" />
				           <rc:textedit property="aef119" required="false" label="开户账号" cols="2,4" validate="{number:true,maxlength:30}" />
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构基本信息结束 -->
	        
	        <!-- 机构联系信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构联系信息</h5>
	                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef121" required="true" label="机构联系人" cols="2,2" validate="{required:true,messages:{required:'请输入机构联系人'},maxlength:50}" />
			               <rc:textedit  property="aef122" required="true"  label="机构联系人电话" cols="2,2" validate="{mobile:true,maxlength:20,required:true,messages:{required:'请输入机构联系人电话'}}"/>
			               <rc:textedit property="aef123" required="false"  label="机构联系人电子邮箱" cols="2,2"  validate="{email:true,maxlength:30}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef115" required="false"  label="机构电话号码" cols="2,2" validate="{phone:true,maxlength:20}"/>
				           <rc:textedit property="aef116" required="false"  label="机构传真号码" cols="2,2" validate="{maxlength:20}"/>
				           <rc:textedit property="aef124" required="false"  label="机构网站" cols="2,2" validate="{maxlength:200}" />
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构联系信息结束 -->
	         <!-- 机构法人信息开始 -->
	        <div class="ibox ">
	            <div class="ibox-title">
	                <h5>机构法人信息</h5>
	                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
	            </div>
	            <div class="ibox-content">
		            <div class="form-horizontal"  >
				        <div class="form-group">
			               <rc:textedit  property="aef125" required="true" label="法人代表姓名" cols="2,3" validate="{maxlength:50,required:true,messages:{required:'请输入法人代表姓名'}}" />
			               <rc:textedit  property="aef126" required="true"  label="法人代表身份证号" cols="2,3" validate="{idcard:true,maxlength:18,required:true,messages:{required:'请输入法人代表身份证号'}}"/>
			           </div>
				       <div class="hr-line-dashed"></div>
				       <div class="form-group">
				       	   <rc:textedit property="aef127" required="false"  label="法人代表联系电话" cols="2,3" validate="{mobile:true,maxlength:20}" />
				       	   <rc:textedit property="aef128" required="false"  label="法人代表电子邮箱" cols="2,3" validate="{email:true,maxlength:50}" />
				       </div>
			       </div>
		       </div>
	        </div>
	        <!-- 机构法人信息结束 -->
	        <!-- 查询结果开始 -->    
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>机构工作人员列表</h5>
                <div class="ibox-tools" style="text-align: right;">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <!-- 模型 -->
            <script id="tpl" type="text/x-handlebars-template" >
                <a class="link" onclick="hragencyPerson_edit_by_id('{{eec111}}','{{index}}')"><i class="fa fa-edit"></i>&nbsp;编辑</a> 
                <a class="link" onclick="demo_delete_one('{{eec111}}')" ><i class="fa fa-remove"></i>&nbsp;删除</a> 
            </script>
            <!-- toolbar -->
            <div id="toolbar" class="btn-group">
				 <button id="btn_user" type="button" class="btn btn-info"  onclick="hragencyPersonInfoAdd()">
				 <span class="glyphicon glyphicon-plus" aria-hidden="false"></span>新增
				 </button>
				 <button id="btn_delete" type="button" class="btn btn-danger" onclick="demo_delete_file()">
				 <span class="glyphicon glyphicon-remove" aria-hidden="false"></span>批量删除
				 </button>
			</div>
            <div class="ibox-content">
			    <table id="ec11table" 
			          data-click-to-select="true"
				                      data-toolbar="#toolbar"
				                      data-show-toggle="false"
				                      data-pagination="false"
				                      data-page-size="10" >
			    <thead>
				    <tr >
				        <th data-checkbox="true" ></th>
				        <th data-formatter="demo_indexFormatter" data-align="center">序号</th>
	                    <th data-field="aac003" data-align="center">姓名</th>
	                    <th data-field="aac002" data-align="center">身份证号码</th>
	                    <th data-field="aac004" data-align="center">性别</th>
	                    <th data-field="aac011" data-align="center">学历</th>
	                    <th data-field="aac024" data-align="center">政治面貌</th>
	                    <th data-field="aac023" data-align="center">岗位及职务</th>
	                   <!--  <th data-field="aef001" data-align="center">相关资格证号码</th>
	                    <th data-field="aef002" data-align="center">相关资格培训时间</th> -->
	                    <th data-formatter="demo_jobnameFormatter" data-align="center">操作</th>
				    </tr>
			    </thead>
			    </table>
			    <!-- 隐藏域 用于保存表格json数据 -->
					<rc:hidden property="selectnodes" />
				<!-- 隐藏域结束 -->
            </div>
       <!-- 查询结果结束 -->
         </div>
        </form>
    </div>
   
    <rc:jsfooter/>
    <script type="text/javascript">
    var $table=$('#ec11table');
    var demo_options={
        	formid:'query_form'
        };
  //初始化
    $(function(){
    	$('#ec11table').inittable(demo_options);
    });     
    $(function() {
    	//验证 ajax
    	rc.validAndAjaxSubmit($("form"),demo_callback);
    	var url="<c:url value='/resources/SXJY_RLZYSC_002_001/getEc11List'/>";
    	$table.refreshtable(url);
    });
  //用户表格监听,双击表格记录事件 
    $('#ec11table').on('dbl-click-row.bs.table', function (e, row, $element) {
    	view_details_info(row.eec111);
    });  
    //操作编辑
    function demo_jobnameFormatter(value, row, index) {
        var tpl = $("#tpl").html(); 
        row.index=index;
        console.log(row);
	  	//预编译模板  
	  	var template = Handlebars.compile(tpl);  
	  	return template(row);
    }
    
    function demo_indexFormatter(value, row, index) {
        return index+1;
    }
    //机构工作人员添加回调函数
    function agencyPersonAdd_callback(file_bus_id,message){
    	console.log(message);
    	var res=eval("("+message+")");//转换为json对象 
    	var index = $table.bootstrapTable('getData').length;
        $table.bootstrapTable('insertRow', {
            index: index,
            row:res
        }); 
    }
  //机构工作人员编辑回调函数
    function agencyPersonEdit_callback(index,message){
    	console.log(message);
    	var res=eval("("+message+")");//转换为json对象 
        $table.bootstrapTable('updateRow', {
            index: index,
            row:res
        }); 
    }
    //查询
    function agencyPerson_query(){
    	$('#ec11table').refreshtable();
    }
    //初始化查询申报未审核机构信息
    $(function(){
    	//登录系统验证该用户是否已经做过设立申报，如果申报了，则获取统一信用代码。
    	//若申报信息未审核可以继续修改提交。测试机构999888111
        var aab998 ="<%=aab998_login%>";
        if(aab998!=null){
        	var url = "<c:url value='/resources/SXJY_RLZYSC_002_001/getHRAgencyDeclareInfoById'/>/"+aab998;
     		var param = $('input_content').serializeObject();
        	rc.ajax(url,param,function(response){
    			if(response.success){
    				var jsondata=response.obj;
    				var dom_selector;
    				//调用页面赋值方法
    				rc.evaluation(response.obj,dom_selector);
    				//动态显示复选框的值
    		    	var aef109= jsondata.aef109;
    		    	if(aef109=="0" || aef109==null)
    				{
    					document.getElementById("zy").style.display="";
    					document.getElementById("aef110_1").value="求职、用人登记；职业介绍、职业指导；收集、发布职业供求、培训信息；为家庭用工提供中介服务；互联网职业信息服务；法律、法规和政策咨询";
    				    document.getElementById("rc").style.display="none";
    					
    				}else {
    					document.getElementById("zy").style.display="none";
    					document.getElementById("rc").style.display=""; 
    				}
    		    	agencyPerson_query();
    			}else {
    				rc.errorMask(null,response.message);
    			}
    		});	        
        } 
    });
    //保存页面配置信息
	function demo_save_data(){
    	
		var aab998=$('#aab998').val();
    	if(!aab998){
    		layer.msg('统一社会信用代码不能为空');
    		$('#aab998').focus();
    		return ;
    	} else {
    		var rule =/^(?![0-9]+$)(?![A-Z]+$)[0-9A-Z]{18}$/;
    		if(!rule.test(aab998))
	        {
    			layer.msg('统一社会信用代码必须为18位数字字母组合,字母须为大写');
    			$('#aab998').focus();
	             return ;
	        }
    	}
		var ids = $.map($table.bootstrapTable('getData'), function (row) {
            return row.eec111;
        });
		if(ids.length==0){
			$('#aec100').val("0");
		}
		if(ids.length<3){
			alert("机构工作人员数量不能少于3个");
			return false;
		}
    	$('#selectnodes').val(ids);
	   $('form').submit();
	}
    //查询基础库机构信息表
	function search_resources_ab01(){
    	
		var aab998= $('#aab998').val();
		var url = "<c:url value='/resources/SXJY_RLZYSC_002_001/getAgencyEf11InfoByAab998'/>/"+aab998;
 		var param = $('input_content').serializeObject();
 		if(aab998!=null){
 			rc.ajax(url,param,function(response){
 				if(response.success){
 					var jsondata=response.obj;
 					if(aab998==jsondata.aab998){
 						alert("统一社会信用代码"+aab998+"已经存在,请输入正确的统一社会信用代码！");
 					}
 				}else {
 					rc.ajaxQuery("<c:url value='/resources/SXJY_RLZYSC_002_001/getAgencyInfoByAab998'/>/"+aab998,$('#input_content'));
 				}
 			});
 		}
    }
    function demo_callback(response){
    	if(response.success){
    		alert(response.message);
    		window.location.href="/sxrlzy/resources/SXJY_RLZYSC_002_001/toreg";
    	}
    	else{
    		alert(response.message);
    	}
    	
    }
    // 统一信用代码校验 
	 function test()
    {
        var aab998= $('#aab998').val();
        //对统一信用代码的验证
         var rule=/^[^_IOZSVa-z\W]{2}\d{6}[^_IOZSVa-z\W]{10}$/g;
        if(!rule.test(aab998))
        {
              alert('请输入合法的统一信用代码');
              rule.focus();
              return false;
        }
    }
	//下拉框变动获取复选框值
	function cFw(o){
		if(o.value=="0")
		{
			document.getElementById("zy").style.display="";
			document.getElementById("aef110_1").value="求职、用人登记；职业介绍、职业指导；收集、发布职业供求、培训信息；为家庭用工提供中介服务；互联网职业信息服务；法律、法规和政策咨询";
		    document.getElementById("rc").style.display="none";
			
		}else {
			document.getElementById("zy").style.display="none";
			document.getElementById("rc").style.display=""; 
		} 	     
	}	
	//点击新增按钮触发
    function hragencyPersonInfoAdd(){
    	layer.open({
	   		  type: 2,
	   		  title: '机构工作人员新增页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '80%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_002_001/toaddPerson'/>" //iframe的url
		  });
     }	
    //机构工作人员详细信息页面
    function view_details_info(eec111){
    	layer.open({
	   		  type: 2,
	   		  title: '机构工作人员详细信息页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '60%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_002_001/todetailPerson'/>/"+eec111  //iframe的url
 		  });
    }
    //编辑
    function hragencyPerson_edit_by_id(eec111,index){
    	layer.open({
	   		  type: 2,
	   		  title: '机构工作人员编辑页面',
	   		  shadeClose: false,
	   		  maxmin:true,
	   		  shade: 0.8,
	   		  area: ['80%', '80%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_002_001/toeditPerson'/>/"+eec111+"/"+index //iframe的url
	   		  
 		});
    }
    //删除
    function hragencyPerson_delete_by_id(eec111){
   	  if(eec111){
   		layer.confirm('确定要删除该条数据吗？', function(index){
   			var url= "<c:url value='/resources/SXJY_RLZYSC_002_001/deletePerson/'/>"+eec111;
   			rc.ajax(url, null,function (response) {
   				if(response.success){
   					$('#ec11table').refreshtable();
   				}else{
   					alert(response.message);
   				}
   			});
   		});
   	  }else{
   		layer.alert('请先选择你要删除的数据');
   	  }
    }
    //批量删除
    function demo_delete_file(){
    	    
	    	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	            return row.eec111;
	        });
	    	if(ids.length>0){
	    		var layerindex=layer.confirm('确定批量删除这些数据吗,删除后将不可逆？', function(index){
	    			console.log(ids.toString());
    			  rc.ajax("<c:url value='/resources/SXJY_RLZYSC_002_001/batdeletePerson'/>", {selectnodes:ids.toString()},function (response) {
     	   		    	alert(response.message);
	     	   		    $table.bootstrapTable('remove', {
		                    field: 'eec111',
		                    values: ids
		                });
     	   		   }); 
    			  layer.close(layerindex);
	    		});
	        }else{
	        	layer.alert('请先选择你要删除的数据');
	        }
    }
    //删除
    function demo_delete_one(eec111){
    	var layerindex=layer.confirm('确定删除这些数据吗,删除后将不可逆？', function(index){
    		var url= "<c:url value='/resources/SXJY_RLZYSC_002_001/deletePerson/'/>"+eec111;
    		rc.ajax(url, null,function (response) {
	   		    	alert(response.message);
    	   		    $table.bootstrapTable('remove', {
	                    field: 'eec111',
	                    values: [eec111]
	                });
	   		 }); 
			layer.close(layerindex);
		 });   
	    		 
    }
    </script>
</body>
</html>