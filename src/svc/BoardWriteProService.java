package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;
public class BoardWriteProService {

	public boolean registArticle(BoardBean boardBean) throws Exception{ // Article ����� �Ǹ� true, �����ϸ� false ��ȯ
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection(); // �����ͺ��̽� �۾��� ���� Connection ��ü�� ����
		BoardDAO boardDAO = BoardDAO.getInstance(); // ������ �޼ҵ带 ����K�� �ʰ� getInstance() �� ����ϴµ�, ��ü�� �����ϰ� �ϳ��� ���� �� �ִ�.
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertArticle(boardBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
