package com.insigma.mvc.controller.resources.SXJY_RLZYSC_001_006;

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
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.model.Ef12;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_001_006.HRAgencyChangeAuditService;
import com.insigma.mvc.utils.HRAgencyUtils;


/**
 *娴滃搫濮忕挧鍕爱娑撴艾濮熼張鐑樼�崣妯绘纯鐎光剝鐗�
 * @author xizh
 *
 */
@Controller
@RequestMapping("/resources/SXJY_RLZYSC_001_006")
public class HRAgencyChangeAuditController extends MvcHelper {
	
	
	@Resource
	private HRAgencyChangeAuditService hragencyChangeAuditService;
	
	
	/**
	 * 鐠哄疇娴嗛懛铏簚閺嬪嫬褰夐弴鏉戭吀閺嶆悂銆夐棃锟�
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/tochangeaudit")
	public ModelAndView dragList(HttpServletRequest request,Model model){
		/**
		 * 鐠哄疇娴嗛懛铏簚閺嬪嫬褰夐弴鏉戭吀閺嶆悂銆夐棃銏㈡畱鐠侯垰绶�
		 */
		ModelAndView modeAndview =new ModelAndView("resources/SXJY_RLZYSC_001_006/HRAgencyChangeAudit");
		return modeAndview;
		
	}

	/**
	 * 閼惧嘲褰囬張鐑樼�穱鈩冧紖閸掓銆�
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getEf11List")
	@ResponseBody
	public HashMap<String,Object> getUserListByGroupid(HttpServletRequest request,Model model,Ef11 ef11 ) throws Exception {
		String flag = request.getParameter("flag");//婢舵氨楠囩�光剝鐗崇拠閿嬬湴閺嶅洩鐦�
		if("1".equals(flag)){//娑擄拷缁狙冾吀閺嶏拷
			ef11.setAef133(HRAgencyUtils.AEF133_1);
		}
		
		return hragencyChangeAuditService.getEf11List(ef11);
	}
	
	
	
	/**
	 * 閸楁洑閲滅�光剝鐗抽柅姘崇箖
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping(value="/singleaudit",params="flag")
	@ResponseBody
	public AjaxReturnMsg singleAuditHRAgencyRegdata(HttpServletRequest request,Model model,Ef12 ef12){
		String flag = request.getParameter("flag");//婢舵氨楠囩�光剝鐗崇拠閿嬬湴閺嶅洩鐦�
		if("1".equals(flag)){//娑擄拷缁狙冾吀閺嶏拷
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}
		return hragencyChangeAuditService.singleAuditHRAgencyRegdata(ef12);
	}
	
	
	
	/**
	 * 鐠哄疇娴嗛懛铏簚閺嬪嫬顓搁弽闀愮瑝闁俺绻冩い鐢告桨
	 * @param request
	 * @param model
	 * @param flag
	 * @param id
	 * @return
	 */
	@RequestMapping("/notauditpass/{id}")
	public ModelAndView notAuditPassDataById(HttpServletRequest request,Model model,@PathVariable String id){
		ModelAndView modelAndView=new ModelAndView();
		Ef11 ef11=hragencyChangeAuditService.getEf11InfoById(id);
		modelAndView.addObject("ef11",ef11);  
		modelAndView.setViewName("resources/SXJY_RLZYSC_001_006/HRAgencyChangeAuditNotPass");//閸掓繂顓告稉宥夛拷姘崇箖妞ょ敻娼�
		
        return modelAndView;
	
     }
	
	
	/**
	 * 娣囨繂鐡�
	 * @param request
	 * @param model
	 * @param ef12
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notpassupdatedata")
	@ResponseBody
	public AjaxReturnMsg savedata(HttpServletRequest request,Model model,@Valid Ef12 ef12,BindingResult result) throws Exception {
		//濡拷妤犲矁绶崗锟�
		if (result.hasErrors()){
			return validate(result);
		}
		return hragencyChangeAuditService.saveNotPassAuditData(ef12);
		
	}
	
	/**
	 * 閹靛綊鍣虹�光剝鐗抽柅姘崇箖
	 * @param request
	 * @param model
	 * @param ef11
	 * @return
	 */
	@RequestMapping(value="/bataudit",params="flag")
	@ResponseBody
	public AjaxReturnMsg batAuditHRAgencyRegdata(HttpServletRequest request,Model model,Ef12 ef12){
		String flag = request.getParameter("flag");//婢舵氨楠囩�光剝鐗崇拠閿嬬湴閺嶅洩鐦�
		if("1".equals(flag)){//娑擄拷缁狙冾吀閺嶏拷
			ef12.setAef133(HRAgencyUtils.AEF133_1);
		}
		return hragencyChangeAuditService.batAuditHRAgencyRegdata(ef12);
	}
	
	/**
	 * 鐠哄疇娴嗛懛瀹狀嚊缂佸棔淇婇幁顖炪�夐棃锟�
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetail/{id}/{aef101}")
	public ModelAndView toedit(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aef101) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_001_006/HRAgencyChangeDetail");
		Ef11 ef11=hragencyChangeAuditService.getEf11ById(id);
		if(ef11!=null){
			modelAndView.addObject("ef11",ef11);
       
	}
		 return modelAndView;
}

}