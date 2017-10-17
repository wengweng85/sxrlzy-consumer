package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_005;

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
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.model.Ef12;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_005.HRAgencyRegAuditService;
import com.insigma.mvc.utils.HRAgencyUtils;


/**
 * ������Դ������������������
 * @author pangyy
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_005")
public class HRAgencyRegAuditController extends MvcHelper {
	
	
	@Resource
	private HRAgencyRegAuditService hrAgencyRegAuditService;
	
	/**
	 * ��ȡ������Ϣ�б�
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/getEf11List",params="flag")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ef11 ef11 ) throws Exception {
		String flag = request.getParameter("flag");//�༶��������ʶ
		if("1".equals(flag)){//һ�����
			ef11.setAef133(HRAgencyUtils.AEF133_1);
		}else if("2".equals(flag)){//�������
			ef11.setAef133(HRAgencyUtils.AEF133_2);
		}else {//�������
			ef11.setAef133(HRAgencyUtils.AEF133_3);
		}
		request.setAttribute("flag", flag);
		return hrAgencyRegAuditService.getEf11List(ef11);
	}
	
	/**
	 * �������ͨ��
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping(value="/bataudit",params="flag")
	@ResponseBody
	public AjaxReturnMsg batAuditHRAgencyRegdata(HttpServletRequest request,Model model,Ef12 ef12){
		String flag = request.getParameter("flag");//�༶��������ʶ
		if("1".equals(flag)){//һ�����
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}else if("2".equals(flag)){//�������
			ef12.setAef133(HRAgencyUtils.AEF133_2);
		}else {//�������
			ef12.setAef133(HRAgencyUtils.AEF133_3);
		}
		return hrAgencyRegAuditService.batAuditHRAgencyRegdata(ef12);
	}
	
	/**
	 * �������ͨ��
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping(value="/singleaudit",params="flag")
	@ResponseBody
	public AjaxReturnMsg singleAuditHRAgencyRegdata(HttpServletRequest request,Model model,Ef12 ef12){
		String flag = request.getParameter("flag");//�༶��������ʶ
		if("1".equals(flag)){//һ�����
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}else if("2".equals(flag)){//�������
			ef12.setAef133(HRAgencyUtils.AEF133_2);
		}else {//�������
			ef12.setAef133(HRAgencyUtils.AEF133_3);
		}
		return hrAgencyRegAuditService.singleAuditHRAgencyRegdata(ef12);
	}
	
	/**
	 * ��ת�������ѯҳ��
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/tofirstaudit")
	public ModelAndView tofirstaudit(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_005/HRAgencyRegAuditFirst");
        return modelAndView;
	}
	
	/**
	 * ��ת�������ѯҳ��
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/tosecondaudit")
	public ModelAndView tosecondaudit(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_005/HRAgencyRegAuditSecond");
        return modelAndView;
	}
	
	/**
	 * ��ת�������ѯҳ��
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/tothreeaudit")
	public ModelAndView tothreeaudit(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_005/HRAgencyRegAuditThree");
        return modelAndView;
	}
	
	/**
	 * ��ת����ϸ��Ϣҳ��
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetail/{id}/{aef101}")
	public ModelAndView toedit(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aef101) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_005/HRAgencyRegAuditDetail");
		Ef11 ef11=hrAgencyRegAuditService.getEf11ById(id);
		if(ef11!=null){
			modelAndView.addObject("ef11",ef11);
		}else {
			EF11_DECLARE ef11_declare=hrAgencyRegAuditService.getEf11DeclareByAef101(id);
			modelAndView.addObject("ef11",ef11_declare);
		}
        return modelAndView;
	}
	/**
	 * ��ת��������˲�ͨ��ҳ��
	 * @param request
	 * @param model
	 * @param flag
	 * @param id
	 * @return
	 */
	@RequestMapping("/notauditpass/{flag}/{id}")
	public ModelAndView notAuditPassDataById(HttpServletRequest request,Model model,@PathVariable String flag,@PathVariable String id){
		ModelAndView modelAndView=new ModelAndView();
		Ef11 ef11=hrAgencyRegAuditService.getEf11InfoById(id, flag);
		modelAndView.addObject("ef11",ef11);  
		if(("1").equals(flag)){
			modelAndView.setViewName("resources/SXJY_RLZYSC_001_005/HRAgencyRegFirstAuditNotPass");//����ͨ��ҳ��
		}else if(("2").equals(flag)){
			modelAndView.setViewName("resources/SXJY_RLZYSC_001_005/HRAgencyRegSecondAuditNotPass");//����ͨ��ҳ��
		}else {
			modelAndView.setViewName("resources/SXJY_RLZYSC_001_005/HRAgencyRegThreeAuditNotPass");//����ͨ��ҳ��
		}
        return modelAndView;
	}
	/**
	 * ����
	 * @param request
	 * @param model
	 * @param ef12
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/notpassupdatedata",params="flag")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request,Model model,@Valid Ef12 ef12,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		String flag = request.getParameter("flag");//�༶��������ʶ
		if("1".equals(flag)){//һ�����
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}else if("2".equals(flag)){//�������
			ef12.setAef133(HRAgencyUtils.AEF133_2);
		}else {//�������
			ef12.setAef133(HRAgencyUtils.AEF133_3);
		}
		return hrAgencyRegAuditService.saveNotPassAuditData(ef12);
		
	}
	
}
