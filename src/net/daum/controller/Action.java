package net.daum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	public abstract ActionForward extecute(HttpServletRequest request,
			HttpServletResponse response)throws Exception;
	//public abstract는 생략가능한 execute() 추상메서드 정의
}
