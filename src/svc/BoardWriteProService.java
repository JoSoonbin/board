package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;
public class BoardWriteProService {

	public boolean registArticle(BoardBean boardBean) throws Exception{ // Article 등록이 되면 true, 실패하면 false 반환
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection(); // 데이터베이스 작업을 위핸 Connection 객체를 생성
		BoardDAO boardDAO = BoardDAO.getInstance(); // 생성자 메소드를 사용핳지 않고 getInstance() 을 사용하는데, 객체를 유일하게 하나만 만들 수 있다.
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
