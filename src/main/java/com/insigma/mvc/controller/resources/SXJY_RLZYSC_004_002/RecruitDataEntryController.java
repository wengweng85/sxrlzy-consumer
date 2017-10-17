package com.insigma.mvc.controller.resources.SXJY_RLZYSC_004_002;

import java.util.Date;
import java.util.HashMap;

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

import com.insigma.common.util.DateUtil;
import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ee15;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_004_001.AgencyOtherDataEntryService;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_004_002.RecruitDataEntryService;

/**
 * 业务数据管理
 * @author wangc3
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_004_002")
public class RecruitDataEntryController extends MvcHelper{

	@Resource
	private RecruitDataEntryService recruitDataEntryService;
	
	@Resource
	private AgencyOtherDataEntryService agencyOtherDataEntryService;
	/**
	 * 跳转至招聘数据录入页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/torecruitdataentry")
	public ModelAndView recruitDatalist(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_002/RecruitDataEntry");
        return modelAndView;
	}
	/**
	 * 跳转至人力资源其他数据录入页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toviewother")
	public ModelAndView agencyOtherData(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_001/AgencyOtherDataEntry");
        return modelAndView;
	}
	
	/**
	 * 跳转至添加招聘数据页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toaddrecruitdata/{id}")
	public ModelAndView toAddRecruitData(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_002/AddRecruitData");
		Ef11 ef11=agencyOtherDataEntryService.getOrganizationNameById(id);
		modelAndView.addObject("ef11",ef11);
		modelAndView.addObject("aee124",DateUtil.dateToString(new Date(), "yyyyMM"));
        return modelAndView;
	}
	/**
	 * 获取招聘数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getrecruitdata")	
	@ResponseBody
	public HashMap<String,Object> getRecruitData(HttpServletRequest request,Model model,Ee15 ee15 ) throws Exception {
		return recruitDataEntryService.getRecruitData(ee15);
	}	
	/**
	 * 获取招聘数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getdata")	
	@ResponseBody
	public HashMap<String,Object> getdata(HttpServletRequest request,Model model,Ee15 ee15 ) throws Exception {
		return recruitDataEntryService.getData(ee15);
	}
	
	/**
	 * 保存
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveRecruitData")
	@ResponseBody
	public AjaxReturnMsg saveRecruitData(HttpServletRequest request,Model model,@Valid Ee15 ee15,BindingResult result) throws Exception {
		//检验输入
		if (result.hasErrors()){
			return validate(result);
		}
		return recruitDataEntryService.saveRecruitData(ee15);
		
	}
	/**
	 * 获取展示招聘数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRecruitdata/{id}/{aab998}")		
	public ModelAndView viewRecruitdata(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_002/ViewRecruitData");
        Ee15 ee15 = recruitDataEntryService.getEe15ById(id);
        modelAndView.addObject("ef11",agencyOtherDataEntryService.getOrganizationNameById(aab998));
        modelAndView.addObject("ee15",ee15);
		return modelAndView;
	}
	
	
	/**
	 * 跳转至修改页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateAdvice/{id}/{aab998}")
	public ModelAndView updatetAdvice(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_004_002/UpdateRecruitData");
	    Ee15 ee15 = recruitDataEntryService.getEe15ById(id);
		modelAndView.addObject("ee15",ee15); 
		Ef11 ef11=agencyOtherDataEntryService.getOrganizationNameById(aab998);
		modelAndView.addObject("ef11",ef11);
		modelAndView.addObject("aee124",DateUtil.dateToString(new Date(), "yyyyMM"));
        return modelAndView;
	}
	
	/**
	 * 修改招聘数据
	 */
	@RequestMapping("/updateRecruitdata")	
	@ResponseBody
	public AjaxReturnMsg updataRecruitdata(HttpServletRequest request,Model model,Ee15 ee15 ) throws Exception {
		return recruitDataEntryService.upDateAgencyData(ee15);
	}
	
}
