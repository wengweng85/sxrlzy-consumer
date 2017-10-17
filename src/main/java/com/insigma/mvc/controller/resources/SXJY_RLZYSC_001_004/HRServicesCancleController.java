package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_004;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_001.HRServicesRegEf11Service;

/**
 * ������Դ�������ע��
 * @author lin
 * */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_004")
public class HRServicesCancleController extends MvcHelper{

	@Resource
	private HRServicesRegEf11Service hrServicesRegEf11Service;
	/**
	 * ��ת��������Դ�����������ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/tocancel")
	public ModelAndView draglist(HttpServletRequest request,Model model) throws Exception {
		//��ת��������Դ�������ע��ҳ���·��
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_004/HRServicesCancle");
        return modelAndView;
	}
	
	/**
	 * ע��
	 * @param request
	 * @return
	 */
	@RequestMapping("/cancleinfodata")
	@ResponseBody
	public AjaxReturnMsg canceldata(HttpServletRequest request,Model model,@Valid Ef11 ef11,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return hrServicesRegEf11Service.cancelEf11Data(ef11);
		
	}
	

}
