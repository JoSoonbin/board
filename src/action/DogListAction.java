package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.DogListService;
import svc.MemberListService;
import vo.ActionForward;
import vo.Dog;
import vo.MemberBean;

public class DogListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = null;
		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
		} else {
			ArrayList<String> todayImageList = new ArrayList<String>();
			Cookie[] cookieArray = request.getCookies();

			if (cookieArray != null) {
				for (int i = 0; i < cookieArray.length; i++) {
					if (cookieArray[i].getName().startsWith("today")) {
						todayImageList.add(cookieArray[i].getValue());
					}
				}
			}

			DogListService dogListService = new DogListService();
			ArrayList<Dog> dogList = dogListService.getDogList();
			request.setAttribute("dogList", dogList);
			request.setAttribute("todayImageList", todayImageList);
			forward = new ActionForward("dogList.jsp", false);
		}
		return forward;
	}
}
