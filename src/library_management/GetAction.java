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
public class GetAction {
    public static int saveBook(String callno,String name,String author,String publisher,int quantity){
  int status=0;
  try{
    Connection con=DB.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into books(callno,name,author,publisher,quantity) values(?,?,?,?,?)");
    ps.setString(1,callno);
    ps.setString(2,name);
    ps.setString(3,author);
    ps.setString(4,publisher);
    ps.setInt(5,quantity);
    status=ps.executeUpdate();
    con.close();
  }catch(Exception e){System.out.println(e);}
  return status;
}
    
    public static int saveLib(String name,String password,String email,String address,String city,String contact){
    int status=0;
    try{
      Connection con=DB.getConnection();
      PreparedStatement ps=con.prepareStatement("insert into librarian(name,password,email,address,city,contact) values(?,?,?,?,?,?)");
      ps.setString(1,name);
      ps.setString(2,password);
      ps.setString(3,email);
      ps.setString(4,address);
      ps.setString(5,city);
      ps.setString(6,contact);
      status=ps.executeUpdate();
      con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
  }
  public static int deleteLib(int id){
    int status=0;
    try{
      Connection con=DB.getConnection();
      PreparedStatement ps=con.prepareStatement("delete from librarian where id=?");
      ps.setInt(1,id);
      status=ps.executeUpdate();
      con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
  }

  public static boolean validateLib(String name,String password){
    boolean status=false;
    try{
      Connection con=DB.getConnection();
      PreparedStatement ps=con.prepareStatement("select * from librarian where name=? and password=?");
      ps.setString(1,name);
      ps.setString(2,password);
      ResultSet rs=ps.executeQuery();
      status=rs.next();
      con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
  }
public static int deleteBook(String bookcallno,int studentid){
    int status=0;
    try{
      Connection con=DB.getConnection();
      
      status=updateBook(bookcallno);//updating quantity and issue
      
      if(status>0){
      PreparedStatement ps=con.prepareStatement("delete from issuebooks where bookcallno=? and studentid=?");
      ps.setString(1,bookcallno);
      ps.setInt(2,studentid);
      status=ps.executeUpdate();
      }
      
      con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
  }
  public static int updateBook(String bookcallno){
    int status=0;
    int quantity=0,issued=0;
    try{
      Connection con=DB.getConnection();
      
      PreparedStatement ps=con.prepareStatement("select quantity,issued from books where callno=?");
      ps.setString(1,bookcallno);
      ResultSet rs=ps.executeQuery();
      if(rs.next()){
        quantity=rs.getInt("quantity");
        issued=rs.getInt("issued");
      }
      
      if(issued>0){
      PreparedStatement ps2=con.prepareStatement("update books set quantity=?,issued=? where callno=?");
      ps2.setInt(1,quantity+1);
      ps2.setInt(2,issued-1);
      ps2.setString(3,bookcallno);
      
      status=ps2.executeUpdate();
      }
      con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
  }  
}
