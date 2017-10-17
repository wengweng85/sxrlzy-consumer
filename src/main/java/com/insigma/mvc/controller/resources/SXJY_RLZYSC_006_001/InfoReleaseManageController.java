package com.insigma.mvc.controller.resources.SXJY_RLZYSC_006_001;


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
import com.insigma.mvc.model.Ee14;
import com.insigma.mvc.model.SFileRecord;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_006_001.InfoReleaseManageService;


/**
 * ��Ϣ��������
 * @author pangyy
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_006_001")
public class InfoReleaseManageController extends MvcHelper {
	
	
	@Resource
	private InfoReleaseManageService infoReleaseManageService;
	
	
	
	
	/**
	 * ��ת����Ϣ������ҳҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toview")
	public ModelAndView toview(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_001/InfoReleaseManage");
        return modelAndView;
	}
	
	/**
	 * ��ת����Ϣ������ҳҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toview4")
	public ModelAndView tosee(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_001/StatisticalForm");
        return modelAndView;
	}
	
	/**
	 * ��ȡ���з�����Ϣ�б�
	 * @param request
	 * @param model
	 * @param ee14
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/getEe14List")
	@ResponseBody
	public HashMap<String,Object> getEe14List(HttpServletRequest request,Model model,Ee14 ee14 ) throws Exception {
		return infoReleaseManageService.getEe14List(ee14);
	}
	/**
	 * ��ת����Ϣ��������ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toadd")
	public ModelAndView toadd(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_001/InfoReleaseManageAdd");
        return modelAndView;
	}
	
	/**
	 * ����
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveData")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request,Model model,@Valid Ee14 ee14,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return infoReleaseManageService.saveEe14Data(ee14);
		
	}
	/**
	 * ��ת����ϸ��Ϣҳ��
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetail/{id}")
	public ModelAndView todetail(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_001/InfoReleaseManageDetail");
		Ee14 ee14=infoReleaseManageService.getEe14NameById(id);
		//ͨ���ļ�ҵ���Ų�ѯ�ļ��ϴ�ҵ���
		SFileRecord sFileRecord = new SFileRecord();
		sFileRecord.setFile_bus_id(id);
		//List<SFileRecord> list=fileLoadMapper.getBusFileRecordListByBusId(sFileRecord);
		
		modelAndView.addObject("ee14",ee14);
		//modelAndView.addObject("fileList",list);
        return modelAndView;
	}
	
	/**
	 * ��ת���޸�ҳ��
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_001/InfoReleaseManageEdit");
		Ee14 ee14=infoReleaseManageService.getEe14ById(id);
		modelAndView.addObject("ee14",ee14);
        return modelAndView;
	}
	
	/**
	 * ͨ��idɾ���Ѿ�������Ϣ
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	 
	@RequestMapping("/deletebyid/{id}")
	@ResponseBody
	public AjaxReturnMsg deleteReleaseInfoById(HttpServletRequest request,Model model,@PathVariable String id){
		return infoReleaseManageService.deleteReleaseInfoById(id);
	}

	/**
	 * ����ɾ��
	 * @param request
	 * @param model
	 * @param aac001
	 * @return
	 */
	@RequestMapping("/batdelete")
	@ResponseBody
	public AjaxReturnMsg<String> batDeleteReleasedata(HttpServletRequest request,Model model,Ee14 ee14){
		return infoReleaseManageService.batDeleteReleasedata(ee14);
	}
}
