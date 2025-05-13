/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.zabalburu.daw1.proyecto_recyclon_java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.zabalburu.daw1.proyecto_recyclon_java.conexion.Conexion;
import org.zabalburu.daw1.proyecto_recyclon_java.modelo.Administradores;
import org.zabalburu.daw1.proyecto_recyclon_java.modelo.Productos_Recyclon;
import org.zabalburu.daw1.proyecto_recyclon_java.modelo.Usuarios;

/**
 *
 * @author DAW1
 */
public class DAO {
    private Connection cnn = Conexion.getConnection();
    
    public List<Productos_Recyclon> getProductos(){
        List<Productos_Recyclon> productos = new ArrayList<>();
        try {
            ResultSet rst = cnn.createStatement()
                    .executeQuery("""
                                                  Select * From Productos_Recyclon
                                                  Order By idProducto
                                                  """);
            while(rst.next()){
                productos.add(crearProducto(rst));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productos;
    }
    public List<Administradores> getAdministradores(){
        List<Administradores> Admin = new ArrayList<>();
        try {
            ResultSet rst = cnn.createStatement()
                    .executeQuery("""
                                                      Select * From Administradores
                                                      Order By id_Administrador
                                                      """);
            while(rst.next()){
                Admin.add(crearAdministrador(rst));
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Admin;
    }
private Productos_Recyclon crearProducto(ResultSet rst) throws SQLException {
        Productos_Recyclon p = new Productos_Recyclon();
        p.setIdProducto(rst.getInt("idProducto"));
        p.setNombre(rst.getString("nombre"));
        p.setDescripcion(rst.getString("descripcion"));
        p.setTipo_Material(rst.getString("tipo_Material"));
        p.setPrecio(rst.getDouble("precio"));
        return p;
    }
    public List<Usuarios> getUsuarios(){
        List<Usuarios> usuarios = new ArrayList<>();
        try {
            ResultSet rst = cnn.createStatement()
                    .executeQuery("""
                                  Select * From Usuarios
                                  Order by id_Usuario
                                  """);
            while(rst.next()){
                usuarios.add(crearUsuario(rst));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuarios;   
    }

    private Usuarios crearUsuario(ResultSet rst) throws SQLException {
        Usuarios u = new Usuarios();
        u.setId_Usuario(rst.getInt("id_Usuario"));
        u.setNombre(rst.getString("nombre"));
        u.setApellido(rst.getString("apellido"));
        u.setEmail(rst.getString("email"));
        u.setDireccion(rst.getString("direccion"));
        u.setCP(rst.getString("CP"));
        u.setFecha_Creacion(rst.getDate("fecha_Creacion"));
        u.setTelefono(rst.getString("telefono"));
        return u;
    }
    
    public void modificarProducto(Productos_Recyclon modificado){
        try {
            PreparedStatement pst = cnn.prepareStatement("""
                                                         Update Productos_Recyclon
                                                         set nombre = ?,descripcion = ? ,tipo_Material = ?,
                                                         precio = ? Where idProducto = ?
                                                         """);
            pst.setString(1, modificado.getNombre());
            pst.setString(2, modificado.getDescripcion());
            pst.setString(3, modificado.getTipo_Material());
            pst.setDouble(4, modificado.getPrecio());
            pst.setInt(5, modificado.getIdProducto());
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void modificarUsuario(Usuarios modificado){
        try {
            PreparedStatement pst = cnn.prepareStatement("""
                                                                     Update Usuarios set
                                                                     nombre = ?,apellido = ?,email = ?,direccion = ?, CP = ?,fecha_Creacion = ?,telefono
                                                                     Where id_Usuario = ?
                                                                     """);
            pst.setString(1, modificado.getNombre());
            pst.setString(2, modificado.getApellido());
            pst.setString(3, modificado.getEmail());
            pst.setString(4, modificado.getDireccion());
            pst.setString(5, modificado.getCP());
            pst.setDate(6, modificado.getFecha_Creacion());
            pst.setString(7, modificado.getTelefono());
            pst.setInt(8, modificado.getId_Usuario());
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Productos_Recyclon nuevoProducto(Productos_Recyclon p){
        String sql = """
                     Insert Into Productos_Recyclon(idProducto,nombre,descripcion,tipo_Material,precio)
                     Values(?,?,?,?,?)
                     """;
        try {
            ResultSet rst = cnn.createStatement().executeQuery("""
                                                                           Select max(id) + 1 as maximum
                                                                           From Productos_Recyclon
                                                                           """);
            rst.next();
            int nextId = rst.getInt("maximum");
            if(rst.wasNull()){
                nextId = 1;
            }
            p.setIdProducto(nextId);
            PreparedStatement pst = cnn.prepareStatement(sql);
            pst.setInt(1, p.getIdProducto());
            pst.setString(2, p.getNombre());
            pst.setString(3, p.getDescripcion());
            pst.setString(4, p.getTipo_Material());
            pst.setDouble(5, p.getPrecio());
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return p;
    }
    public Usuarios nuevoUsuario(Usuarios u){
        String sql
                = """
                  Insert Into Usuarios(id_Usuario,nombre,apellido,email,direccion,CP,fecha_Creacion,telefono)
                  Values(?,?,?,?,?,?,?,?)
                  """;
        try {
            ResultSet rst = cnn.createStatement().executeQuery("""
                                                               Select max(id) + 1 as maximum
                                                               From Usuarios
                                                               """);
            rst.next();
            int nextId = rst.getInt("maximum");
            if(rst.wasNull()){
                nextId = 1;
            }
            u.setId_Usuario(nextId);
            PreparedStatement pst = cnn.prepareStatement(sql);
            pst.setInt(1, u.getId_Usuario());
            pst.setString(2, u.getNombre());
            pst.setString(3, u.getApellido());
            pst.setString(4, u.getEmail());
            pst.setString(5, u.getDireccion());
            pst.setString(6, u.getCP());
            pst.setDate(7, u.getFecha_Creacion());
            pst.setString(8, u.getTelefono());
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }
    public boolean eliminarUsuario(int id){
        try {
            PreparedStatement pst = cnn.prepareStatement(
                    """
                    Select count(*) as Cuenta
                    From Usuario Where id_Usuario =?
                    """);
            pst.setInt(1, id);
            ResultSet rst = pst.executeQuery();
            rst.next();
            if(rst.getInt("Cuenta")>0){
                return false;
            }
            pst = cnn.prepareStatement(
            """
            Delete Usuarios Where id_Usuario = ?
            """);
            pst.setInt(1, id);
            pst.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
   }
    public boolean eliminarProducto(int id){
        try {
            PreparedStatement pst = cnn.prepareStatement(
                    """
                        Select count(*) as Cuenta
                        From Productos_Recyclon Where idProducto = ?
                    """);
            pst.setInt(1, id);
            ResultSet rst = pst.executeQuery();
            rst.next();
            if(rst.getInt("Cuenta")>0){
                return false;
            }
            pst = cnn.prepareStatement("""
                                       Delete Producto_Recyclon Where idProducto = ?
                                       """);
            pst.setInt(1, id);
            pst.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private Administradores crearAdministrador(ResultSet rst) throws SQLException {
        Administradores ad = new Administradores();
        ad.setNombre(rst.getString("nombre"));
        ad.setApellido(rst.getString("apellido"));
        ad.setEmail(rst.getString("email"));
        ad.setDireccion(rst.getString("direccion"));
        ad.setCP(rst.getString("CP"));
        ad.setFecha_Creacion(rst.getDate("fecha_Creacion"));
        ad.setTelefono(rst.getString("telefono"));
        return ad;
    }
    
}
