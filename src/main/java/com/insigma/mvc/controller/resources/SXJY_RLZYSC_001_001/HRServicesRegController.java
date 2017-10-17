package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_001;

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
import com.insigma.mvc.model.Ec11;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_001.HRServicesRegEf11Service;
import com.insigma.shiro.realm.SysUserUtil;

/**
 * 人力资源服务机构登记
 * 
 * @author lin
 */

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_001")
public class HRServicesRegController extends MvcHelper {

	@Resource
	private HRServicesRegEf11Service hrServicesRegEf11Service;

	/**
	 * 跳转至人力资源服务机构登记页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toreg")
	public ModelAndView draglist(HttpServletRequest request, Model model) throws Exception {
		// 跳转到人力资源服务机构登记页面的路径
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_001_001/HRServicesReg");
		return modelAndView;
	}

	/**
	 * 更新或保存
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/savereginfodata")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request, Model model, @Valid Ef11 ef11, BindingResult result)
			throws Exception {

		// 检验输入
		if (result.hasErrors()) {
			return validate(result);
		}
		
		ef11.setAae010(SysUserUtil.getCurrentUser().getCnname());//经办人姓名
		ef11.setAaf011(SysUserUtil.getCurrentUser().getGroupid());//经办机构编号
		ef11.setAae009(SysUserUtil.getCurrentUser().getGroupname());//经办机构编号

		return hrServicesRegEf11Service.saveEf11Data(ef11);

	}
	
	/**
	 * 跳转至服务机构工作人员新增页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toaddPerson")
	public ModelAndView toaddPerson(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_001/HRServiceRegPersonApplyAdd");
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
		
	
		return hrServicesRegEf11Service.saveEc11Data(ec11);
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
		return hrServicesRegEf11Service.getEc11List(ec11);
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
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_001/HRServiceRegPersonApplyEdit");
		Ec11 ec11=hrServicesRegEf11Service.getEc11ById(id);
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
		return hrServicesRegEf11Service.deleteAagencyPersonByEec111(id);
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
		return hrServicesRegEf11Service.batDeleteAgencyPersonInfo(ec11);
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
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_001/HRServiceRegPersonApplyDetail");
		Ec11 ec11=hrServicesRegEf11Service.getEc11NameById(id);
		modelAndView.addObject("ec11",ec11);
        return modelAndView;
	}
	
}
