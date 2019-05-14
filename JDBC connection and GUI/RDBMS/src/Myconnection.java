

import java.sql.*;
import oracle.jdbc.*;
import java.math.*;
import java.io.*;
import java.awt.*;
import oracle.jdbc.pool.OracleDataSource;
public class Myconnection {
    
    public static void main (String args []) throws SQLException {
    try
    {

      //Connecti to Oracle server. Need to replace username and
      //password by your username and your password. For security
      //consideration, it's better to read them in from keyboard.
      OracleDataSource ds = new oracle.jdbc.pool.OracleDataSource();
      ds.setURL("jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111");
      Connection conn = ds.getConnection("asaraka1", "Aafemh14");

      // Query
      Statement stmt = conn.createStatement ();

      // Save result
        ResultSet rset;
        rset = stmt.executeQuery ("select * from students");

      // Print
      while (rset.next ()) {
         System.out.print (rset.getString (1)+"  ");
         System.out.print (rset.getString (2)+"  ");
         System.out.print (rset.getString (3)+"  ");
         System.out.print (rset.getString (4)+"  ");
         System.out.print (rset.getString (5)+"  ");
         System.out.println (rset.getString (6)+"  ");
      }
    }
    catch (SQLException e) { e.printStackTrace(System.out);}
     catch (Exception e) {System.out.println (e);}
    
}

}