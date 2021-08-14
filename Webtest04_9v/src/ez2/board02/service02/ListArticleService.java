package ez2.board02.service02;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import ez2.board02.dao02.ArticleDao;
import ez2.board02.model02.Article;
import ez2.jdbc.connection.ConnectionProvider;
import ez2.board02.model02.ArticleListModel;
import ez2.loader.JdbcUtil;


public class ListArticleService {
	private static ListArticleService instance = new ListArticleService();
	public static ListArticleService getInstance(){
		return instance;
	}
	
	public static final int COUNT_PER_PAGE = 10;
	
	public ArticleListModel getArticleList(int requestPageNumber) {
		if(requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : " + requestPageNumber);
		}
		ArticleDao articleDao = ArticleDao.getInstance();
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			int totalArticleCount = articleDao.selectCount(conn);
			if(totalArticleCount == 0) {
				return new ArticleListModel();
			}
			int totalPageCount = calculateTotalPageCount(totalArticleCount);
			int firstRow = (requestPageNumber-1)*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			if(endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			List<Article> articleList = articleDao.select(conn, firstRow, endRow);
			ArticleListModel articleListView = new ArticleListModel(articleList, requestPageNumber, totalPageCount, firstRow, endRow);
			return articleListView;
		}catch(SQLException e) {
			throw new RuntimeException("DB���� �߻�: " + e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}//public ArticleListModel getArticleList(int requestPageNumber)

	private int calculateTotalPageCount(int totalArticleCount) {
		if(totalArticleCount == 0) {
			return 0;
		}
		int pageCount = totalArticleCount/COUNT_PER_PAGE;
		if(totalArticleCount%COUNT_PER_PAGE > 0) {
		pageCount++;
		}
		return pageCount;
	}
}
