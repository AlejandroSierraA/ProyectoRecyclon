/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.zabalburu.daw1.proyecto_recyclon_java.modelo;

import java.util.Date;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author DAW1
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Setter
@Getter
public class Usuarios {
    @EqualsAndHashCode.Include
    private int id_Usuario;
    private String nombre;
    private String apellido;
    private String email;
    private String direccion;
    private String CP;
    private Date fecha_Creacion;
    private String telefono;
    
    @Override
    public String toString(){
        return "id del administrador: " + this.getId_Usuario() + " - " + " nombre del administrador: " + this.getNombre() + " " + this.apellido;
    }
}
