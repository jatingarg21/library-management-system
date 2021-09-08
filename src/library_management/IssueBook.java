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
public class IssueBook {
    public static boolean checkBook(String bookcallno){
  boolean status=false;
  try{
    Connection con=DB.getConnection();
    PreparedStatement ps=con.prepareStatement("select * from books where callno=? having quantity-issued>0");
    ps.setString(1,bookcallno);
      ResultSet rs=ps.executeQuery();
    status=rs.next();
    System.out.println("status : "+status);
    con.close();
  }catch(Exception e){System.out.println(e);}
  return status;
}

public static int save(String bookcallno,int studentid,String studentname,String studentcontact){
  int status=0;
  try{
    Connection con=DB.getConnection();
    
    status=updatebook(bookcallno);//updating quantity and issue
    
    if(status>0){
    PreparedStatement ps=con.prepareStatement("insert into issuebooks(bookcallno,studentid,studentname,studentcontact) values(?,?,?,?)");
    ps.setString(1,bookcallno);
    ps.setInt(2,studentid);
    ps.setString(3,studentname);
    ps.setString(4,studentcontact);
    status=ps.executeUpdate();
    }
    
    con.close();
  }catch(Exception e){System.out.println(e);}
  return status;
}
public static int updatebook(String bookcallno){
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
    
    if(quantity>0){
    PreparedStatement ps2=con.prepareStatement("update books set quantity=?,issued=? where callno=?");
    ps2.setInt(1,quantity-1);
    ps2.setInt(2,issued+1);
    ps2.setString(3,bookcallno);
    
    status=ps2.executeUpdate();
    }
    con.close();
  }catch(Exception e){System.out.println(e);}
  return status;
}
}
