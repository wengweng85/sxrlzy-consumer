package com.insigma.mvc.controller.resources.SXJY_RLZYSC_004_001;

import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.config.annotation.Reference;
import com.insigma.common.util.DateUtil;
import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ee15;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_004_001.AgencyOtherDataEntryService;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_004_002.RecruitDataEntryService;

/**
 * 业务数据管理-人力资源其他录入 
 * @author Yangml
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_004_001")
public class AgencyOtherDataEntryController extends MvcHelper{
	
	@Resource
	private AgencyOtherDataEntryService agencyOtherDataEntryService;
	
	@Resource
	private RecruitDataEntryService recruitDataEntryService;
	
	
	/**
	 * 获取招聘数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getrecruitdata")	
	@ResponseBody
	public HashMap<String,Object> getRecruitData(HttpServletRequest request,Model model,Ee15 ee15 ) throws Exception {
		return agencyOtherDataEntryService.getAgencyData(ee15);
	}
	
	/**
	 * 查看招聘数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/getrecruitdataView/{id}/{aab998}")		
	public ModelAndView getRecruitDataView(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_001/AgencyOtherDataView");
        Ee15 ee15 = agencyOtherDataEntryService.getEe15ById(id);
        modelAndView.addObject("ef11",agencyOtherDataEntryService.getOrganizationNameById(aab998));
        modelAndView.addObject("ee15",ee15);
		return modelAndView;
	}

	
	/**
	 * 跳转至添加招聘数据页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toaddrecruitdata/{id}")
	public ModelAndView toAddRecruitData(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_001/AgencyOtherDataAdd");
		Ef11 ef11=agencyOtherDataEntryService.getOrganizationNameById(id);
		modelAndView.addObject("ef11",ef11);
		modelAndView.addObject("aee124",DateUtil.dateToString(new Date(), "yyyyMM"));
        return modelAndView;
	}
	
	/**
	 * 添加招聘数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/getaddrecruitdata")	
	@ResponseBody
	public AjaxReturnMsg getaddrecruitdata(HttpServletRequest request,Model model,Ee15 ee15,BindingResult result ) throws Exception {
		//检验输入
				if (result.hasErrors()){
					return validate(result);
				}
		return agencyOtherDataEntryService.saveAddRecruitData(ee15);
	}
	
	/**
	 * 跳转至修改页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatetAdvice/{id}/{aab998}")
	public ModelAndView toupdate(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_001/AgencyOtherDataUpdate");
	    Ee15 ee15 = agencyOtherDataEntryService.getEe15ById(id);
		modelAndView.addObject("ee15",ee15); 
		Ef11 ef11=agencyOtherDataEntryService.getOrganizationNameById(aab998);
		modelAndView.addObject("ef11",ef11);
		modelAndView.addObject("aee124",DateUtil.dateToString(new Date(), "yyyyMM"));
        return modelAndView;
	}
	
	/**
	 * 修改招聘数据
	 */
	@RequestMapping("/updataRecruitdata")	
	@ResponseBody
	public AjaxReturnMsg updataRecruitdata(HttpServletRequest request,Model model,Ee15 ee15 ) throws Exception {
		return agencyOtherDataEntryService.upDateAgencyData(ee15);
	}
	
}
