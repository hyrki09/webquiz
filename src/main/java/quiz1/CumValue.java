package quiz1;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/input.do")
public class CumValue extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		String data = req.getParameter("num");
		PrintWriter out = resp.getWriter();
		if (data == "") {
			out.println("값을 입력해주세요");

		} else {

			int num = Integer.parseInt(data);
			int sum = 0;

			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='UTF-8'>");
			out.println("<title>CumValue</title>");
			out.println("<body>");
			for (int i = 1; i <= num; i++) {
				sum += i;
			}
			out.println("누적값은 " + sum + "입니다.");
			out.println("</body>");
			out.println("</head>");
			out.println("</html>");
		}

	}

}
