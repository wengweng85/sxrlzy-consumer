package com.insigma.mvc.controller.resources.SXJY_RLZYSC_007_003;

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
import com.insigma.mvc.model.EE18;
import com.insigma.mvc.model.Ee17;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_006_003.OpinionSuggetionEe17Service;

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_007_003")
public class InfoSuggetionQueryController extends MvcHelper{
	
	@Resource
	private OpinionSuggetionEe17Service opinionSuggetionEe17Service;

	/**
	 * ��ת�����������������Ѱҳ��
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/select")
	public ModelAndView opinion(HttpServletRequest request, Model model) throws Exception {
		// ��ת����������������ҳ���·��
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_006_003/OpinionSuggetionSelect");
		return modelAndView;
	}
	
	/**
	 * ���ݱ����ѯ���
	 */
	@RequestMapping("/selectByHui") 
	@ResponseBody
	public HashMap<String, Object> selectByHui(HttpServletRequest request,Model model,Ee17 ee17 )throws Exception{
		return opinionSuggetionEe17Service.selectHui(ee17);
	}
	/**
	 * ��ȡչʾ��Ƹ�����б�
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewSelectOpinion/{id}/{aab998}")		
	public ModelAndView viewSelectOpinion(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_007_003/ViewSelectOpinion");
        Ee17 ee17 = opinionSuggetionEe17Service.getEe17ByIdOpin(id);
//        modelAndView.addObject("ef11",agencyOtherDataEntryService.getOrganizationNameById(aab998));
        modelAndView.addObject("ee17",ee17);
		return modelAndView;
	}
}
