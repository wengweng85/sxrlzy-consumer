package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_003;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.EE18;
import com.insigma.mvc.model.Ee15;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_001.HRServicesRegEf11Service;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_003.BusinessRecruitmentEe18Service;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_003.BusinessReportEe16Service;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_003.RecruitmentDataEe15Service;

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_003")
public class BusinessRecruitmentDataController  extends MvcHelper {
	
	   //机构数据信息
		@Resource
		private  HRServicesRegEf11Service   hrServicesRegEf11Service;
		//业务数据信息
		@Resource
		private  BusinessReportEe16Service  businessReportEe16Service;
		//招聘数据信息
		@Resource
		private  RecruitmentDataEe15Service  recruitmentDataEe15Service;
		//综合信息
		@Resource
		private  BusinessRecruitmentEe18Service  businessRecruitmentEe18Service;
		
		/**
		 * 跳转至人力资源服务机构更改页面
		 * @param request  
		 * @return
		 */
		@RequestMapping("/toreport")
		public ModelAndView draglist(HttpServletRequest request,Model model) throws Exception {
			//跳转到人力资源服务机构登记页面的路径
			ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_003/HRServicesReport");
	        return modelAndView;
		}
		
		/**
		 * 跳转至编辑(新增)页面转回到父页面
		 * @param request   
		 * @return aab998
		 */
		@RequestMapping("/getBRDataById/{id}")   
		@ResponseBody
		public AjaxReturnMsg getDemoById(HttpServletRequest request,Ee15 model,@PathVariable String id) throws Exception {
		
			List<Ee15> list = recruitmentDataEe15Service.getEe15ById(model);
			if(list!=null && list.size()>0){
				return this.success(list.get(0));
			}else{
				return  this.error("对不起，您查询的数据不存在。");
			}
			
			
		}
		
		/**
		 * 业务报告
		 * @param request   
		 * @return aab998
		 */
		@RequestMapping("/getBRDataByAab998/{id}/{aee150}")
		@ResponseBody
		public AjaxReturnMsg getBRDataByAab998(HttpServletRequest request,Ee15 ee15,@PathVariable String id,@PathVariable String aee150) throws Exception {
			
			if(id != null ){
				
				ee15.setAee150(aee150);
				ee15.setAab998(id);
		        
		        List list3=recruitmentDataEe15Service.getEe15SingleByAab998(ee15);
		        if(list3.size() != 0 ){
		        	
		        	 List<Ee15> list = recruitmentDataEe15Service.getEe15ByAab998(ee15);
				     List<Ef11> list2= hrServicesRegEf11Service.getEf11ByAef101(id);
				     
				     list.get(0).setEf11(new ArrayList<Ef11>());
						if(list2 != null && list2.size() >0){
							list.get(0).getEf11().add(list2.get(0));
						}
						return this.success(list.get(0));	
		        }else{
		        	return this.error("该机构"+aee150+"年度未录入数据,请在业务数据录入模块增加相关数据。");
		        }
				
				
			}else{
				
				return this.error("对不起，没有找到匹配的数据。");
				
			}
			
			        
			       
		}
	      
		 
		/**
		 * 根据机构编号查询机构信息
		 * @param request
		 * @return
		 */
		@RequestMapping("/getEe15ByAef101/{id}")
		@ResponseBody
		public AjaxReturnMsg getEe15ByAef101(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
			return recruitmentDataEe15Service.getEe15ByAef101(id);
		}
		
		/**
		 * 保存
		 * @param request
		 * @param model
		 * @param ef12
		 * @param result
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/savebusinessdata")
		@ResponseBody
		public AjaxReturnMsg savedata(HttpServletRequest request,Model model,@Valid EE18 ee18,BindingResult result) throws Exception {
			//检验输入
			if (result.hasErrors()){
				return validate(result);
			}
			return businessRecruitmentEe18Service.saveData(ee18);
			
		}
		
      
		/**
		 * 保存
		 * @param request
		 * @param model
		 * @param ef12
		 * @param result
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/saveauditingbusinessdata")
		@ResponseBody
		public AjaxReturnMsg saveauditingbusinessdata(HttpServletRequest request,Model model,@Valid EE18 ee18,BindingResult result) throws Exception {
			//检验输入
			if (result.hasErrors()){
				return validate(result);
			}
			return businessRecruitmentEe18Service.saveauditingData(ee18);
			
		}
		
		
		/**
		 * 机构选择框
		 * @param request
		 * @return
		 */
		@RequestMapping("/toselect")
		public ModelAndView selectindex(HttpServletRequest request,Model model) throws Exception {
			String callback_fun_name=request.getParameter("callback_fun_name");
			ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_002/ToQueryOrganization");
	        modelAndView.addObject("callback_fun_name", callback_fun_name);
	        return modelAndView;
		}
}
