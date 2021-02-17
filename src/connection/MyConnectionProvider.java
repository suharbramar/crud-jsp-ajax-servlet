package connection;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class MyConnectionProvider  {
   
    Connection conn = null;
	
	public static Connection getCon() throws IOException  {
		
		Properties props = new Properties();
		InputStream in;
		try {
			in = MyConnectionProvider.class.getResourceAsStream("/config/db.properties");
			props.load(in);
			in.close();
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	

		String driver = props.getProperty("jdbc.driver");
		if (driver != null) {
		    try {
				Class.forName(driver) ;
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String url = props.getProperty("jdbc.url");
		String username = props.getProperty("jdbc.username");
		String password = props.getProperty("jdbc.password");

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
}
