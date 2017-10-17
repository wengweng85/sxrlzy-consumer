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
	
	   //����������Ϣ
		@Resource
		private  HRServicesRegEf11Service   hrServicesRegEf11Service;
		//ҵ��������Ϣ
		@Resource
		private  BusinessReportEe16Service  businessReportEe16Service;
		//��Ƹ������Ϣ
		@Resource
		private  RecruitmentDataEe15Service  recruitmentDataEe15Service;
		//�ۺ���Ϣ
		@Resource
		private  BusinessRecruitmentEe18Service  businessRecruitmentEe18Service;
		
		/**
		 * ��ת��������Դ�����������ҳ��
		 * @param request  
		 * @return
		 */
		@RequestMapping("/toreport")
		public ModelAndView draglist(HttpServletRequest request,Model model) throws Exception {
			//��ת��������Դ��������Ǽ�ҳ���·��
			ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_003/HRServicesReport");
	        return modelAndView;
		}
		
		/**
		 * ��ת���༭(����)ҳ��ת�ص���ҳ��
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
				return  this.error("�Բ�������ѯ�����ݲ����ڡ�");
			}
			
			
		}
		
		/**
		 * ҵ�񱨸�
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
		        	return this.error("�û���"+aee150+"���δ¼������,����ҵ������¼��ģ������������ݡ�");
		        }
				
				
			}else{
				
				return this.error("�Բ���û���ҵ�ƥ������ݡ�");
				
			}
			
			        
			       
		}
	      
		 
		/**
		 * ���ݻ�����Ų�ѯ������Ϣ
		 * @param request
		 * @return
		 */
		@RequestMapping("/getEe15ByAef101/{id}")
		@ResponseBody
		public AjaxReturnMsg getEe15ByAef101(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
			return recruitmentDataEe15Service.getEe15ByAef101(id);
		}
		
		/**
		 * ����
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
			//��������
			if (result.hasErrors()){
				return validate(result);
			}
			return businessRecruitmentEe18Service.saveData(ee18);
			
		}
		
      
		/**
		 * ����
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
			//��������
			if (result.hasErrors()){
				return validate(result);
			}
			return businessRecruitmentEe18Service.saveauditingData(ee18);
			
		}
		
		
		/**
		 * ����ѡ���
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
