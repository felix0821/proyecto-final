package controller.invoices;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.PMF;
import model.entity.Factura;
import model.entity.Material;

@SuppressWarnings("serial")
public class Report extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		ArrayList<Factura>lista=new ArrayList<Factura>();
			PersistenceManager pm1=PMF.get().getPersistenceManager();
			String inicio = request.getParameter("inicio");
			SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
			String strFecha = inicio;
			Date inicio2 = null;
			try {

			inicio2 = formatoDelTexto.parse(strFecha);

			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String fin = request.getParameter("fin");
			SimpleDateFormat formatoDelTexto2 = new SimpleDateFormat("yyyy-MM-dd");
			String strFecha2 = fin;
			Date fin2 = null;
			try {

			fin2 = formatoDelTexto2.parse(strFecha2);

			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
								String query1 = "select from " +
								Factura.class.getName();
								@SuppressWarnings("unchecked")
								List<Factura> Factura = (List<Factura>)
								pm1.newQuery(query1).execute();
								
								for(int i=0;i<Factura.size();i++){
									SimpleDateFormat formatoDelTexto3 = new SimpleDateFormat("yyyy-MM-dd");
									String strFecha3 = Factura.get(i).getFecha();
									Date dato = null;
									try {

									dato = formatoDelTexto3.parse(strFecha3);

									} catch (java.text.ParseException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
										if(dato.compareTo(inicio2)>=0 && dato.compareTo(fin2)<=0){
										lista.add(Factura.get(i));
									}
								}
								//implementando
								System.out.println(request.getRemoteAddr());
								//fin
								
								// pass the list to the jsp
								request.setAttribute("inicio", inicio);
								request.setAttribute("fin", fin);
								request.setAttribute("lista", lista);
								// forward the request to the jsp
								RequestDispatcher dispatcher =
								getServletContext().getRequestDispatcher("/WEB-INF/Views/Invoices/lista2.jsp");
								dispatcher.forward(request, response);
			
	}

}
