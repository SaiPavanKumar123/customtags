package com.ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class Dropdown extends TagSupport {

    private String table, col, val, dburl, username, password, driver;
    private Connection con;

    public void setTable(String table) {
        this.table = table;
    }

    public void setCol(String col) {
        this.col = col;
    }

    public void setVal(String val) {
        this.val = val;
    }

    public void setDburl(String dburl) {
        this.dburl = dburl;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public int doStartTag() {
        JspWriter out = pageContext.getOut();
        try {
           
            Class.forName(driver);

        
            con = DriverManager.getConnection(dburl, username, password);

            
            String sql;
            if (val != null) {
                sql = "SELECT " + col + "," + val + " FROM " + table;
            } else {
                sql = "SELECT " + col + " FROM " + table;
            }
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

          
            while (rs.next()) {
                String columnValue = rs.getString(col);
                if (val != null) {
                    String value = rs.getString(val);
                    columnValue += " (" + value + ")";
                }
                out.println("<option value='" + columnValue + "'>" + columnValue + "</option>");
            }

            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return SKIP_BODY;
    }
}
