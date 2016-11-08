package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.ProfessionalUser;
import service.ProfessionalUserService;

/**
 * Servlet implementation class CreateController
 */
@WebServlet("/create")
public class CreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 // TODO Auto-generated method stub
	    
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		RequestDispatcher errors = getServletContext().getRequestDispatcher("/errorPage.jsp");
	
		ProfessionalUserService service = new ProfessionalUserService();
		String errormsg = "";
		int ercounter = 0;
		//boolean check = true;
		//int proUserId = 0;
		String firstName = null;
		String lastName = null;
		String location = null;
		String profession = null;
		
		//Get the inputs parameters
		firstName = request.getParameter("firstName");
		lastName = request.getParameter("lastName");
		location = request.getParameter("location");
		profession = request.getParameter("profession");
			    
		    try {
			
			//Checking errors from user's inputs and create errors messages
			if(firstName.equals("") || firstName.length() == 0) {
			    errormsg += ++ ercounter + ") You have to insert a name in the field \"First Name\"<br>";
			}
			if(lastName.equals("") || lastName.length() == 0) {
			    errormsg += ++ ercounter + ") You have to insert a name in the field \"Last Name\"<br>";
			}
			if(location.equals("") || location.length() == 0) {
			    errormsg += ++ ercounter + ") You have to insert a name in the field \"Location\"<br>";
			}
			if(profession.equals("") || profession.length() == 0) {
			    errormsg += ++ ercounter + ") You have to insert a name in the field \"Profession\"<br>";
			}
			
			if (ercounter > 0) {
			    if (ercounter == 1) {
				errormsg = "<h3>Found " + ercounter + " error</h3>" + errormsg;
			    }
			    else {
				errormsg = "<h3>Found " + ercounter + " errors</h3>" + errormsg;
			    }
			    request.setAttribute("errormessage", errormsg);
			    errors.forward(request, response);
			    return;
			}
			
			
			 ProfessionalUser pro = new ProfessionalUser()
				    .setFirstName(firstName)
				    .setLastName(lastName)
				    .setLocation(location)
				    .setProfession(profession);
			
			 pro = service.create(pro);
			 request.setAttribute("pro", pro);    
			 RequestDispatcher succdis = getServletContext().getRequestDispatcher("/createResults.jsp");
			 succdis.forward(request, response);
			 
		    } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			request.setAttribute("errormessage", e.getMessage());
			errors.forward(request, response);
			
		    }
	}
	
}
