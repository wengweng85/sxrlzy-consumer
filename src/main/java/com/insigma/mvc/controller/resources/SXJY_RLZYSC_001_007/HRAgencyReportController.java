package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_007;

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

import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.EE18;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.model.Ef12;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_007.HRAgencyReportService;
import com.insigma.mvc.utils.HRAgencyUtils;


/**
 * 人力资源机构业务报告审核页面
 * @author xizh
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_007")
public class HRAgencyReportController extends MvcHelper {
	
	
	@Resource
	private  HRAgencyReportService hrAgencyReportService;
	
	
	/**
	 * 跳转至人力资源机构业务报告审核页面
	 * @return
	 */
	@RequestMapping("/toreportaudit")
	public ModelAndView dragList(HttpServletRequest request,Model model){
		/**
		 * 人力资源机构业务报告审核页面路径
		 */
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_001_007/HRAgencyReportAudit");
		return modelAndView;
		
	}
	
	/**
	 * 获取变更业务机构信息列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEf11List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ef11 ef11 ) throws Exception {
		
		return hrAgencyReportService.getEf11List(ef11);
	}
	
	/**
	 * 单个审核通过
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping("/singleaudit")
	@ResponseBody
	public AjaxReturnMsg singleAuditHRAgencyReportdata(HttpServletRequest request,Model model,Ef12 ef12){
		
		return hrAgencyReportService.singleAuditHRAgencyReportdata(ef12);
	}
	
	/**
	 * 跳转至机构审核不通过页面
	 * @param request
	 * @param model
	 * @param flag
	 * @param id
	 * @return
	 */
	@RequestMapping("/notauditpass/{id}")
	public ModelAndView notAuditPassDataById(HttpServletRequest request,Model model,@PathVariable String id){
		ModelAndView modelAndView=new ModelAndView();
		Ef11 ef11=hrAgencyReportService.getEf11InfoById(id);
		modelAndView.addObject("ef11",ef11);  
		modelAndView.setViewName("resources/SXJY_RLZYSC_001_007/HRAgencyReportFirstAuditNotPass");//初审不通过页面
        return modelAndView;
	}
	
	/**
	 * 保存审核没有通过的数据
	 * @param request
	 * @param model
	 * @param flag
	 * @param id
	 * @return
	 */
	@RequestMapping("/notpassupdatedata")
	@ResponseBody
	public AjaxReturnMsg saveData(HttpServletRequest request,Model model,@Valid Ef12 ef12,BindingResult result){
		       //检验输入
				if (result.hasErrors()){
					return validate(result);
				}
				
          return hrAgencyReportService.saveNotPassAuditData(ef12);
	}
	
	/**
	 * 跳转至详细信息页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetail/{id}/{aee150}")
	public ModelAndView toedit(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aee150) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_007/HRAgencyReportDetail");
		EE18 ee18_  = new EE18();
		ee18_.setAab998(id);
		ee18_.setAee150("2017");
		EE18 ee18=hrAgencyReportService.getEf11Ee18Info(ee18_);
		if(ee18!=null){
			modelAndView.addObject("ef11",ee18);
			modelAndView.addObject("aef104","123456789");
	    }
		return modelAndView;
	
}
	
	
	/**
	 * 批量审核通过
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping(value="/bataudit",params="flag")
	@ResponseBody
	public AjaxReturnMsg batAuditHRAgencyRegdata(HttpServletRequest request,Model model,Ef12 ef12){
		String flag = request.getParameter("flag");//多级审核请求标识
		if("1".equals(flag)){//一级审核
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}
		return hrAgencyReportService.batAuditHRAgencyRegdata(ef12);
	}
}
