<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html"  session="false" %>
<%
//读取Cookies
Cookie cookies[] = request.getCookies(); 
Cookie sCookie = null;
int VisitorCount = 0;
//检查是否存在Cookies
if (cookies != null)  {
  //如果存在就遍历
  for (int i=0; i<cookies.length; i++) {
    sCookie=cookies[i];
    if(sCookie.getName().equals("VisitorCount")){
	  VisitorCount = Integer.parseInt(sCookie.getValue()) + 1;
	  out.println("<b>欢迎你第<font color=\"#FF0000\"> " + VisitorCount +" </font>访问Cookie</b>");
	  String cookieName = "VisitorCount"; 
      //更新Cookie
      sCookie = new Cookie(cookieName, VisitorCount+""); 
      sCookie.setMaxAge(10*60); 
      response.addCookie(sCookie);
	} else {
      //如果没有定义VisitorCount Cookie就创建它
      String cookieName = "VisitorCount"; 
      sCookie = new Cookie(cookieName,"1"); 
      sCookie.setMaxAge(10*60); 
      response.addCookie(sCookie);
      out.println("<b>欢迎你第<font color=\"#FF0000\">1</font>访问Cookie</b>");
    }  
  //out.println("<br />" + sCookie.getName() + ":" + sCookie.getValue());
  }
} else {
  //如果没有定义Cookie就创建它
  //也就是第一次访问
  String cookieName = "VisitorCount"; 
  sCookie = new Cookie(cookieName,"1"); 
  sCookie.setMaxAge(10*60); 
  response.addCookie(sCookie);
  out.println("<b>欢迎你第<font color=\"#FF0000\">1</font>访问Cookie</b>");  
}
%>
