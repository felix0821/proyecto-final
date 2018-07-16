package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Usuario {
@PrimaryKey
@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long
id;
@Persistent private String nombre;
@Persistent private String apellido;
@Persistent private int dni;
@Persistent private String email;

public Usuario(String nombre,String apellido,int dni,String email){
	this.nombre=nombre;
	this.apellido=apellido;
	this.dni=dni;
	this.email=email;
}

public Long getId() {
	return id;
}

public void setId(Long id) {
	this.id = id;
}

public int getDni() {
	return dni;
}

public void setDni(int dni) {
	this.dni = dni;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getApellido() {
	return apellido;
}

public void setApellido(String apellido) {
	this.apellido = apellido;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}
}
