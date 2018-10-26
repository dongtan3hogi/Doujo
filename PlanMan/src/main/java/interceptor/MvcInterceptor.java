package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.scit.doujo.vo.member;

public class MvcInterceptor extends HandlerInterceptorAdapter{
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      String requestURI = request.getRequestURI();
      System.out.println(requestURI);
      if( handler instanceof HandlerMethod == false ) {
         response.sendRedirect(request.getContextPath()+"/gotohome");
            return false;
          }
    
       if (requestURI.indexOf("/home") > -1||requestURI.indexOf("/echo2/info") > -1||requestURI.indexOf("/showAlermList") > -1||requestURI.indexOf("/getMyNewMessageList") > -1
    		   ||requestURI.indexOf("/messageTypeNewToNor") > -1) { //例外ページ
           return true;
       }  else {
        
         HttpSession session = request.getSession();
         
         Object obj = session.getAttribute("member");
        
         if(obj == null) {//セッションが満了したらログアウトページで行く
            response.sendRedirect(request.getContextPath()+"/logout");

            return false;
         }
       }
   return true;

   }
   
}