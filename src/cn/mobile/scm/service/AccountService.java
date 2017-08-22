package cn.mobile.scm.service;

import cn.mobile.scm.entity.Account;

public interface AccountService extends BaseService<Account>{

	public Account login(Account account);
}
