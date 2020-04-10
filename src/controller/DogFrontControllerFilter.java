package controller;
/*
 * Filter
 * : request가 들어오면 
 *   클라이언트의 codeset과 서버쪽의 codeset이 다를 수 있다(운영체제가 달라서)
 *   filter에서 codeset을 검사해서 양쪽 codeset을 일치시키는 역할을 한다.
 *   관리자만 접근할 수 있는 페이지가 있는데 관리자 아닌 사람이 접근 할 때 막아주는 역할을 한다
 */
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForward;
import action.Action;
import action.DogCartAddAction;
import action.DogCartListAction;
import action.DogCartQtyDownAction;
import action.DogCartQtyUpAction;
import action.DogCartRemoveAction;
import action.DogCartSearchAction;
import action.DogListAction;
import action.DogRegistAction;
import action.DogRegistFormAction;
import action.DogViewAction;

/**
 * Servlet Filter implementation class DogFrontControllerFilter
 */
@WebFilter("*.nm")
public class DogFrontControllerFilter implements Filter {

    /**
     * Default constructor. 
     */
    public DogFrontControllerFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// pass the request along the filter chain
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		String requestURI = request.getRequestURI();
    	// /project/boardWriteForm.bo
    	String contextPath = request.getContextPath();
    	// /project
    	String command = 
        requestURI.substring(contextPath.length());
    	//  /boardWriteForm.bo
    	
    	Action action = null;
    	   //각 Action 객체 들의 구조를 정의하고 있는 인터페이스.
    	//요청을 처리할 때 해당 요청을 처리할 Action 객체들을 하나씩 생성해서
    	//해당 객체를 Action 인터페이스의 레퍼런스 변수로 참조함..

    	
    	ActionForward forward = null;
    	
    	if(command.equals("/dogList.dog")){
    		action = new DogListAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/dogView.dog")){
    		action = new DogViewAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	
    	else if(command.equals("/dogCartAdd.dog")){
    		action = new DogCartAddAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	
    	else if(command.equals("/dogCartList.dog")){
    		action = new DogCartListAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
		/*else if(command.equals("/dogCartSearch.dog")){
			action = new DogCartSearchAction();
			//프로젝트명 + 기능 + 형태(?)
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
    	else if(command.equals("/dogCartRemove.dog")){
    		action = new DogCartRemoveAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/dogCartQtyUp.dog")){
    		action = new DogCartQtyUpAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/dogCartQtyDown.dog")){
    		action = new DogCartQtyDownAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
		/*else if(command.equals("/dogRegist.dog")){
			action = new DogRegistAction();
			//프로젝트명 + 기능 + 형태(?)
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
    	else if(command.equals("/dogRegistForm.dog")){
			action = new DogRegistFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
    	
    	
    	if(forward != null){
    		if(forward.isRedirect()){
    			response.sendRedirect(forward.getPath());
    		}
    		else{
    			RequestDispatcher dispatcher
    			= request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
		//chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
