package com.insigma.mvc.controller.resources.SXJY_RLZYSC_003_002;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
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
import com.insigma.mvc.model.CodeValue;
import com.insigma.mvc.model.Ee11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_003_001.AnnouncementInformEe11Service;
import com.insigma.resolver.AppException;
import com.insigma.shiro.realm.SysUserUtil;

/**
 * ����֪ͨ
 * 
 * @author lin
 */

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_003_002")
public class NewAnnouncementController  extends MvcHelper{
	
	@Resource
	private AnnouncementInformEe11Service announcementInformEe11Service;
	
	
	/**
	 * (�������)��ת����ѯҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toquery")
	public ModelAndView draglist(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_003_002/AdministrationQueryMag");
        return modelAndView;
	}
	
	/**
	 * ��ת������ҳ��(��ͨ����)
	 * @param request
	 * @return
	 */
	@RequestMapping("/toadd")
	public ModelAndView toadd(HttpServletRequest request,Model model) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_003_002/NewOfficialNotice");
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
	 *codevalue ������
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws com.insigma.resolver.AppException
	 */
	@RequestMapping("/treedata")
	@ResponseBody
	public List<CodeValue>  treedata(HttpServletRequest request, HttpServletResponse response) throws AppException {
		String id=request.getParameter("id");
		//������������
		String code="00";
		//�Ƿ񸸽ڵ�
		String isparent="true";  
		if(StringUtils.isEmpty(id)){
			//idΪ�գ�ȥ��ѯ����ʡ
			id="610000"; 
		}else{
			code=id;
			String sub1= id.substring(2,4);
			String sub2= id.substring(4,6);
			if(!sub1.equals("00") && sub2.equals("00")){
				//����λ���ڣ�ʡ�д��ڣ�ȥ��ѯ����
				id="61"+sub1+"__";
			}else if(!sub2.equals("00")){
				isparent="false";
				//����λ���ڣ�ʡ���ض����ڣ�ȥ��ѯ����
			}else if(sub1.equals("00") && sub2.equals("00")){
				//��ѯ�м�
				id="61"+"__00";
			}  
		}
		CodeValue codevalue=new CodeValue();
		codevalue.setId(code);
		codevalue.setCode_value(id);
		List<CodeValue> codeValueTree = new ArrayList<CodeValue>();
		if(isparent.equals("true")){
			codeValueTree = announcementInformEe11Service.getCodeValueTree(codevalue);
		}else{
			codeValueTree = announcementInformEe11Service.getAllGroupList(codevalue);
		}
		for (CodeValue codeValue2 : codeValueTree) {
			codeValue2.setIsParent(isparent);
		}
		return codeValueTree;
	}
	
	/**
	 * �ӻ����л�ȡ����ֵ
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws com.insigma.resolver.AppException
	 */
	@RequestMapping(value = "/getCodeValueFromCache")
	@ResponseBody
	public HashMap<String,List<CodeValue>> getCodeValueFromCache(HttpServletRequest request, HttpServletResponse response,CodeValue codevalue) throws AppException {
		return announcementInformEe11Service.getCodeValueFromCache(codevalue);
	}
	
	
	
	
	
	
	
	
	
	/**
	 * ͨ��������Ż�ȡ������Ϣ
	 * @param request
	 * @return
	 */
	@RequestMapping("/getgroupdatabyid/{id}")
	@ResponseBody
	public AjaxReturnMsg getgroupdata(HttpServletRequest request,Model model,@PathVariable String id ) throws Exception {
		return announcementInformEe11Service.getGroupDataById(id);
	}
	
	
	
	
	
	
	/**
	 * ��ת���鿴Ee11��Ϣҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping("/toview/{id}")
	@ResponseBody
	public HashMap<String,Object> toview(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		ModelAndView modelAndView=new ModelAndView("/WEB-INF/page/index/index.jsp");
		Ee11 ee11 = announcementInformEe11Service.getEe11NameById(id); 
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("ee11",ee11);
		modelAndView.addObject("ee11",ee11);  
        return map;
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
