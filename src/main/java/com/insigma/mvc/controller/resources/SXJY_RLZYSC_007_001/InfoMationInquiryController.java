package com.insigma.mvc.controller.resources.SXJY_RLZYSC_007_001;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.config.annotation.Reference;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_001.HRServicesRegEf11Service;

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_007_001")
public class InfoMationInquiryController extends MvcHelper{

	@Resource
	private HRServicesRegEf11Service hrServicesRegEf11Service;
	
	/**
	 * ��ת���Ϸ����񼰻�����ѯҳ��
	 * 
	 */
	@RequestMapping("/toquery")
	public ModelAndView toquiry(HttpServletRequest request, Model model) throws Exception {
		// ��ת��������Դ��������Ǽ�ҳ���·��
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_007_001/InfoMationInquiry");
		return modelAndView;
	}
	
	/**
	 * ��ȡ������Ϣ�б�
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEf11List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ef11 ef11 ) throws Exception {
		return hrServicesRegEf11Service.getEf11List(ef11);
	}
	
	/**
	 * ��ת����ϸ��Ϣҳ��
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/viewInfomation/{id}/{aab998}")
	public ModelAndView viewInfomation(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_007_001/ViewInfoMation");	
		Ef11 ef11=hrServicesRegEf11Service.getEf11ByAef(id);
		modelAndView.addObject("ef11",ef11);	
        return modelAndView;
	}
}
