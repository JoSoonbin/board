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

			// page �ѹ��� ����ڰ� ����� �������� �������� ��, ������ �ش� �������� �ش��ϴ� �� ����� �ҷ��� �� �ֵ��� �������ִ� ����.
			// ��, ������ �ĺ��ϴ� �۾��� �ϴ� �ڵ�
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			BoardListService boardListService = new BoardListService();
			int listCount = boardListService.getListCount(); // �� ����Ʈ ���� �޾ƿ�.
			articleList = boardListService.getArticleList(page, limit); // ����Ʈ�� �޾ƿ�.
			// �� ������ ��.
			int maxPage = (int) ((double) listCount / limit + 0.95); // 0.95�� ���ؼ� �ø� ó��.(������ �ϳ� �ö󰡵��� ������ ���� ���ؼ� �����Ǵ°�
																		// ���� ��)
			// ���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			// ���� �������� ������ ������ ������ ��.(10, 20, 30 ��...)
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage; // endPage�� �� ���� �ʾ��� ��

			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			// �ٸ� ���� ������ �Ѱ��ֱ� ���ؼ� ������ ������ �Ѱ� ��
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("articleList", articleList);
			forward = new ActionForward();
			forward.setPath("/board/qna_board_list.jsp");
		}

		return forward;

	}

}