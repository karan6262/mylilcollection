/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mylilcollection;

import java.sql.*;

/**
 *
 * @author karan
 */
public class Product {

    String URL = "jdbc:mysql://localhost:3306/mylilcollection";
    String USERNAME = "root";
    String PASSWORD = "";

    Connection con =null;

    PreparedStatement selectProd = null;

    public ResultSet getProductsById(String ids) {

        ResultSet rs = null;
        try {
        	con =  DriverManager.getConnection(URL, USERNAME, PASSWORD);
            if (ids.equals("")) {
                ids = "0";
            }
            selectProd = con.prepareStatement("SELECT * FROM prod_detail  WHERE prod_id in (" + ids + ")");
            rs = selectProd.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }

}
