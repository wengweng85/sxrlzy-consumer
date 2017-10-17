package com.insigma.mvc.controller.resources.SXJY_RLZYSC_002_002;

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
import com.insigma.mvc.service.resources.SXJY_RLZYSC_002_002.HRAgencyEditApplyService;

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_002_002")
public class HRAgencyEditApplyController  extends MvcHelper  {
	
	@Resource
	private HRAgencyEditApplyService hrAgencyEditApplyService;
	
	/**
	 * 更新
	 * @param request
	 * @return
	 */
	@RequestMapping("/editData")
	@ResponseBody
	public AjaxReturnMsg editdata(HttpServletRequest request,Model model,@Valid Ef11 ef11,BindingResult result) throws Exception {
		//检验输入
		if (result.hasErrors()){
			return validate(result);
		}
		return hrAgencyEditApplyService.editEf11Data(ef11);
	}

}
