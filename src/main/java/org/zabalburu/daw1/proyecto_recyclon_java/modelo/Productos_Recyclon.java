/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.zabalburu.daw1.proyecto_recyclon_java.modelo;

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
public class Productos_Recyclon {
    @EqualsAndHashCode.Include
    private int idProducto;
    private String nombre;
    private String descripcion;
    private String tipo_Material;
    private double precio;
    
    @Override
    public String toString(){
        return "Id del producto: " + this.idProducto + " - " + "nombre del producto: " + this.getNombre() + " - " + "Precio: " + this.getPrecio();
    }
}
