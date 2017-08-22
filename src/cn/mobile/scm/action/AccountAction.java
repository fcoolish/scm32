package cn.mobile.scm.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mobile.scm.entity.Account;
import cn.mobile.scm.service.AccountService;


@Controller
@RequestMapping(value="/account")
public class AccountAction extends BaseAction{

	@Resource
	private AccountService accountService;
	
	@RequestMapping(value="/login")
	public String login(Account account,HttpServletRequest request,HttpSession session) throws Exception{
		System.out.println("---action.account:"+account);
		Account acc = accountService.login(account);
		if(acc!=null)
		{
			return "forward:/WEB-INF/jsp/main.jsp";
		}
		else 
		{
			request.setAttribute("msg", "用户名或密码错误！");
			return "forward:/WEB-INF/jsp/login.jsp";
		}
	}
	
	
	@RequestMapping("/doAjax")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object doAjax(Account account){
		System.out.println("---doAjax.account:"+account);
		
		return account;
	}

}
