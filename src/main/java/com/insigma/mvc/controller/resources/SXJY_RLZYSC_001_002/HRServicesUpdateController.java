package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_002;

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
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_001.HRServicesRegEf11Service;

/**
 * 人力资源服务机构变更
 * @author lin
 * */

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_002")
public class HRServicesUpdateController extends MvcHelper{
	
	@Resource
	private HRServicesRegEf11Service hrServicesRegEf11Service;
	
	/**
	 * 跳转至人力资源服务机构更改页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toupdate")
	public ModelAndView draglist(HttpServletRequest request,Model model) throws Exception {
		//跳转到人力资源服务机构登记页面的路径
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_002/HRServicesUpdate");
        return modelAndView;
	}
	
	/**
	 * 机构选择框
	 * @param request
	 * @return
	 */
	@RequestMapping("/toselect")
	public ModelAndView selectindex(HttpServletRequest request,Model model) throws Exception {
		String callback_fun_name=request.getParameter("callback_fun_name");
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_002/ToQueryOrganization");
        modelAndView.addObject("callback_fun_name", callback_fun_name);
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
	 * 跳转至编辑(新增)页面转回到父页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEf11ById/{id}")
	@ResponseBody
	public AjaxReturnMsg getDemoById(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		return this.success(hrServicesRegEf11Service.getEf11ById(id));
	}
	
	/**
	 * 页面的方法——更新或保存
	 * @param request
	 * @return
	 */
	@RequestMapping("/editData")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request,Model model,@Valid Ef11 ef11,BindingResult result) throws Exception {
		//检验输入
				if (result.hasErrors()){
					return validate(result);
				}
		return hrServicesRegEf11Service.editHRServicesRegData(ef11);
		
	}

}
