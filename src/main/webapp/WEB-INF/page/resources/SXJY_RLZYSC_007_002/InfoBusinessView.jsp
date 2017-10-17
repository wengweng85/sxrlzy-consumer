<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.epsoft.com/rctag" prefix="rc"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看详细信息</title>
    <rc:csshead/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content ">
            <table class="table table-bordered table-striped">
		            <tr>
		                 <td>机构名称</td><td>${ee18.aef104}</td>	
		                 <td>年度</td><td>${ee18.aee150}</td>
		            </tr>
		            <tr>
		                 <td>农民工专场招聘会次数</td><td>${ee18.aee126}</td>
		                 <td>高校毕业生专场招聘会</td><td>${ee18.aee127}</td>
		            </tr>
		            <tr>
		                 <td>参会用人单位</td><td>${ee18.aee128}</td>
		                 <td>招聘岗位</td><td>${ee18.aee129}</td>
		            </tr>
		            <tr>
		                 <td>参会求职人数</td><td>${ee18.aee130}</td>
		                 <td>服务人员总数</td><td>${ee18.aee131}</td>	               
		            </tr>
		            <tr>
		                 <td>登记求职和要求提供流动服务人员</td><td>${ee18.aee132}</td>
		                 <td>帮助实现就业和流动人数</td><td>${ee18.aee133}</td>
		            </tr>
		            <tr>
		                 <td>服务用人单位（服务对象情况）</td><td>${ee18.aee134}</td>
		                 <td>服务用人单位（劳务派遣）</td><td>${ee18.aee135}</td>
		            </tr>
		            <tr>
		                 <td>派遣人员总量</td><td>${ee18.aee136}</td>
		                 <td>登记要求派遣人员</td><td>${ee18.aee137}</td>
		            </tr>
		            <tr>
		                 <td>服务用人单位数（人力资源管理咨询服务）</td><td>${ee18.aee138}</td>
		                 <td>服务用人单位（人力资源外包服务）</td><td>${ee18.aee139}</td>
		            </tr>
		            <tr>
		                 <td>现存档案数量</td><td>${ee18.aee140}</td>
		                 <td>依托档案提供服务</td><td>${ee18.aee141}</td>
		            </tr>
		            <tr>
		                 <td>举办培训班次数</td><td>${ee18.aee142}</td>
		                 <td>参加培训人员</td><td>${ee18.aee143}</td>
		            </tr>
		             <tr>
		                 <td>参加评测人数</td><td>${ee18.aee144}</td>
		                 <td>委托推荐岗位数</td><td>${ee18.aee145}</td>
		            </tr>
		             <tr>
		                 <td>成功推荐人才</td><td>${ee18.aee146}</td>
		                 <td>建立人力资源数据库</td><td>${ee18.aee147}</td>
		            </tr>
		             <tr>
		                 <td>数据库现存求职信息总量</td><td>${ee18.aee148}</td>
		                 <td>全年新增入库求职信息</td><td>${ee18.aee149}</td>
		            </tr>

            </table>		    
    </div>
    <rc:jsfooter/>  
</body>
</html>