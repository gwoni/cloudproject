package org.cloudfoundry.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import argo.jdom.JdomParser;
import argo.jdom.JsonNode;
import argo.jdom.JsonRootNode;
import org.cloudfoundry.services.*;

public enum ServiceManager implements CloudFoundryServices {

INSTANCE;

private static final String NULL_STRING = "";

public Object getInstance(int service_type) throws Exception {
if (service_type == MYSQL) {
	return getMySQLConnection();
	} else {
	throw new IllegalArgumentException("Service for id " + service_type + " not found...");
	}
}

private Object getMySQLConnection() throws SQLException {
	String vcap_services = System.getenv("VCAP_SERVICES");

	String hostname = NULL_STRING;
	String dbname = NULL_STRING;
	String user = NULL_STRING;
	String password = NULL_STRING;
	String port = NULL_STRING;

	if (vcap_services != null && vcap_services.length() > 0) {
	try {
		JsonRootNode root = new JdomParser().parse(vcap_services);

		JsonNode mysqlNode = root.getNode("mysql-5.1");
		JsonNode credentials = mysqlNode.getNode(0).getNode("credentials");

		dbname = credentials.getStringValue("name");
		hostname = credentials.getStringValue("hostname");
		user = credentials.getStringValue("user");
		password = credentials.getStringValue("password");
		port = credentials.getNumberValue("port");

		String dbUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbname + 
		  "?useUnicode=true&characterEncoding=UTF8";

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(dbUrl, user, password);
		return connection;
		} catch (Exception e) {
		throw new SQLException(e);
		}
	}

	return null;
	}
}