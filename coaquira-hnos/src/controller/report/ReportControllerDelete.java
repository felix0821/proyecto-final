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
public class ReportControllerDelete extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersistenceManager pm =  PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		Report report = pm.getObjectById(Report.class, Long.parseLong(id));
		String query = "select from " + Monto.class.getName();
		List<Monto> monto = (List<Monto>) pm.newQuery(query).execute();
		double respuesta=0;
		if(report.getOperacion().equals("income")){
			respuesta= monto.get(0).getMonto()-report.getMonto();
		}else{
			respuesta= monto.get(0).getMonto()+report.getMonto();
		}		
		monto.get(0).setMonto(respuesta);
		
		try{
			pm.deletePersistent (report);

		} finally{
			pm.close();
		}
		RequestDispatcher dispatcher =  getServletContext().getRequestDispatcher("/report");
		dispatcher.forward(request, response);
	}
}
