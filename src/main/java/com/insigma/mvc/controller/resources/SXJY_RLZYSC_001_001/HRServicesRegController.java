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
 * ������Դ��������Ǽ�
 * 
 * @author lin
 */

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_001")
public class HRServicesRegController extends MvcHelper {

	@Resource
	private HRServicesRegEf11Service hrServicesRegEf11Service;

	/**
	 * ��ת��������Դ��������Ǽ�ҳ��
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toreg")
	public ModelAndView draglist(HttpServletRequest request, Model model) throws Exception {
		// ��ת��������Դ��������Ǽ�ҳ���·��
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_001_001/HRServicesReg");
		return modelAndView;
	}

	/**
	 * ���»򱣴�
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/savereginfodata")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request, Model model, @Valid Ef11 ef11, BindingResult result)
			throws Exception {

		// ��������
		if (result.hasErrors()) {
			return validate(result);
		}
		
		ef11.setAae010(SysUserUtil.getCurrentUser().getCnname());//����������
		ef11.setAaf011(SysUserUtil.getCurrentUser().getGroupid());//����������
		ef11.setAae009(SysUserUtil.getCurrentUser().getGroupname());//����������

		return hrServicesRegEf11Service.saveEf11Data(ef11);

	}
	
	/**
	 * ��ת���������������Ա����ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toaddPerson")
	public ModelAndView toaddPerson(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_001/HRServiceRegPersonApplyAdd");
        return modelAndView;
	}
	
	/**
	 * ����������Ա��Ϣ����
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveEc11Data")
	@ResponseBody
	public AjaxReturnMsg<String> saveEc11Data(HttpServletRequest request,Model model,@Valid Ec11 ec11,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		
	
		return hrServicesRegEf11Service.saveEc11Data(ec11);
	}
	
	/**
	 * ��ȡ����������Ա��Ϣ�б�
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
	 * ��ת������������Ա�޸�ҳ��
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
	 * ͨ��idɾ������������Ա��Ϣ
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
	 * ����ɾ������������Ա��Ϣ
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
	 * ��ת������������Ա��ϸ��Ϣҳ��
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
