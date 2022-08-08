package com.notes.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.notes.entities.Notes;
import com.notes.helper.FactoryProvider;

/**
 * Servlet implementation class AddServlet
 */
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    } 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Notes notes = new Notes(title, content, new Date()); 
			//System.out.println(notes.toString());
			Session session = FactoryProvider.getConnection().openSession();
			Transaction tx = session.beginTransaction();
			session.save(notes);
			tx.commit();
			session.close();
			response.sendRedirect("show_notes.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
