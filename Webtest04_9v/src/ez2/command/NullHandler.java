package ez2.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ez2.command.CommandHandler;

public class NullHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/view/nullCommand.jsp";
	}

}
