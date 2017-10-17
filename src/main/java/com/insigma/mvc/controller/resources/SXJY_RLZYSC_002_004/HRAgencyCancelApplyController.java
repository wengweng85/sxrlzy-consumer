package com.insigma.mvc.controller.resources.SXJY_RLZYSC_002_004;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_002_001.HRAgencyApplyService;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_002_004.HRAgencyCancelApplyService;
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_002_004")
public class HRAgencyCancelApplyController extends MvcHelper {
	
	@Resource
	private  HRAgencyCancelApplyService hrAgencyCancelApplyService;
	
	/**
	 * ◊¢œ˙
	 * @param request
	 * @return
	 */
	@RequestMapping("/cancelData")
	@ResponseBody
	public AjaxReturnMsg canceldata(HttpServletRequest request,Model model,@Valid Ef11 ef11,BindingResult result) throws Exception {
		//ºÏ—È ‰»Î
		if (result.hasErrors()){
			return validate(result);
		}
		return hrAgencyCancelApplyService.cancelEf11Data(ef11);
	}
	

}
