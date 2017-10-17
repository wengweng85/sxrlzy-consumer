package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_008;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.config.annotation.Reference;
import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.model.Ef12;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_008.HRAgencyDeleteAuditService;
import com.insigma.mvc.utils.HRAgencyUtils;

/**
 * 浜哄姏璧勬簮鏈嶅姟鏈烘瀯娉ㄩ攢瀹℃牳椤甸潰
 * @author xizh
 *
 */

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_008")
public class HRAgencyDeleteAuditController extends MvcHelper {
	
	@Resource
	private HRAgencyDeleteAuditService   hrAgencyDeleteAuditService;
   /**
    * 璺宠浆鑷充汉鍔涜祫婧愭湇鍔℃満鏋勬敞閿�瀹℃牳椤甸潰
    * @param request
    * @param model
    * @return
    */
	@RequestMapping("/todeleteaudit")
	public ModelAndView DragList(HttpServletRequest request,Model model){
		/**
		 * 浜哄姏璧勬簮鏈嶅姟鏈烘瀯娉ㄩ攢瀹℃牳椤甸潰璺緞
		 */
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_001_008/HRAgencyDeleteAudit");
		return modelAndView;
		
	}
	
	/**
	 * 鑾峰彇鏈烘瀯淇℃伅鍒楄〃
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getEf11List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ef11 ef11 ) throws Exception {

		return hrAgencyDeleteAuditService.getEf11List(ef11);
	}
	
	/**
	 * 鍗曚釜瀹℃牳閫氳繃
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping(value="/singleaudit",params="flag")
	@ResponseBody
	public AjaxReturnMsg singleAuditHRAgencyReportdata(HttpServletRequest request,Model model,Ef12 ef12){
		
		String flag = request.getParameter("flag");//澶氱骇瀹℃牳璇锋眰鏍囪瘑
		if("1".equals(flag)){//涓�绾у鏍�
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}
		return hrAgencyDeleteAuditService.singleAuditHRAgencyReportdata(ef12);
	}
	
	/**
	 * 璺宠浆鑷虫満鏋勫鏍镐笉閫氳繃椤甸潰
	 * @param request
	 * @param model
	 * @param flag
	 * @param id
	 * @return
	 */
	@RequestMapping("/notauditpass/{flag}/{id}")
	public ModelAndView notAuditPassDataById(HttpServletRequest request,Model model,@PathVariable String flag,@PathVariable String id){
		ModelAndView modelAndView=new ModelAndView();
		Ef11 ef11=hrAgencyDeleteAuditService.getEf11InfoById(id, flag);
		modelAndView.addObject("ef11",ef11);  
		if(("1").equals(flag)){
			modelAndView.setViewName("resources/SXJY_RLZYSC_001_008/HRAgencyDeleteAuditNotPass");//鍒濆涓嶉�氳繃椤甸潰
		}
        return modelAndView;
	
     }
	
	/**
	 * 淇濆瓨
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
		//妫�楠岃緭鍏�
		if (result.hasErrors()){
			return validate(result);
		}
		String flag = request.getParameter("flag");//澶氱骇瀹℃牳璇锋眰鏍囪瘑
		if("1".equals(flag)){//涓�绾у鏍�
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}
		return hrAgencyDeleteAuditService.saveNotPassAuditData(ef12);
		
	}
	
	/**
	 * 璺宠浆鑷宠缁嗕俊鎭〉闈�
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetail/{id}/{aef101}")
	public ModelAndView toedit(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aef101) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_008/HRAgencyDeleteDetail");
		Ef11 ef11=hrAgencyDeleteAuditService.getEf11ById(id);
		if(ef11!=null){
			modelAndView.addObject("ef11",ef11);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd ");
			Date date = ef11.getAef129();
			String s = formatter.format(date);
			modelAndView.addObject("aef129",s);
		}else{
			this.error("瀵逛笉璧凤紝鎮ㄦ煡璇㈢殑鏁版嵁涓嶅瓨鍦ㄣ��");
		}
		
		
        return modelAndView;
	}
	
	/**
	 * 鎵归噺瀹℃牳閫氳繃
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping(value="/bataudit",params="flag")
	@ResponseBody
	public AjaxReturnMsg batAuditHRAgencyRegdata(HttpServletRequest request,Model model,Ef12 ef12){
		String flag = request.getParameter("flag");//澶氱骇瀹℃牳璇锋眰鏍囪瘑
		if("1".equals(flag)){//涓�绾у鏍�
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}
		return hrAgencyDeleteAuditService.batAuditHRAgencyRegdata(ef12);
	}
	
}
