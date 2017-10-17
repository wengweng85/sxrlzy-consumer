<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% 
	String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404</title>
    <rc:csshead/>
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="<c:url value='/resource/hplus/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resource/hplus/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resource/hplus/css/animate.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resource/hplus/css/style.min.css'/>" rel="stylesheet">
    <!-- Morris -->
    <link href="<c:url value='/resource/hplus/css/plugins/morris/morris-0.4.3.min.css'/>" rel="stylesheet">
    <!-- Gritter -->
    <link href="<c:url value='/resource/hplus/js/plugins/gritter/jquery.gritter.css'/>" rel="stylesheet">
</head>
<body class="gray-bg"  >
<script id="tpl" type="text/x-handlebars-template" >
                <a class="link" onclick="demo_view_by_id('{{eee111}}')"><i class="fa fa-file-o"></i>&nbsp;查看</a> 
</script>
 <form action="${contextpath}/resources/SXJY_RLZYSC_003_001/tonotice" > 
   <div class="wrapper wrapper-content">
    <div class="row">
    <%-- <shiro:hasRole name="区县人力资源管理机构"> --%>
        <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>服务机构设立申请进度</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="index.html#">选项1</a>
                                </li>
                                <li><a href="index.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <!--  <div class="ibox-content ibox-heading">
                        <h3>还有约79842492229个Bug需要修复</h3>
                        <small><i class="fa fa-map-marker"></i> 地点当然是在办公室</small>
                    </div>-->
                    <div class="ibox-content timeline">

                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-briefcase"></i> 9:10
                                    <br/>
                                    <small class="text-navy">注册</small>
                                </div>
                                <div class="col-xs-7 content no-top-border">
                                    <p class="m-b-xs"><strong>服务机构用户注册</strong>
                                    </p>
									<p>申报人：高山</p>
                                    <p>申报时间：2017-9-1 9:10:33</p>
									<!--  
                                    <p><span data-diameter="40" class="updating-chart">5,3,9,6,5,9,7,3,5,2,5,3,9,6,5,9,4,7,3,2,9,8,7,4,5,1,2,9,5,4,7,2,7,7,3,5,2</span>
                                    -->
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-file-text"></i> 9:30
                                    <br/>
                                    <small class="text-navy">申请</small>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>服务机构设立申请</strong>
                                    </p>
                                    <p>申报人：高山</p>
                                    <p>申报时间：2017-9-1 9:10:33</p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-coffee"></i> 8:00
                                    <br/>
                                    <small class="text-navy">初审</small>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>服务机构设立初审</strong>
                                    </p>
                                    <p>审核负责人：郭钟</p>
                                    <p>审核时间：2017-9-2 9:35:15</p>
                                    <p>
                                       审核状态 ：审核通过 
                                    </p>
                                </div>
                            </div>
                        </div>                                                                   
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-phone"></i> 11:00
                                    <br/>
                                    <small class="text-navy">复审</small>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>服务机构设立复审</strong>
                                    </p>
                                    <p>审核负责人：李爱华</p>
                                    <p>审核时间：2017-9-3 5:12:15</p>
                                    <p>
                                       	审核状态：审核通过
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-user-md"></i> 09:00
                                    <br/>
                                    <small class="text-navy">终审</small>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>服务机构设立终审</strong>
                                    </p>
                                    <p>审核负责人：黑龙</p>
                                    <p>审核时间：2017-9-5 7:55:15</p>
                                    <p>
                                        	审核状态：审核通过
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%-- </shiro:hasRole> --%>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>公告信息 </h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content ibox-heading">
                        <h3><i class="fa fa-envelope-o"></i> 新消息</h3>
                        <small><i class="fa fa-tim"></i> 您有22条未读消息</small>
                    </div>
                    <div class="ibox-content">
                        <div class="feed-activity-list">

                            <div class="feed-element">
                                <div>
                                    <small class="pull-right text-navy">1月前</small>
                                    <strong>海大创新公司发布</strong>
                                    <div>有人说：“一辈子很长，要跟一个有趣的人在一起”。我想关注我的人，应该是那种喜欢找乐子也乐意分享乐趣的人，你们一定挺优秀的。所以单身的应该在这条留言，互相勾搭一下。特别有钱人又帅可以直接私信我！</div>
                                    <small class="text-muted">4月11日 00:00</small>
                                </div>
                            </div>

                            <div class="feed-element">
                                <div>
                                    <small class="pull-right">2月前</small>
                                    <strong>数据的策划 </strong>
                                    <div>针对数据库的优化，以及数据的安全保护，需要更加的技术支持。</div>
                                    <small class="text-muted">11月8日 20:08 </small>
                                </div>
                            </div>

                            <div class="feed-element">
                                <div>
                                    <small class="pull-right">5月前</small>
                                    <strong>框架的发布 </strong>
                                    <div>今日，由山东林科有限公司发布的最新技术框架得到大家支持。</div>
                                    <small class="text-muted">11月8日 20:08 </small>
                                </div>
                            </div>

                            <div class="feed-element">
                                <div>
                                    <small class="pull-right">5月前</small>
                                    <strong>分析业务的逻辑性</strong>
                                    <div>针对于业务逻辑的缜密性，程序员需要多加努力。</div>
                                    <small class="text-muted">11月8日 20:08 </small>
                                </div>
                            </div>


                            <div class="feed-element">
                                <div>
                                    <small class="pull-right">5月前</small>
                                    <strong>H5的前景</strong>
                                    <div>H5的盛行，多元化的元素有着重要作用，值得你收下学习。</div>
                                    <small class="text-muted">11月8日 20:08 </small>
                                </div>
                            </div>                          
                            
                        </div>
                    </div>
                </div>
            </div>
                    <div class="col-sm-4">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>业务办理状态</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <table class="table table-hover no-margins">
                                    <thead>
                                        <tr>
                                        	<th>业务类型</th>
                                            <th>日期</th>
                                            <th>状态</th>                                    
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td>服务机构设立申请</td>
                                            <td><i class="fa fa-clock-o"></i> 11:20</td>                                 
                                            <td><small>审核通过</small>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>服务机构变更申请</td>
                                            <td><i class="fa fa-clock-o"></i> 10:40</td>
                                            <td><span class="label label-warning">审核不通过</span>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>服务机构业务报告申请</td>
                                            <td><i class="fa fa-clock-o"></i> 01:30</td>
                                            <td><small>审核通过</small>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>服务机构注销申请</td>
                                            <td><i class="fa fa-clock-o"></i> 02:20</td>
                                            <td><small>审核通过</small>
                                            </td>
                                        </tr>
                            
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>          
         
            
            
            <!--  <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div>
                        <h3 class="m-b-xs text-center font-bold">主页</h3>
                         <div class="error-desc text-center">
                                                         各系统根据实际业务需求设计开发....              
                        </div>
                    </div>   
                </div>
            </div>
        </div>-->
    </div>
    </div> 
    <rc:jsfooter/>
    <script src="<c:url value='/resource/hplus/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/flot/jquery.flot.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/flot/jquery.flot.tooltip.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/flot/jquery.flot.spline.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/flot/jquery.flot.resize.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/flot/jquery.flot.pie.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/peity/jquery.peity.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/demo/peity-demo.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/content.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/jquery-ui/jquery-ui.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/gritter/jquery.gritter.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/easypiechart/jquery.easypiechart.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/plugins/sparkline/jquery.sparkline.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/demo/sparkline-demo.min.js'/>"></script>
    </div>
    
    <script type="text/javascript">
    var demo_options={
    	formid:'query_form'
    }
    //初始化
    $(function(){
    	//$('.collapse-link').click();
    	
    	var eee111='10000029';
        if(eee111!=null){
         	var url = "<c:url value='/resources/SXJY_RLZYSC_003_001/toview'/>/"+eee111;
         	rc.ajax(url,"",function(response){
         		$.each(response.rows,function(i,item){
         			var title=item.aee102;
         			var text=item.aee103;
         			var date=item.aee105;
         			var html= ''
             			+'<div class="feed-element">'
             			+'<a href="index_3.html#" class="pull-left">'
             			+'<img  id="eee111" alt="image" class="img-circle" src="http://orheaidcn.bkt.clouddn.com/a2.jpg">'
             			+'</a>'
             			+'<div class="media-body">'
    		            +'标题：<input id="title"  style="border: none;font-style: italic;font-size: 16px"  readonly="readonly" value="'+title+'"/><br>'
    			        +'时间：  <small class="text-muted"><input  readonly="readonly" id="date" style="border: none;font-style: italic;font-size: 16px"  value="'+date+'"/></small>'
    		            +'內容：<textarea id="text" style="border: none;font-style: italic;font-size: 16px"  readonly="readonly">'+text+'</textarea>'
             	        +'</div>'
             	        +'</div>'
             			;
         			$("#ceshi").append(html);
         			
         		});
        		 //alert(response.rows[0].aee102);
        		});	
         	        
         }
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
    
    
    //查看
    function demo_view_by_id(eee111){
    	layer.open({
	   		  type: 2,
	   		  title: '查看页面',
	   		  shadeClose: false,
	   		maxmin:true,
	   		  shade: 0.8,
	   		  area: ['40%', '90%'],
	   		  content: "<c:url value='/resources/SXJY_RLZYSC_003_001/toselect'/>/"+eee111 //iframe的url
 		});
    }
    
    
    //批量删除
    function demo_bat_delete(){
   		var selections=$('#ee11table').getAllTableSelections();
   	    //选中的值
   	    var selectnodes='';
   	    if(selections.length>0){
   			   for(i=0;i<selections.length;i++){
   	     	   var item=selections[i];
   	     	   selectnodes+=item.eee111+',';
   	       }
   		   rc.ajax("<c:url value='/resources/SXJY_RLZYSC_003_001/batdelete'/>", {selectnodes:selectnodes},function (response) {
   		    	alert(response.message);
   		    	$('#ee11table').refreshtable();
   		   }); 
   	    }else{
   	 	   layer.alert("请至少选中一条记录");                
   			   return;
   	    }
    }
    
    //关闭
    function select_closeframe(){
    	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    	parent.layer.close(index); //再执行关闭   
    	
    }
    
    </script>
</body>
</html>