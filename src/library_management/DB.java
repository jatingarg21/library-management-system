/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library_management;
import java.sql.*;
/**
 *
 * @author win8
 */
public class DB {
     public static Connection getConnection(){
    Connection con=null;
    try{
      Class.forName("com.mysql.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost/library","root","");
      
    }catch(Exception e){System.out.println(e);}
    return con;
  }
}
