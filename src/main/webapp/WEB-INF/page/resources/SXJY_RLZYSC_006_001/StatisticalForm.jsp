<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
</head>
<iframe id="reportFrame" width="900" height="400" src="/WebReport/ReportServer?reportlet=/doc/Primary/Parameter/Parameter.cpt" onload="this.height=main.document.body.scrollHeight" style="position:relative""></iframe> 
<body class="gray-bg sidebar-content" style="overflow: hidden;">

<script id="tpl" type="text/x-handlebars-template" >
                <a class="link" onclick="demo_view_by_id('{{eee111}}')"><i class="fa fa-file-o"></i>&nbsp;查看</a> 
               
            </script>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="sidebard-panel">
    <div>
        <div id="ceshi" style="height:480px;overflow: auto; ">
<!-- 	        <div class="feed-element"> -->
<!-- 	            <a href="index_3.html#" class="pull-left"> -->
<!-- 	                <img  id="eee111" alt="image" class="img-circle" src="http://orheaidcn.bkt.clouddn.com/a2.jpg"  onclick="demo_view_by_id('{{eee111}}')"> -->
<!-- 	            </a> -->
<!-- 	            <div class="media-body"> -->
<%-- 				              标题：<input id="title"  style="border: none;font-style: italic;font-size: 16px"  readonly="readonly">${response.rows[0].aee102}</input> <br> --%>
<%-- 				             时间：  <small class="text-muted"><input  readonly="readonly" id="date" style="border: none;font-style: italic;font-size: 16px">${response.rows[0].aee105}</input></small> --%>
<!-- 	            </div> -->
<!-- 	        </div> -->
	     </div>
    </div>
    </div>
    
    
       <div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div>
                        <h3 class="m-b-xs text-center font-bold">统计报表</h3>
                         <div class="error-desc text-center">
                                                         统计报表正在开发中......敬请见谅  谢谢！             
                        </div>
                    </div>   
                </div>
            </div>
        </div>
    </div>
    </div> 
    <rc:jsfooter/>
    <script src="<c:url value='/resource/hplus/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/resource/hplus/js/bootstrap.min.js'/>"></script>
    </div>
</body>
</html>