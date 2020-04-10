package action;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardListService;
import svc.MemberListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.MemberBean;
import vo.PageInfo;

public class BoardListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = null;
		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
		} else {
			ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
			int page = 1;
			int limit = 10;

			// page 넘버는 사용자가 목록의 페이지를 선택했을 때, 쿼리에 해당 페이지에 해당하는 글 목록을 불러올 수 있도록 구별해주는 숫자.
			// 즉, 페이지 식별하는 작업을 하는 코드
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			BoardListService boardListService = new BoardListService();
			int listCount = boardListService.getListCount(); // 총 리스트 수를 받아옴.
			articleList = boardListService.getArticleList(page, limit); // 리스트를 받아옴.
			// 총 페이지 수.
			int maxPage = (int) ((double) listCount / limit + 0.95); // 0.95를 더해서 올림 처리.(단위가 하나 올라가도록 나머지 값에 더해서 누락되는거
																		// 없게 함)
			// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage; // endPage가 꽉 차지 않았을 때

			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			// 다른 곳에 정보를 넘겨주기 위해서 페이지 단위로 넘겨 줌
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("articleList", articleList);
			forward = new ActionForward();
			forward.setPath("/board/qna_board_list.jsp");
		}

		return forward;

	}

}