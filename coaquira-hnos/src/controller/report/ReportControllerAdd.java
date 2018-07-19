package controller.report;

import java.io.IOException;
import java.util.List;
import controllers.PMF;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.Monto;
import model.entity.Report;

@SuppressWarnings("serial")
public class ReportControllerAdd extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name=request.getParameter("name");
		String mount=request.getParameter("mount");
		String operation=request.getParameter("operation");

		if(name!=null){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			Double mountd=Double.parseDouble(mount);
			Report report = new Report(name,mountd,operation);

			String query = "select from " + Monto.class.getName();
			List<Monto> monto = (List<Monto>) pm.newQuery(query).execute();

			double respuesta=monto.get(0).getMonto();
			if(operation.equals("income")){
				respuesta=respuesta+mountd;
				monto.get(0).setMonto(respuesta);
			}else{
				respuesta=respuesta-mountd;
				monto.get(0).setMonto(respuesta);}	

			try {
				pm.makePersistent(report);
			} finally {
				pm.close();
			}
			response.sendRedirect("/report");
		}else{
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Report/createReport.jsp");
			dispatcher.forward(request, response);
		} 

	}
}
