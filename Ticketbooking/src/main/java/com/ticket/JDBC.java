package com.ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class JDBC {

	public ArrayList<Stations> connection() throws ClassNotFoundException {
		ArrayList<Stations> ar1 = new ArrayList<>();
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=pavan123";

		try {
			Connection conn = DriverManager.getConnection(url);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from train");

			while (rs.next()) {
				ar1.add(new Stations(rs.getString(3), rs.getString(4), rs.getString(2)));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar1;

	}

	public int insert(String from, String to, String train, String clas, String dt, ArrayList<Passenger> ap)
			throws ClassNotFoundException, SQLException {
		Class.forName("org.postgresql.Driver");
		Connection c = DriverManager.getConnection(
				"jdbc:postgresql://localhost:5432/postgres?user=postgres&password=pavan123");
		PreparedStatement ps = c
				.prepareCall("insert into pavan_ticket(from_station,to_station,train,class,td) values(?,?,?,?,?)");
		ps.setString(1, from);
		ps.setString(2, to);
		ps.setString(3, train);
		ps.setString(4, clas);
		ps.setString(5, dt);
		ResultSet rs = ps.executeQuery();
		int pnrno = 1589764;
		if (rs.next()) {
			pnrno = rs.getInt(1);
		}
		for (Passenger p : ap) {
			PreparedStatement ps1 = c.prepareCall("insert into pavan_passenger values(?,?,?,?)");
			ps1.setInt(4, pnrno);
			ps1.setString(1, p.getName());
			ps1.setString(3, p.getAge());
			ps1.setString(2, p.getGender());
			ps1.executeUpdate();
		}

		return pnrno;
	}

	public ArrayList<user> fcon() throws SQLException, ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5434/postgres","postgres","1234");
		Statement smt = con.createStatement();
		ArrayList<user> ae = new ArrayList<>();
		ResultSet rs = smt.executeQuery("select * from Huser");
		while(rs.next()) {
			ae.add(new user(rs.getString(1),rs.getString(2)));
		}
		return ae;
	}
	public void fconn(String ran,String user) throws SQLException, ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5434/postgres","postgres","1234");
		PreparedStatement smt = con.prepareStatement("update Huser set hkey=? where name=?");
		smt.setString(1, ran);
		smt.setString(2, user);
		smt.executeUpdate();
		
	}
	public String fconnn(String user) throws SQLException, ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5434/postgres","postgres","1234");
		PreparedStatement smt = con.prepareStatement("select hkey from Huser where name=?");
		smt.setString(1, user);
		ResultSet rs = smt.executeQuery();
		String coll="";
		if(rs.next()) {
			coll=rs.getString(1);
		}
		return coll;
		
	}

	

}