package controller.invoices;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class ReportInicio extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
								RequestDispatcher dispatcher =
								getServletContext().getRequestDispatcher("/WEB-INF/Views/Invoices/lista.jsp");
								dispatcher.forward(request, response);
			
	}

}
