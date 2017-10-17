package com.insigma.mvc.controller.resources.SXJY_RLZYSC_009_001;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.config.annotation.Reference;
import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ec12;
import com.insigma.mvc.model.Ec13;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_009_001.UserInfoManageService;
import com.insigma.mvc.utils.HRAgencyUtils;
import com.insigma.shiro.realm.SysUserUtil;


/**
 * �û���Ϣ����
 * @author pangyy
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_009_001")
public class UserInfoManageController extends MvcHelper {
	
	@Resource
	private UserInfoManageService userInfoManageService;
	
	/**
	 * �û�ע��
	 * @param request
	 * @param model
	 * @param ec12
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/registerData",method = RequestMethod.POST)
	@ResponseBody
	public AjaxReturnMsg registerData(HttpServletRequest request,Model model,@Valid Ec12 ec12,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		Ec13 ec13 = new Ec13();
		ec13.setAec104(request.getRemoteHost());//��¼IP��ַ
		return userInfoManageService.saveEc12Data(ec12,ec13);
		
	}
	
	/**
	 * ��ת�������޸�ҳ��
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/tochanagepwd")
	public ModelAndView toadd(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_009_001/HRAgencyPwdChanage");
		Ec12 ec12 = new Ec12();
		ec12.setAec101(SysUserUtil.getCurrentUser().getUsername());
		modelAndView.addObject("ec12",ec12);
        return modelAndView;
	}
	/**
	 * �����û�����ѯ���û��Ƿ����
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getUserInfoByAec101/{id}")
	@ResponseBody
	public AjaxReturnMsg getUserInfoByAec101(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		return userInfoManageService.getUserInfoByAec101(id);
	}
	
	/**
	 * ��֤ͳһ������ô����Ƿ����
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getUserInfoByAab998/{id}")
	@ResponseBody
	public AjaxReturnMsg getUserInfoByAab998(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		return userInfoManageService.getUserInfoByAab998(id);
	}
	
	/**
	 * �����û��������ѯ�û����Ƿ����
	 * @param request
	 * @param model
	 * @param id
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getHRAgencyUserPwdById/{id}/{pwd}")
	@ResponseBody
	public AjaxReturnMsg getHRAgencyUserPwdById(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String pwd) throws Exception {
		return userInfoManageService.getHRAgencyUserPwdById(id,pwd);
	}
	
	/**
	 * �޸�����
	 * @param request
	 * @param model
	 * @param ec12
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tochanagepwd",method = RequestMethod.POST)
	@ResponseBody
	public AjaxReturnMsg tochanagepwd(HttpServletRequest request,Model model,@Valid Ec12 ec12,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return userInfoManageService.chanagePwdEc12Data(ec12);
	}
	/**
	 * ��ת����������ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toresetpwd")
	public ModelAndView toresetpwd(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_009_001/HRAgencyPwdReset");
        return modelAndView;
	}
	/**
	 * ��ȡ�����û���Ϣ�б�
	 * @param request
	 * @param model
	 * @param ec12
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/getHRAgencyUserInfoList")
	@ResponseBody
	public HashMap<String,Object> getHRAgencyUserInfoList(HttpServletRequest request,Model model,Ec12 ec12) throws Exception {
		return userInfoManageService.getHRAgencyUserInfoList(ec12);
	}
	
	/**
	 * ��������
	 * @param request
	 * @param model
	 * @param ec12
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/resetpwdData")
	@ResponseBody
	public AjaxReturnMsg toresetpwd(HttpServletRequest request,Model model,Ec12 ec12,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return userInfoManageService.resetPwdEc12Data(ec12);
		
	}
	
	/**
	 * �û�������������
	 * @param request
	 * @param model
	 * @param ec12
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/batresetpwdData")
	@ResponseBody
	public AjaxReturnMsg tobatresetpwd(HttpServletRequest request,Model model,Ec12 ec12,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return userInfoManageService.batResetPwdEc12Data(ec12);
		
	}
}
