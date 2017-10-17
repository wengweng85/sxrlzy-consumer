package com.insigma.mvc.controller.resources.SXJY_RLZYSC_003_001;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.insigma.mvc.service.demo.DemoAc01Service;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_003_001.AnnouncementInformEe11Service;
import com.insigma.shiro.realm.SysUserUtil;

/**
 * ����֪ͨ
 * 
 * @author lin
 */

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_003_001")
public class AnnouncementController  extends MvcHelper{
	
	@Resource
	private AnnouncementInformEe11Service announcementInformEe11Service;
	
	
	/**
	 * ��ת����ѯҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/tonotice")
	public ModelAndView draglist(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_003_001/AnnouncementInform");
        return modelAndView;
	}
	
	/**
	 * ��ת������ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toadd")
	public ModelAndView toadd(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_003_001/AddAdvice");
        return modelAndView;
	}
	
	/**
	 * ��ת���޸�ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toupdate/{id}")
	public ModelAndView toupdate(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_003_001/EditAdvice");
	    Ee11 ee11 = announcementInformEe11Service.getEe11ById(id);
		modelAndView.addObject("ee11",ee11);  
        return modelAndView;
	}
	
	
	/**
	 * ���»򱣴�
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveEe11data")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request,Model model,@Valid Ee11 ee11,BindingResult result) throws Exception {
		//��������
		if (result.hasErrors()){
			return validate(result);
		}
		return announcementInformEe11Service.saveDemoData(ee11);
		
	}
	
   
	/**
	 * ��ת���鿴Ee11��Ϣҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toview/{id}")
	@ResponseBody
	public HashMap<String,Object> toview(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		//ModelAndView modelAndView=new ModelAndView("/WEB-INF/page/index/index.jsp");
	  //System.out.println();
		HashMap<String, Object> ee11List = announcementInformEe11Service.getEe11List(new Ee11());
		//HashMap<String,Object> map=new HashMap<String,Object>();
		//map.put("ee11",ee11);
		//modelAndView.addObject("ee11",ee11); 
        return ee11List;
	}
	

	/**
	 * ��ȡEe11��Ϣ�б�  
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEe11List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ee11 ee11 ) throws Exception {
		return announcementInformEe11Service.getEe11List(ee11);
	}
	
	/**
	 * ͨ��idɾ����ԱEe11��Ϣ
	 * @param request
	 * @param model
	 * @param eee111
	 * @return
	 */
	@RequestMapping("/deletebyid/{id}")
	@ResponseBody
	public AjaxReturnMsg deleteDemoDataById(HttpServletRequest request,Model model,@PathVariable String id){
		return announcementInformEe11Service.deleteDemoById(id);
	}
	
	/**
	 * ��ת���鿴ҳ��(�ڹ���֪ͨ����)
	 * @param request
	 * @return
	 */
	@RequestMapping("/toselect/{id}")
	@ResponseBody
	public ModelAndView toselect(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_003_001/ViewAdvice");
		Ee11 ee11 = announcementInformEe11Service.getEe11NameById(id);
		modelAndView.addObject("ee11",ee11);
		//�����ڸ�ʽת�����ַ���
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
		//���¸�ֵ����������
		modelAndView.addObject("ee11005",sdf.format(ee11.getAee105()));  
		modelAndView.addObject("ee11006",sdf.format(ee11.getAee106())); 
        return modelAndView;
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
	public AjaxReturnMsg batDeleteDemodata(HttpServletRequest request,Model model,Ee11 ee11){
		return announcementInformEe11Service.batDeleteDemoData(ee11);
	}
	
	
	/**
	 * ��ת���������ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/tomanager")
	public ModelAndView tomanager(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_003_001/AnnouncementManagement");
		//���µ�ǰ�û�Ȩ��
		SysUserUtil.updateCurrentUserPerms();
        return modelAndView;
	}
}
