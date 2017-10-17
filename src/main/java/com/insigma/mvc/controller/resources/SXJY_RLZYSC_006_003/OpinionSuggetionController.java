package com.insigma.mvc.controller.resources.SXJY_RLZYSC_006_003;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.config.annotation.Reference;
import com.insigma.dto.AjaxReturnMsg;
import com.insigma.mvc.MvcHelper;
import com.insigma.mvc.model.Ee17;
import com.insigma.mvc.model.Ef11;
import com.insigma.mvc.service.resources.SXJY_RLZYSC_006_003.OpinionSuggetionEe17Service;

/**
 * 服务机构意见建议管理
 * author yangml
 */

@Controller
@RequestMapping("/resources/SXJY_RLZYSC_006_003")
public class OpinionSuggetionController extends MvcHelper{
	
	@Resource
	private OpinionSuggetionEe17Service opinionSuggetionEe17Service;
	
	
	/**
	 * 跳转至服务机构意见建议页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/opinion")
	public ModelAndView opinion(HttpServletRequest request, Model model) throws Exception {
		// 跳转到服务机构意见建议页面的路径
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_006_003/OpinionSuggetion");
		return modelAndView;
	}
	
	/**
	 * 跳转至添加意见页面
	 */
	@RequestMapping("/addAdvice/{aab998}")
	public ModelAndView addAdvice(HttpServletRequest request, Model model,@PathVariable String aab998) throws Exception {
		// 跳转到添加服务机构意见建议页面
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_006_003/AddAdvice");
		 Ef11 ef11=opinionSuggetionEe17Service.getOrganizationNameById(aab998);
		 modelAndView.addObject("ef11",ef11);
		return modelAndView;
	}
	
	
	/**
	 * 跳转至修改页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatetAdvice/{id}/{aab998}")
	public ModelAndView toupdate(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_003/UpdateAdvice");
	    Ee17 ee17 = opinionSuggetionEe17Service.getEe17ById(id);
	    Ef11 ef11=opinionSuggetionEe17Service.getOrganizationNameById(aab998);
		modelAndView.addObject("ef11",ef11);
		modelAndView.addObject("ee17",ee17);  
        return modelAndView;
	}
	
	/**
	 * 跳转至受理意见建议页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/replyAdvice/{id}/{aab998}")
	public ModelAndView replyAdvice(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_003/OpinionSuggetionReply");
	    Ee17 ee17 = opinionSuggetionEe17Service.getEe17NameById(id);
//	    Ef11 ef11=opinionSuggetionEe17Service.getOrganizationNameById(aab998);
//		modelAndView.addObject("ef11",ef11);
		modelAndView.addObject("ee17",ee17);  
        return modelAndView;
	}
	
	
	/**
	 * 获取意见信息列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEe17List")
	@ResponseBody
	public HashMap<String,Object> getEe17List(HttpServletRequest request,Model model,Ee17 ee17 ) throws Exception {
		return opinionSuggetionEe17Service.getEe17List(ee17);
	}
	
	
	/**
	 * 根据标题查询意见
	 */
	@RequestMapping("/selectByHui") 
	@ResponseBody
	public HashMap<String, Object> selectByHui(HttpServletRequest request,Model model,Ee17 ee17 )throws Exception{
		return opinionSuggetionEe17Service.selectHui(ee17);
	}

	/**
	 * 添加意见
	 */
	@RequestMapping("/saveEe17data") 
	@ResponseBody
	public AjaxReturnMsg saveEe17data(HttpServletRequest request,Model model,Ee17 ee17,Ef11 ef11 )throws Exception{
		return opinionSuggetionEe17Service.addSuggetion(ee17,ef11);
	}
	
	/**
	 * 修改意见
	 */
	@RequestMapping("/updateEe17data") 
	@ResponseBody
	public AjaxReturnMsg updateEe17data(HttpServletRequest request,Model model,Ee17 ee17 )throws Exception{
		return opinionSuggetionEe17Service.updateSuggetion(ee17);
	}
	
        
	/**
	 * 受理意见
	 */
	@RequestMapping("/replySuggetion") 
	@ResponseBody
	public AjaxReturnMsg replySuggetion(HttpServletRequest request,Model model,Ee17 ee17 )throws Exception{
		return opinionSuggetionEe17Service.replySuggetion(ee17);
	}
	
	
	/**
	 * 批量删除
	 * @param request
	 * @param model
	 * @param aac001
	 * @return
	 */
	@RequestMapping("/batdelete")
	@ResponseBody
	public AjaxReturnMsg batdelete(HttpServletRequest request,Model model,Ee17 ee17){
		return opinionSuggetionEe17Service.batDeleteReleasedata(ee17);
	}
	
	/**
	 * 跳转至服务机构意见建议受理页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/accept")
	public ModelAndView accept(HttpServletRequest request, Model model) throws Exception {
		// 跳转到服务机构意见建议页面的路径
		ModelAndView modelAndView = new ModelAndView("resources/SXJY_RLZYSC_006_003/OpinionSuggetionAccpet");
		return modelAndView;
	}

	/**
	 * 跳转至详细信息页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/todetail/{id}/{aab998}")
	public ModelAndView todetail(HttpServletRequest request,Model model,@PathVariable String id,@PathVariable String aab998) throws Exception {
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_003/ViewOpinion");
		Ee17 ee17=opinionSuggetionEe17Service.getEe17NameById(id);
//		Ef11 ef11=opinionSuggetionEe17Service.getOrganizationNameById(aab998);
//		modelAndView.addObject("ef11",ef11);
		modelAndView.addObject("ee17",ee17);
        return modelAndView;
	}
	
	/**
	 * 机构选择框
	 * @param request
	 * @return
	 */
	@RequestMapping("/toselect")
	public ModelAndView selectindex(HttpServletRequest request,Model model) throws Exception {
		String callback_fun_name=request.getParameter("callback_fun_name");
		ModelAndView modelAndView=new ModelAndView("resources/SXJY_RLZYSC_006_003/ToQueryOrganization");
        modelAndView.addObject("callback_fun_name", callback_fun_name);
        return modelAndView;
	}
}
