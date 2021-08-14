package ez2.service;
import java.sql.Connection;
import java.sql.SQLException;

import ez2.dao.MessageDao;
import ez2.dao.MessageDaoProvider;
import ez2.model.Message;
import ez2.loader.JdbcUtil;
import ez2.jdbc.connection.ConnectionProvider;

public class DeleteMessageService {

	private static DeleteMessageService instance = new DeleteMessageService();
	
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	private DeleteMessageService()  {}
	
	public void deleteMessage(int messageId, String password) 
			throws ServiceException, InvalidMessagePasswordException,
			MessageNotFoundException{
		Connection conn =null;
	try {
		conn= ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		
		MessageDao messageDao = MessageDaoProvider.getInstatnce().getMessageDao();
		Message message = messageDao.select(conn, messageId);
		
		if (message == null) {
			throw new MessageNotFoundException("�޽����� �����ϴ�.:" + messageId);
		}
		if(!message.hasPassword()) {
			throw new InvalidMessagePasswordException ();
		}
		if(!message.getPassword().equals(password)) {
			throw new InvalidMessagePasswordException();
		}
		messageDao.delete(conn, messageId);
		
		conn.commit();
	}catch(SQLException ex) {
		JdbcUtil.rollback(conn);
		throw new ServiceException("���� ó�� �� ������ �߻��߽��ϴ�.:"+ex.getMessage(),ex);
	}catch(InvalidMessagePasswordException ex) {
		JdbcUtil.rollback(conn);
		throw ex;
	}catch (MessageNotFoundException ex) {
		JdbcUtil.rollback(conn);
		throw ex;
	} finally {
		if(conn != null) {
			try {
				conn.setAutoCommit(false);
			}catch (SQLException e) {
				
			}
			JdbcUtil.close(conn);
		}
	}
	}
}
		