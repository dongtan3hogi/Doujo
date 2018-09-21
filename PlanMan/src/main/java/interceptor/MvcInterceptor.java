package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.scit.doujo.vo.member;

public class MvcInterceptor extends HandlerInterceptorAdapter{
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      /*HttpSession session = request.getSession();
      String userid="";
      
      
      Object obj = session.getAttribute("member");
      
      if(obj == null) {
         //response.sendRedirect(request.getContextPath()+"/logout");
         response.sendRedirect("/gotoHome");
         return false;
      }else if (userid != null) {
    	 member m = (member)session.getAttribute("member");
         userid = m.getId();
      }
      return true;*/
	   
	   String requestURI = request.getRequestURI();
       
       if (requestURI.indexOf("/home") > -1) { //세션체크 예외페이지
           return true;
       } else if (requestURI.indexOf("/") > -1) {
           return true;
       } else {//위의 예외페이지 외에는 세션값을 체크해서 있으면 그냥 페이지표시
        
    	  HttpSession session = request.getSession();
	      String userid="";
	      
	      
	      Object obj = session.getAttribute("member");
	      
	      if(obj == null) {
	         //response.sendRedirect(request.getContextPath()+"/logout");
	         response.sendRedirect("/gotoHome");
	         return false;
	      }else if (userid != null) {
	    	 member m = (member)session.getAttribute("member");
	         userid = m.getId();
	      }
	      return true;

       }
       
       //정상적인 세션정보가 없으면 로그인페이지로 이동
       /*request.getRequestDispatcher(request.getContextPath() + "/gotoHome").forward(request, response);
       return false;*/

   }
   
}