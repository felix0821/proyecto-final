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
public class ReportControllerEdit extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mount=request.getParameter("mount");
		String operation=request.getParameter("operation");
		String id=request.getParameter("id");
		System.out.println("entro updateController");
		PersistenceManager pm = PMF.get().getPersistenceManager();

		if(mount!=null){
			double respuesta;
			Double mountd=Double.parseDouble(mount);
			try {
				Report report = pm.getObjectById(Report.class, Long.parseLong(id));
				String query = "select from " + Monto.class.getName();
				List<Monto> monto = (List<Monto>) pm.newQuery(query).execute();
				respuesta=monto.get(0).getMonto();
				
				if(report.getOperacion().equals("income")){
					respuesta=respuesta-report.getMonto();
					if(operation.equals("income")){
						monto.get(0).setMonto(respuesta+mountd);
					}else{
						monto.get(0).setMonto(respuesta-mountd);
					}
				}else{
					respuesta=monto.get(0).getMonto()+report.getMonto();
					if(operation.equals("income")){
						monto.get(0).setMonto(respuesta+mountd);
					}else{
						monto.get(0).setMonto(respuesta-mountd);
					}
				}
				report.setOperacion(operation);
				report.setMonto(mountd);
			} finally {
				pm.close();
			}
			
			
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/report");
			dispatcher.forward(request, response);
		}else{
			try {
				Report report = pm.getObjectById(Report.class, Long.parseLong(id));
				request.setAttribute("report", report);
			} finally {
				pm.close();
			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Report/updateReport.jsp");
			dispatcher.forward(request, response);
		} 
	}
}

