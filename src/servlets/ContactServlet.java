package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.URLPattern;
import daos.ContactDAO;
import models.Contact;

@WebServlet(name = "ContactServlet", urlPatterns = {"/contact/edit", "/contact/new", "/contact", "/contact/list", "/contact/delete"})
public class ContactServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public String setUrlPattern() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		ContactDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/contact/edit":
			edit(request, response);
			break;
		case "/contact/new":
			create(request, response);
			break;
		case "/contact/list": case "/contact":
			list(request, response);
			break;
		case "/contact/delete":
			delete(request, response);
			break;
		default:
			break;
		}
		
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		handleGet(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");

		Contact contact = new Contact(name, phoneNumber);

		try {
			if (ContactDAO.getInstance().storeContact(contact)) {
				sendRedirect(request, response, "/contact");
			} else {
				request.setAttribute("error", ErrorCodes.CREATE_NEW_FAIL);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));

		try {
			if (ContactDAO.getInstance().deleteContact(id)) {
				sendRedirect(request, response, "/contact");
			} else {
				request.setAttribute("error", ErrorCodes.DELETE_FAIL);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");

		try {
			if (ContactDAO.getInstance().updateContact(id, name, phoneNumber)) {
				sendRedirect(request, response, "/contact");
			} else {
				request.setAttribute("error", ErrorCodes.UPDATE_FAIL);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("contacts", ContactDAO.getInstance().getAllContacts());
		try {
			forward(request, response, "/index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	
}
