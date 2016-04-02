package learnJDBC;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//Notice, do not import com.mysql.jdbc.* 
// or you will have problems!
public class LoadDriver {    
	public static void main(String[] args) {        
		Connection conn = null;		
		try {            
			// The newInstance() call is a work around for some            
			// broken Java implementations
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = 
				DriverManager.getConnection("jdbc:mysql://localhost/test?" +
					"user=root&password=123");
			// Do something with the Connection
		} catch (SQLException ex) {    
			// handle any errors    
			System.out.println("SQLException: " + ex.getMessage());    
			System.out.println("SQLState: " + ex.getSQLState());    
			System.out.println("VendorError: " + ex.getErrorCode()); 
		} catch (Exception ex) {            
			// handle the error
		}
		
		Statement stmt = null; 
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();    
			rs = stmt.executeQuery("SELECT * FROM test4login");
			// or alternatively, if you don't know ahead of time that    
			// the query will be a SELECT...
			if (stmt.execute("SELECT * FROM test4login")) {
				rs = stmt.getResultSet();  
				while(rs.next()){
					System.out.print(rs.toString()+"\n"+
							rs.getObject("name")+"\n"+
							rs.getObject("password"));
				}
				
				
			}
			// Now do something with the ResultSet .... 
		} catch (SQLException ex) {    
			// handle any errors    
			System.out.println("SQLException: " + ex.getMessage());    
			System.out.println("SQLState: " + ex.getSQLState());    
			System.out.println("VendorError: " + ex.getErrorCode()); 
		} finally {
			// it is a good idea to release    
			// resources in a finally{} block    
			// in reverse-order of their creation    
			// if they are no-longer needed
		    if (rs != null) {        
		    	try {            
		    		rs.close();        
		    	} catch (SQLException sqlEx) { } // ignore
		    	rs = null;
		    }
		    if (stmt != null) {        
		    	try {            
		    		stmt.close();
		    	} catch (SQLException sqlEx) { } // ignore
		        stmt = null; 
		    } 
		}
	}
}
