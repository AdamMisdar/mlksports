package csctraining.files;

import java.sql.*;

import static java.lang.System.out;
public class ClientDAO {
	
	static Connection con = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	
	String dbURL = "jdbc:postgresql://ec2-107-22-122-106.compute-1.amazonaws.com/d1b0par7a0st19";//url postgres
	String user = "lkdyrtnkvudsec";//username acc postgres
	String pass = "620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7";//password
	
	
	
	 protected Connection getConnection()
	  {
	    Connection connection = null;
	    try {
	      Class.forName("org.postgresql.Driver");
	      connection = DriverManager.getConnection(dbURL, user, pass);
	    } catch (SQLException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    return connection;
	  }

    public void signupclient (Client client) throws SQLException {
    	


        // try-with-resource statement will auto close the connection.
    	try {
    		Connection connection = getConnection();
    		
    		PreparedStatement ps = connection.prepareStatement("INSERT INTO client (clientName, clientAge, clientPhoneno, clientEmail, clientPassword) values (?,?,?,?,?)");
			ps.setString(1,client.getClientName());
			ps.setString(2,client.getClientAge());
			ps.setString(3,client.getClientPhoneno());
			ps.setString(4,client.getClientEmail());
			ps.setString(5,client.getClientPassword());
			
			ps.executeUpdate();
			System.out.println("Successfully inserted");
			con.close();
      } catch (SQLException e) {
          printSQLException(e);
      }
    }

    public boolean updateclient(Client client) throws SQLException {
        boolean rowUpdated = false;
        try
        {
        	Connection connection = getConnection();
         
        	PreparedStatement ps = connection.prepareStatement("UPDATE client SET clientName=?, clientAge=?, clientPhoneno=?, clientEmail=?, clientPassword=?  WHERE clientID=?");
        	ps.setString(1,client.getClientName());
			ps.setString(2,client.getClientAge());
			ps.setString(3,client.getClientPhoneno());
			ps.setString(4,client.getClientEmail());
			ps.setString(5,client.getClientPassword());
            ps.setInt(6, client.getClientID());

            rowUpdated = ps.executeUpdate() > 0;
            con.close();
        }catch(SQLException e) {
        	printSQLException(e);
        }
        return rowUpdated;
    }
    public boolean deleteclient(int clientID) throws SQLException {
        boolean rowDeleted = false;
        try{
        	Connection connection = getConnection();
        	
        	PreparedStatement ps = connection.prepareStatement("delete from client where clientID=?");
            ps.setInt(1, clientID);
            rowDeleted = ps.executeUpdate() > 0;
            con.close();
        }catch(SQLException e) {
        	printSQLException(e);
        }
        return rowDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
