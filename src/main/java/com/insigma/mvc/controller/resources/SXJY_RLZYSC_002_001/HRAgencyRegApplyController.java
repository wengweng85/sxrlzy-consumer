package com.insigma.mvc.controller.resources.SXJY_RLZYSC_002_001;


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
import com.insigma.mvc.model.EF11_DECLARE;
import com.insigma.mvc.model.Ec11;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_002_001.HRAgencyApplyService;


/**
 * 人力资源服务机构申请
 * @author pangyy
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_002_001")
public class HRAgencyRegApplyController extends MvcHelper {
	
	
	@Resource
	private HRAgencyApplyService hrAgencyApplyService;
	
	
	
	/**
	 * 根据统一社会信用代码查询机构信息--申报表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getHRAgencyDeclareInfoById/{id}")
	@ResponseBody
	public AjaxReturnMsg getHRAgencyDeclareInfoById(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		return hrAgencyApplyService.getHRAgencyDeclareInfoById(id);
	}

	/**
	 * 根据统一社会信用代码查询机构信息--基础库
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAgencyInfoByAab998/{id}")
	@ResponseBody
	public AjaxReturnMsg getAgencyInfoByAab998(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		return hrAgencyApplyService.getAgencyInfoByAab998(id);
	}
	
	/**
	 * 根据统一社会信用代码查询机构信息--EF11
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAgencyEf11InfoByAab998/{id}")
	@ResponseBody
	public AjaxReturnMsg getAgencyEf11InfoByAab998(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		return hrAgencyApplyService.getAgencyEf11InfoByAab998(id);
	}
	
	/**
	 * 跳转至新增页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toreg")
	public ModelAndView toreg(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_002_001/HRAgencyRegApply");
        return modelAndView;
	}
	
	/**
	 * 跳转至新增页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toreport")
	public ModelAndView toreport(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_002_003/HRAgencyReportApply");
        return modelAndView;
	}
	/**
	 * 跳转至编辑页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toedit")
	public ModelAndView toEdit(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_002_002/HRAgencyEditApply");
        return modelAndView;
	}
	
	/**
	 * 跳转至注销页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tocancel")
	public ModelAndView toCancel(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_002_004/HRAgencyCancelApply");
        return modelAndView;
	}
	
	/**
	 * 根据机构编号查询机构信息---验证机构是否审核通过
	 * @param request
	 * @return
	 */
	@RequestMapping("/getHRAgencyChangeById/{id}")
	@ResponseBody
	public AjaxReturnMsg getDemoById(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		return hrAgencyApplyService.getHRAgencyChangeById(id);
	}
	
	
	/**
	 * 保存
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveData")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request,Model model,@Valid EF11_DECLARE ef11_declare,BindingResult result) throws Exception {
		//检验输入
		if (result.hasErrors()){
			return validate(result);
		}
		ef11_declare.setSelectnodes(request.getParameter("selectnodes"));
		return hrAgencyApplyService.saveEf11Data(ef11_declare);
	}

	/**
	 * 注销
	 * @param request
	 * @return
	 */
	@RequestMapping("/cancelData")
	@ResponseBody
	public AjaxReturnMsg canceldata(HttpServletRequest request,Model model,@Valid Ef11 ef11,BindingResult result) throws Exception {
		//检验输入
		if (result.hasErrors()){
			return validate(result);
		}
		return hrAgencyApplyService.cancelEf11Data(ef11);
	}
	
	/**
	 * 获取机构工作人员信息列表
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/getEc11List")
	@ResponseBody
	public HashMap<String,Object> getEc11List(HttpServletRequest request,Model model,Ec11 ec11 ) throws Exception {
		return hrAgencyApplyService.getEc11List(ec11);
	}
	
	/**
	 * 跳转至服务机构工作人员新增页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toaddPerson")
	public ModelAndView toaddPerson(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_002_001/HRAgencyRegPersonApplyAdd");
        return modelAndView;
	}
	/**
	 * 机构工作人员信息保存
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveEc11Data")
	@ResponseBody
	public AjaxReturnMsg<String> saveEc11Data(HttpServletRequest request,Model model,@Valid Ec11 ec11,BindingResult result) throws Exception {
		//检验输入
		if (result.hasErrors()){
			return validate(result);
		}
		return hrAgencyApplyService.saveEc11Data(ec11);
	}
	
	/**
	 * 跳转至机构工作人员修改页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toeditPerson/{id}/{index}")
	public ModelAndView toedit(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String index) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_002_001/HRAgencyRegPersonApplyEdit");
		Ec11 ec11=hrAgencyApplyService.getEc11ById(id);
		modelAndView.addObject("ec11",ec11);
		modelAndView.addObject("index",index);
        return modelAndView;
	}
	
	/**
	 * 通过id删除机构工作人员信息
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	 
	@RequestMapping("/deletePerson/{id}")
	@ResponseBody
	public AjaxReturnMsg deletePerson(HttpServletRequest request,Model model,@PathVariable String id){
		return hrAgencyApplyService.deleteAagencyPersonByEec111(id);
	}

	/**
	 * 批量删除机构工作人员信息
	 * @param request
	 * @param model
	 * @param aac001
	 * @return
	 */
	@RequestMapping("/batdeletePerson")
	@ResponseBody
	public AjaxReturnMsg<String> batdeletePerson(HttpServletRequest request,Model model,Ec11 ec11){
		return hrAgencyApplyService.batDeleteAgencyPersonInfo(ec11);
	}
	
	/**
	 * 跳转至机构工作人员详细信息页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetailPerson/{id}")
	public ModelAndView todetailPerson(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_002_001/HRAgencyRegPersonApplyDetail");
		Ec11 ec11=hrAgencyApplyService.getEc11NameById(id);
		modelAndView.addObject("ec11",ec11);
        return modelAndView;
	}
}
