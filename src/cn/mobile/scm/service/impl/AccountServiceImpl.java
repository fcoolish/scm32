package cn.mobile.scm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import cn.mobile.scm.dao.AccountMapper;
import cn.mobile.scm.entity.Account;
import cn.mobile.scm.entity.Page;
import cn.mobile.scm.service.AccountService;


@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService{

	@Autowired
	private AccountMapper accountMapper;

	public int insert(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public Account select(Account entity)  {
		// TODO Auto-generated method stub
		return null;
	}

	public Account login(Account account) {
		// TODO Auto-generated method stub
		
		return accountMapper.login(account);
	}

	public Page<Account> selectPage(Page<Account> page) {
		// TODO Auto-generated method stub
		return null;
	}

	

	public Page<Account> selectPageUseDyc(Page<Account> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	

}
