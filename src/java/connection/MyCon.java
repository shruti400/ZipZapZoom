package connection;
//import com.mysql.jdbc.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyCon
{
  static Connection con=null;
  static
  {
    try
    { 
        Class.forName("org.mariadb.jdbc.Driver");
        System.out.println("Driver loaded");
    }
    catch(ClassNotFoundException e)
    {
            System.out.println(e);
            }     
// }
  
  }
  public static Connection getConnection() throws SQLException
  {
    try
    { 
//        con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/zipzapzoom","root","");
    
    con=(Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/zipzapzoom?user=admin&password=som");
    
        System.out.println("Connection established");
    }
    catch(SQLException e)
    {System.out.println(e);
    }
    return con;
   }
  }
