package com.insigma.mvc.controller.resources.SXJY_RLZYSC_007_004;

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
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_001.HRServicesRegEf11Service;

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_007_004")
public class InfoLegalServiceInquiryController extends MvcHelper{

	@Resource
	private HRServicesRegEf11Service hrServicesRegEf11Service;
	
	/**
	 * 跳转至合法服务及机构查询页面
	 * 
	 */
	@RequestMapping("/toquiry")
	public ModelAndView toquiry(HttpServletRequest request, Model model) throws Exception {
		// 跳转到人力资源服务机构登记页面的路径
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_007_004/InfoLegalServiceInquiry");
		return modelAndView;
	}
	
	/**
	 * 获取机构信息列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEf11List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ef11 ef11 ) throws Exception {
		return hrServicesRegEf11Service.getEf11List(ef11);
	}
	
	/**
	 * 跳转至详细信息页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/viewInfo/{id}/{aab998}")
	public ModelAndView todetail(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_007_004/ViewInfoLegalServiceInquiry");	
		Ef11 ef11=hrServicesRegEf11Service.getEf11ByAef(id);
		modelAndView.addObject("ef11",ef11);	
        return modelAndView;
	}
}
