package quiz1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/printGuGu.do")
public class GuGuTest extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>GuGu</title>");
		out.println("<body>");
		for(int i =2; i<10; i++) {
			out.println(i+"단 <br>");
			for(int j = 1; j<10; j++) {
				out.println(i+" * "+j+" = "+i*j+"<br>");
			}
		}
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
	}

}
