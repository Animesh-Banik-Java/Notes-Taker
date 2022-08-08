package com.notes.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.notes.entities.Notes;
import com.notes.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			try {
				int note_id = Integer.parseInt(request.getParameter("note_id").trim()); 
				Session session = FactoryProvider.getConnection().openSession();
				Transaction tx = session.beginTransaction();
				Notes notes = session.get(Notes.class, note_id);
				session.delete(notes);
				tx.commit();
				session.close();
				response.sendRedirect("show_notes.jsp");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	}
 
}
