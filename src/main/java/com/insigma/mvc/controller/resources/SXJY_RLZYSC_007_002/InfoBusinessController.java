package com.insigma.mvc.controller.resources.SXJY_RLZYSC_007_002;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.EE18;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_004_001.AgencyOtherDataEntryService;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_007_002.InfoBusinessEE18Service;

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_007_002")
public class InfoBusinessController extends MvcHelper{
	
	@Resource
	private InfoBusinessEE18Service infoBusinessEE18Service;
	@Resource
	private AgencyOtherDataEntryService agencyOtherDataEntryService;

	/**
	 * 跳转至人力资源业务信息查询页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toSelect")
	public ModelAndView recruitDatalist(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_007_002/InfoBusiness");
        return modelAndView;
	}
	
	/**
	 * 获取人力资源业务信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/getrecruitdata")	
	@ResponseBody
	public HashMap<String,Object> getRecruitData(HttpServletRequest request,Model model,EE18 ee18 ) throws Exception {
		return infoBusinessEE18Service.getRecruitData(ee18);
	}
	
	/**
	 * 获取展示招聘数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewInfoBusinessdata/{id}/{aab998}")		
	public ModelAndView viewRecruitdata(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_007_002/InfoBusinessView");
        EE18 ee18 = infoBusinessEE18Service.getEe18ById(id);
//        modelAndView.addObject("ef11",agencyOtherDataEntryService.getOrganizationNameById(aab998));
        modelAndView.addObject("ee18",ee18);
		return modelAndView;
	}
}
