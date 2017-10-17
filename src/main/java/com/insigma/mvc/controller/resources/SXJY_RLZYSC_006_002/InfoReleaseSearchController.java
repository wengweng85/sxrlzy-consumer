package com.insigma.mvc.controller.resources.SXJY_RLZYSC_006_002;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("/resources/SXJY_RLZYSC_006_002")
public class InfoReleaseSearchController extends MvcHelper {
	
	
	@Resource
	private InfoReleaseManageService infoReleaseManageService;
	
	
	
	
	/**
	 * ��ת����Ϣ������ҳҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toview")
	public ModelAndView toview(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_002/InfoReleaseSearch");
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
	 * ��ת����ϸ��Ϣҳ��
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetail/{id}")
	public ModelAndView todetail(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_002/InfoReleaseSearchDetail");
		Ee14 ee14=infoReleaseManageService.getEe14NameById(id);
		//ͨ���ļ�ҵ���Ų�ѯ�ļ��ϴ�ҵ���
		SFileRecord sFileRecord = new SFileRecord();
		sFileRecord.setFile_bus_id(id);
		//List<SFileRecord> list=fileLoadMapper.getBusFileRecordListByBusId(sFileRecord);
		
		modelAndView.addObject("ee14",ee14);
		//modelAndView.addObject("fileList",list);
        return modelAndView;
	}
}
