package com.airintelli.ssm.shiro;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.airintelli.ssm.pojo.ActiveUser;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.UserInfoVo;
import com.airintelli.ssm.service.CompanyInfoService;
import com.airintelli.ssm.service.IUserInfoService;
import com.airintelli.ssm.service.UserInfoService;

/**
 * 用于对用户登录的认证和授权
 * 
 * @author cx
 *
 */
public class LoginRealm extends AuthorizingRealm {

	@Autowired
	private IUserInfoService iUserInfoService;
	@Resource
	private CompanyInfoService companyInfoService;

	public String getName() {
		return "loginRealm";
	}

	/**
	 * 用于用户登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		// 从token中获取登录用户身份信息
		String phone = (String) token.getPrincipal();

		UserInfoVo userInfoVo = null;
		CompanyInfo companyInfo = null;
		ActiveUser activeUser = new ActiveUser();
		// 此变量用来存储用户在数据库中的密码
		String password = "";

		if ((companyInfo = companyInfoService.selectByPhone(phone)) != null) {
			password = companyInfo.getPassword();
			// 把用户id存储到身份信息类中
			activeUser.setUid(companyInfo.getId());
			// 把用户账号（即手机号）存储到身份信息类中
			activeUser.setPhone(phone);
			// 把数据库中的密码存储到身份信息类中
			activeUser.setPassword(password);
			activeUser.setRoleName("companyinfo");
			if (companyInfo.getState() != null && companyInfo.getState() == 0) {
				// 如果登录的用户的账号状态是0（即被禁用），则抛出该账号被禁用的异常
				throw new DisabledAccountException();
			}

		} else if ((userInfoVo = iUserInfoService.getUserInfoByName(phone)) != null) {
			password = userInfoVo.getPassword();
			// 把用管理员id存储到身份信息类中
			activeUser.setUid(userInfoVo.getId());
			// 把管理员账号（即手机号）存储到身份信息类中
			activeUser.setPhone(phone);
			// 把数据库中的密码存储到身份信息类中
			activeUser.setPassword(password);
			activeUser.setRoleName("userinfo");
			if (userInfoVo.getState() != null && userInfoVo.getState() == 0) {
				// 如果登录的用户的账号状态是0（即被禁用），则抛出该账号被禁用的异常
				throw new DisabledAccountException();
			}
		} else {
			return null;
		}

		// 从数据库中获取盐
		String salt = "eteokues";

		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(activeUser, password,
				ByteSource.Util.bytes(salt.getBytes()), getName());
		return info;
	}

	/**
	 * 用于用户授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 从 principals获取主身份信息
		// 将getPrimaryPrincipal方法返回值转为真实身份类型
		// （在上边的doGetAuthenticationInfo认证通过填充到SimpleAuthenticationInfo中身份类型）
		ActiveUser activeUser = (ActiveUser) principals.getPrimaryPrincipal();

		String roleName = iUserInfoService.getRoleNameByUserInfo(activeUser.getUid());
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addRole(roleName);
		return info;
	}

}
