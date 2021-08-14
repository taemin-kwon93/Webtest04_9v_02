package ez2.service;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import ez2.dao.MessageDao;
import ez2.dao.MessageDaoProvider;
import ez2.model.Message;
import ez2.model.MessageListView;
import ez2.loader.JdbcUtil;
import ez2.jdbc.connection.ConnectionProvider;

public class GetMessageListService {

	private static GetMessageListService instance = new GetMessageListService();
	
	public static GetMessageListService getInstance() {
		return instance;
	}
	private GetMessageListService() {}

	private static final int MESSAGE_COUNT_PER_PAGE =3;
	
	
	public MessageListView getMessageList(int pageNumber) throws ServiceException {
		Connection conn =null;
		int currentPageNumber = pageNumber;
		try {
			conn=ConnectionProvider.getConnection();
			
			MessageDao messageDao = MessageDaoProvider.getInstatnce().getMessageDao();
					
			int messageTotalCount = messageDao.selectCount(conn);
			
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow =0;
			if(messageTotalCount >0) {
				firstRow = (pageNumber -1 ) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;
				messageList = messageDao.selectList(conn, firstRow, endRow);
			}else {
				currentPageNumber=0;
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageList,messageTotalCount,currentPageNumber,
					MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
		}catch (SQLException e) {
			throw new ServiceException("�޽��� ��� ���ϱ� ���� : " + e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
