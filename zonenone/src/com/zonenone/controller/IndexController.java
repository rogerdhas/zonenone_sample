package com.zonenone.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.zonenone.form.BaseFormBean;
import com.zonenone.form.LoginFormBean;
import com.zonenone.form.PlanFormBean;
import com.zoneone.bo.impl.LoginBOImpl;
import com.zoneone.bo.impl.PlanBOImpl;

@Controller
public class IndexController {

	@Autowired
	private ServletContext servContext;

	@Autowired
	private WebApplicationContext appContext;

	/**
	 * First Method to load Default Page
	 * 
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/loadlogin.do", method = RequestMethod.GET)
	public ModelAndView loadLogin(HttpServletRequest request,
			HttpServletResponse response) {
		LoginFormBean loginFormBean = null;
		try {
			ModelAndView mv = new ModelAndView("login");
			loginFormBean = (LoginFormBean) appContext.getBean("loginFormBean");
			mv.addObject("loginFormBean", loginFormBean);
			mv.addObject("currentUrl", "login");
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	/**
	 * Method to validate login
	 * 
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView home(
			@ModelAttribute("loginFormBean") LoginFormBean loginFormBean,
			HttpServletRequest request, HttpServletResponse response) {
		LoginBOImpl loginBOImpl = (LoginBOImpl) appContext
				.getBean("loginBOImpl");
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("loginFormBean", loginFormBean);
		BaseFormBean baseFormBean = loginFormBean;
		try {
			loginBOImpl.validate(baseFormBean);
			loginBOImpl.save(baseFormBean);
			if(loginFormBean.getUserId() != null){
				HttpSession session = request.getSession();
				session.setAttribute("currentUserId", loginFormBean.getUserId());
				session.setAttribute("currentUserMailId", loginFormBean.getMailId());
			}
			mv.addObject("currentUrl", "login");
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl("loadplan.do");
			mv.setView(redirectView);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("login");
			return mv;
		}
	}

	/**
	 * Method to load plan
	 * 
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/loadplan.do", method = RequestMethod.GET)
	public ModelAndView loadPlan(HttpServletRequest request,
			HttpServletResponse response) {
		BaseFormBean baseFormBean = null;
		PlanBOImpl boImpl = (PlanBOImpl) appContext.getBean("planBOImpl");
		try {
			ModelAndView mv = new ModelAndView("plan");
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("currentUserId");
			baseFormBean = (PlanFormBean) appContext.getBean("planFormBean");
			((PlanFormBean) baseFormBean).setUserId(userId);
			System.out.println("User Id :: " + userId);
			boImpl.load(baseFormBean);
			System.out.println(baseFormBean);
			mv.addObject("planBean", baseFormBean);
			mv.addObject("planFormBean", baseFormBean);
			mv.addObject("currentUrl", "plan");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("error");
		}
	}

	/**
	 * Method to load plan
	 * 
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/loadplan1.do", method = RequestMethod.GET)
	public ModelAndView loadPlan1(HttpServletRequest request,
			HttpServletResponse response) {
		BaseFormBean baseFormBean = null;
		PlanBOImpl boImpl = (PlanBOImpl) appContext.getBean("planBOImpl");
		try {
			ModelAndView mv = new ModelAndView("plan1");
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("currentUserId");
			baseFormBean = (PlanFormBean) appContext.getBean("planFormBean");
			((PlanFormBean) baseFormBean).setUserId(userId);
			System.out.println("User Id :: " + userId);
			boImpl.load(baseFormBean);
			System.out.println(baseFormBean);
			mv.addObject("planBean", baseFormBean);
			mv.addObject("planFormBean", baseFormBean);
			mv.addObject("currentUrl", "plan1");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("error");
		}
	}

	/**
	 * Method to save plan
	 * 
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/saveplan.do", method = RequestMethod.POST)
	public ModelAndView savePlan(
			@ModelAttribute("planFormBean") PlanFormBean planFormBean,
			HttpServletRequest request, HttpServletResponse response) {
		PlanBOImpl boImpl = (PlanBOImpl) appContext.getBean("planBOImpl");
		ModelAndView mv = new ModelAndView("plan");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		planFormBean.setUserId(userId);
		BaseFormBean baseFormBean = planFormBean;
		mv.addObject("currentUrl", "plan");
		try {
			boImpl.validate(baseFormBean);
			boImpl.save(baseFormBean);
			mv.addObject("planBean", baseFormBean);
			mv.addObject("planFormBean", baseFormBean);
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl("loadplan.do");
			mv.setView(redirectView);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("planBean", baseFormBean);
			mv.addObject("planFormBean", baseFormBean);
			mv.addObject("errorMsg", e.getMessage());
			return mv;
		}
	}

	/**
	 * Method to map
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/map.do", method = RequestMethod.GET)
	public ModelAndView loadMap(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			ModelAndView mv = new ModelAndView("map");
			mv.addObject("currentUrl", "map");
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	/**
	 * Method to map
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/chart.do", method = RequestMethod.GET)
	public ModelAndView loadChart(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			ModelAndView mv = new ModelAndView("chart");
			mv.addObject("currentUrl", "chart");
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	/**
	 * Method to map
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/morrisbarchart.do", method = RequestMethod.GET)
	public ModelAndView morrisBarChart(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			ModelAndView mv = new ModelAndView("morris-bar-chart");
			mv.addObject("currentUrl", "chart");
			mv.addObject("currentChartUrl", "morrisBar");
			mv.addObject("morrisBarValue", getMorrisBarChartJsonStr());
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	/*
	 * 
	 */
	private String getMorrisBarChartJsonStr() {
		ObjectMapper objectMapper = new ObjectMapper();
		List<PlanFormBean> plans = new ArrayList<PlanFormBean>();
		PlanFormBean formBean = new PlanFormBean("12", "SMS Plan", "10", "50",
				"5GB", "300");
		plans.add(formBean);
		formBean = new PlanFormBean("13", "Data Plan", "20", "60", "6GB", "400");
		plans.add(formBean);
		formBean = new PlanFormBean("14", "Text Plan", "30", "70", "7GB", "500");
		plans.add(formBean);
		String json = null;
		try {
			json = objectMapper.writeValueAsString(plans);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * Method to map
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/bubblechart.do", method = RequestMethod.GET)
	public ModelAndView loadBubbleChart(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			ModelAndView mv = new ModelAndView("bubble-chart");
			mv.addObject("currentUrl", "chart");
			mv.addObject("currentChartUrl", "bubble");
			mv.addObject("bubbleChartStr", this.getBubbleChartJsonStr());
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	/*
	 * 
	 */
	private String getBubbleChartJsonStr() throws JSONException {
		ObjectMapper objectMapper = new ObjectMapper();
		JSONArray chartArr = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("text", "Age 10-20");
		jsonObject.put("value", "89.08%");
		chartArr.put(jsonObject);
		jsonObject = new JSONObject();
		jsonObject.put("text", "Age 21-30");
		jsonObject.put("text", "41.3%");
		chartArr.put(jsonObject);
		jsonObject = new JSONObject();
		jsonObject.put("text", "Age 31-40");
		jsonObject.put("value", "20%");
		chartArr.put(jsonObject);
		jsonObject = new JSONObject();
		jsonObject.put("value", "Age 41-50");
		jsonObject.put("value", "89.08%");
		chartArr.put(jsonObject);
		jsonObject = new JSONObject();
		jsonObject.put("text", "Age 51-60");
		jsonObject.put("value", "20%");
		chartArr.put(jsonObject);
		String json = null;
		try {
			objectMapper.configure(SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS, true);
			json = objectMapper.writeValueAsString(chartArr);
			System.out.println("Bubble Chart Value :: " + json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * Method to map
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/liquidfillgauagechart.do", method = RequestMethod.GET)
	public ModelAndView loadLiquidFillGauageChart(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			ModelAndView mv = new ModelAndView("liquid-fill-gauage-chart");
			mv.addObject("currentUrl", "chart");
			mv.addObject("currentChartUrl", "liquidguage");
			mv.addObject("ageValue", 55);
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	/**
	 * Method to map
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/chloropethbarchart.do", method = RequestMethod.GET)
	public ModelAndView loadChloroBarChart(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			ModelAndView mv = new ModelAndView("chloropeth-bar-chart");
			mv.addObject("currentUrl", "chart");
			mv.addObject("currentChartUrl", "chloropeth");
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

}
