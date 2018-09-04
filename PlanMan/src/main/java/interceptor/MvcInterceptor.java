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
      HttpSession session = request.getSession();
      member m = (member)session.getAttribute("member");
      String userid = m.getId();
      
      if(userid == null) {
         response.sendRedirect(request.getContextPath()+"/logout");
         return false;
      }else {
         return true;
      }
   }
   
}