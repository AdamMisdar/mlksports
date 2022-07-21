package csctraining.files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import java.sql.Connection;

import java.sql.DriverManager;


@WebServlet(name = "TrainerController", value = "/TrainerController")
public class TrainerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TrainerDAO dao;
    public void init() {
        dao = new TrainerDAO();    
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        HttpSession session = request.getSession();
        session.removeAttribute("trainerID");
        session.invalidate();
        response.sendRedirect("trainerlogin.jsp");
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//try	
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "signuptrainer":
                    signuptrainer(request, response);
                    break;
                case "logintrainer":
                    logintrainer(request, response);
                    break;
                case "deletetrainer":
                    deletetrainer(request, response);
                    break;
                case "updatetrainer":
                    updatetrainer(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }   
        
        /*#############################################( SINGNUP )###################################################*/

        private void signuptrainer(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
		Trainer trainer = new Trainer();

        trainer.setTrainerName(request.getParameter("trainerName"));
        trainer.setTrainerEmail(request.getParameter("trainerEmail"));
        trainer.setTrainerPhone(request.getParameter("trainerPhone"));
        trainer.setTrainerQualification(request.getParameter("trainerQualification"));
        trainer.setTrainerPassword(request.getParameter("trainerPassword"));
		
		dao.signuptrainer(trainer);
        response.sendRedirect("trainerlogin.jsp");
		
	}

	/*######################################################( LOGIN )#############################################################*/


    private void logintrainer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String trainerEmail = request.getParameter("trainerEmail");
        String trainerPassword = request.getParameter("trainerpassword");  
        
        Connection con = null;

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-107-22-122-106.compute-1.amazonaws.com/d1b0par7a0st19";//url postgres
        	String user = "lkdyrtnkvudsec";//username acc 
        	String pass = "620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7";//password
        	con = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from trainer";

              Statement statement = con.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(trainerEmail.equals(res.getString("trainerEmail")) && trainerPassword.equals(res.getString("trainerPassword")))
                    {

                        Trainer trainer = new Trainer();

                        trainer.setTrainerID(res.getInt(1));
                        trainer.setTrainerName(res.getString(2));
                        trainer.setTrainerPhone(res.getString(3));
                        trainer.setTrainerEmail(res.getString(4));
                        trainer.setTrainerQualification(res.getString(5));
                        trainer.setTrainerPassword(res.getString(4));

                        session.setAttribute("trainerID", trainer.getTrainerID());
                        session.setAttribute("trainerName", trainer.getTrainerName());
                        session.setAttribute("trainerPhone", trainer.getTrainerPhone());
                        session.setAttribute("trainerEmail",trainer.getTrainerEmail());
                        session.setAttribute("trainerQualification", trainer.getTrainerQualification());
                        session.setAttribute("trainerPassword",trainer.getTrainerPassword());

                        response.sendRedirect("homepagetrainer.jsp");

                    }else{

                        out.println("User not exist");

                    }
                }
            


        }catch (Exception e){
            e.printStackTrace();
        }
    }
    /*##################################( UPDATE )##############################################*/


    private void updatetrainer(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        HttpSession session = request.getSession();
        Trainer trainer = new Trainer();

        trainer.setTrainerName(request.getParameter("trainerName"));
        trainer.setTrainerEmail(request.getParameter("trainerEmail"));
        trainer.setTrainerPhone(request.getParameter("trainerPhone"));
        trainer.setTrainerQualification(request.getParameter("trainerQualification"));
        trainer.setTrainerPassword(request.getParameter("trainerPassword"));
		
		dao.updatetrainer(trainer);

        session.removeAttribute("trainer");
        session.setAttribute("trainer", trainer);
        response.sendRedirect("trainerviewaccount.jsp");
    }


    /*######################################################( DELETE )#############################################################*/

    private void deletetrainer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int trainerID = Integer.parseInt(request.getParameter("trainerID"));
        dao.deletetrainer(trainerID);
        response.sendRedirect("trainerlogin.jsp");
    }

}
