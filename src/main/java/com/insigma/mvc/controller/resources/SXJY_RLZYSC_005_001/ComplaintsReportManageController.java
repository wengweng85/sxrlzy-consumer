package com.insigma.mvc.controller.resources.SXJY_RLZYSC_005_001;

import java.text.SimpleDateFormat;
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

import com.alibaba.dubbo.config.annotation.Reference;
import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ac01;
import com.insigma.mvc.model.Ee11;
import com.insigma.mvc.model.Ee13;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_005_001.ComplaintsReportManageService;
import com.insigma.mvc.utils.HRAgencyUtils;
import com.insigma.shiro.realm.SysUserUtil;
/**
 * Ͷ�߾ٱ�����
 * @author lin
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_005_001")
public class ComplaintsReportManageController  extends MvcHelper<Ee13>{
	
	@Resource
	private  ComplaintsReportManageService  complaintsReportManageService;
	
	/**
	 * ��ת��Ͷ�߾ٱ�����ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toreport")
	public ModelAndView toreport(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_005_001/ComplaintsReportManage");
        return modelAndView;
	}
	
	/**
	 * ��ת��Ͷ�߾ٱ�����ҳ��
	 * @param request
	 * @return  
	 */
	@RequestMapping("/tohandle")
	public ModelAndView tohandle(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_005_001/ReportAndComplaintHandling");
		//���µ�ǰ�û�Ȩ��
		SysUserUtil.updateCurrentUserPerms();
        return modelAndView;
	}
	/**
	 * ��ת��Ͷ�߾ٱ�������ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toadd/{id}")
	public ModelAndView toadd(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		 ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_005_001/ReportAndComplaintHandlingChild");
		 Ee13 ee13 = complaintsReportManageService.getEe13ById(id);
		 modelAndView.addObject("ee13",ee13); 
			//�����ڸ�ʽת�����ַ���
		 SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
		 modelAndView.addObject("aee116",sdf.format(ee13.getAae036())); 
	     return modelAndView;
	}
	
	/**
	 * ��ת��������ʷ��Ϣҳ��
	 * @param request 
	 * @return
	 */
	@RequestMapping("/toview")
	public ModelAndView toviewhistoryinfo(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_005_001/ViewComplaintsInfo");
        return modelAndView;
	}
	
	/**
	 * ��ת���鿴ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toselect/{id}")
	public ModelAndView tosee(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_005_001/ViewComplaintsInfoChild");
	    Ee13 ee13 = complaintsReportManageService.getEe13NameById(id);
	    modelAndView.addObject("ee13",ee13); 
        return modelAndView;
	}
	/**
	 * ���»򱣴�
	 * @param request getEe13ByPhone
	 * @return
	 */
	@RequestMapping("/saveEe13data")
	@ResponseBody
	public AjaxReturnMsg<String> saveEe13data(HttpServletRequest request,Model model,@Valid Ee13 ee13,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return complaintsReportManageService.saveEe13Data(ee13);
		
	}
	/**
	 * ע��
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateEe13data")
	@ResponseBody
	public AjaxReturnMsg updateEe13data(HttpServletRequest request,Model model,@Valid Ee13 ee13,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return complaintsReportManageService.updateEe13data(ee13);
		
	}
	/**
	 * ��ȡͶ����Ϣ�б�
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEe13List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ee13 ee13 ) throws Exception {
		
		return complaintsReportManageService.getEe13List(ee13);
	}
	
	
	@RequestMapping("/getEe13ByPhone")
	@ResponseBody
    public HashMap<String,Object> getEe13ByPhone(HttpServletRequest request,Model model,Ee13 ee13 ) throws Exception {
			
			return complaintsReportManageService.getEe13ByPhone(ee13);
		}
		
	/**
	 * ����ɾ��
	 * @param request
	 * @param model
	 * @param eee131
	 * @return
	 */
	@RequestMapping("/batdelete")
	@ResponseBody
	public AjaxReturnMsg<String> batDeleteDemodata(HttpServletRequest request,Model model,Ee13 ee13){
		return complaintsReportManageService.batDeleteEe13Data(ee13);
	}

	/**
	 * ɾ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletebyid/{id}")
	@ResponseBody
	public AjaxReturnMsg canceldata(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		
		return complaintsReportManageService.deleteEe13ById(id);
		
	}
	
	
}
