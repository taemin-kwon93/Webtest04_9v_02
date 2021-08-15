package ez2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAtion {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)throws Throwable;
}
