package connection;
import com.mysql.jdbc.*;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyCon
{
  static Connection con=null;
  static
  {
    try
    { Class.forName("com.mysql.jdbc.Driver");
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
    { con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/zipzapzoom","root","");
        System.out.println("Connection established");
    }
    catch(SQLException e)
    {System.out.println(e);
    }
    return con;
   }
  }
