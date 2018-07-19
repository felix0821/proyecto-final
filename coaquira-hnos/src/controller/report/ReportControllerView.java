package controller.report;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.Monto;
import model.entity.Report;
import controllers.PMF;

@SuppressWarnings("serial")
public class ReportControllerView extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
		Report report = pm.getObjectById(Report.class, Long.parseLong(request.getParameter("id")));
		String query = "select from " + Monto.class.getName();
		List<Monto> monto = (List<Monto>) pm.newQuery(query).execute();
		
		request.setAttribute("report", report);
		request.setAttribute("monto",monto);
		}finally{
		pm.close();
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Report/viewReport.jsp");
		dispatcher.forward(request, response);													
	}
}
