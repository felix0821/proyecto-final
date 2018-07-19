package controller.invoices;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Access;
import model.entity.Factura;
import model.entity.Resource;
import model.entity.User;

	@SuppressWarnings("serial")
	public class InvoicesControllerIndex extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
			final PersistenceManager pm = PMF.get().getPersistenceManager();
			final Query q = pm.newQuery(Factura.class);
				try{
					UserService us = UserServiceFactory.getUserService();
					com.google.appengine.api.users.User count = us.getCurrentUser();
					
					if(count==null){
						RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error1.jsp");
						dp.forward(req, resp);
					}else{
						String query= "select from "+User.class.getName()+" where email=='"+count.getEmail()
						+"'"+" && status==true";
						List<User>cSearch=(List<User>)pm.newQuery(query).execute();
						if(cSearch.isEmpty()){
							RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error2.jsp");
							dp.forward(req, resp);
						}else{
							System.out.println(req.getServletPath());
							String query2="select from "+Resource.class.getName()+" where name=='"+req.getServletPath()+
							"'"+" && status==true";
							List<Resource>rSearch=(List<Resource>)pm.newQuery(query2).execute();
							if(rSearch.isEmpty()){
								RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error3.jsp");
								dp.forward(req, resp);
							}else{
								String query3="select from "+Access.class.getName()+
								" where role=="+cSearch.get(0).getRole()+
								" && resource=="+Long.parseLong(rSearch.get(0).getId())+
							    " && status==true";
								List<Access>aSearch=(List<Access>)pm.newQuery(query3).execute();
								if(aSearch.isEmpty()){
									RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error4.jsp");
									dp.forward(req, resp);
								}else{
					//ejecucion del codigo
					@SuppressWarnings("unchecked")
					List<Factura> factura = (List<Factura>) q.execute();
					
                    if(req.getParameter("edit")!=null||req.getParameter("del")!=null){
                    	if(req.getParameter("edit")!=null){
                    		req.setAttribute("facturas", factura);
                    		resp.setContentType("text/plain");
                    		int i=(Integer.parseInt((String) req.getParameter("edit")));
                    		Long ad=null;
                    		int o=0;
                    		for( Factura p : factura ) {
	                    		if(i==o){ad=Long.parseLong(p.getId());}
	                    		o++;}
                    		q.setFilter("id == ad");
                        	q.declareParameters("Long ad");
                        	List<Factura> results = (List<Factura>) q.execute(ad);
                        	req.setAttribute("fact", results);
                        	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/Views/Invoices/edit.jsp");
                        	rd.forward(req, resp);
                    		//resp.getWriter().println(i);
                    	}
                    	else if(req.getParameter("del")!=null){
                    	resp.setContentType("text/plain");
                    	int i=(Integer.parseInt((String) req.getParameter("del")));
                    	Long ad=null;
                		int o=0;
                		for( Factura p : factura ) {
                    		if(i==o){ad=Long.parseLong(p.getId());}
                    		o++;}
                    	q.setFilter("id == ad");
                    	q.declareParameters("Long ad");
                    	//List<Factura> results = (List<Factura>) q.execute(ad);
                    	q.deletePersistentAll(ad);
                    	resp.sendRedirect("invoices");
    					
                    	}
					}
                    else{
                    req.setAttribute("facturas", factura);
					RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/Views/Invoices/index.jsp");
					rd.forward(req, resp);
                    }
				}}}}
				}catch(Exception e){
					System.out.println(e);
				}finally{
					q.closeAll();
					pm.close();
				}
						
		}
	}

	