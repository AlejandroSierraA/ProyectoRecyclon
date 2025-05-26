/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.zabalburu.daw1.proyecto_recyclon_java.conexion;

import java.sql.Connection;
import java.sql.SQLException;
import oracle.jdbc.datasource.impl.OracleDataSource;

/**
 *
 * @author DAW1
 */
public class Conexion {
 private static Connection cnn;

    public static Connection getConnection() {
        if (cnn == null) {
            try {
                OracleDataSource ds = new OracleDataSource();
                ds.setDatabaseName("xe");
                ds.setUser("c##daw1");
                ds.setPassword("tiger");
                ds.setPortNumber(1521);
                ds.setDriverType("thin");
                ds.setServerName("localhost");
                cnn = ds.getConnection();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return cnn;
    }

    private Conexion(){}
    
    
}
