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
 * ������Դ����ҵ�񱨸����ҳ��
 * @author xizh
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_007")
public class HRAgencyReportController extends MvcHelper {
	
	
	@Resource
	private  HRAgencyReportService hrAgencyReportService;
	
	
	/**
	 * ��ת��������Դ����ҵ�񱨸����ҳ��
	 * @return
	 */
	@RequestMapping("/toreportaudit")
	public ModelAndView dragList(HttpServletRequest request,Model model){
		/**
		 * ������Դ����ҵ�񱨸����ҳ��·��
		 */
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_001_007/HRAgencyReportAudit");
		return modelAndView;
		
	}
	
	/**
	 * ��ȡ���ҵ�������Ϣ�б�
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEf11List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ef11 ef11 ) throws Exception {
		
		return hrAgencyReportService.getEf11List(ef11);
	}
	
	/**
	 * �������ͨ��
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
	 * ��ת��������˲�ͨ��ҳ��
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
		modelAndView.setViewName("resources/SXJY_RLZYSC_001_007/HRAgencyReportFirstAuditNotPass");//����ͨ��ҳ��
        return modelAndView;
	}
	
	/**
	 * �������û��ͨ��������
	 * @param request
	 * @param model
	 * @param flag
	 * @param id
	 * @return
	 */
	@RequestMapping("/notpassupdatedata")
	@ResponseBody
	public AjaxReturnMsg saveData(HttpServletRequest request,Model model,@Valid Ef12 ef12,BindingResult result){
		       //��������
				if (result.hasErrors()){
					return validate(result);
				}
				
          return hrAgencyReportService.saveNotPassAuditData(ef12);
	}
	
	/**
	 * ��ת����ϸ��Ϣҳ��
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
		}
		return hrAgencyReportService.batAuditHRAgencyRegdata(ef12);
	}
}
