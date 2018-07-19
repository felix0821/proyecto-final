package model.entity;

import java.util.ArrayList;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class MaterialController {
@PrimaryKey
@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
@Persistent private Long project;
@Persistent private Long user;
@Persistent private Long material;
@Persistent private int cantidad;
@Persistent private String fechaSalida;
@Persistent private String fechaEntrada;
@Persistent private boolean status;

public MaterialController(Long proyect, Long user, Long materials, int cantidad, String fechaS, String fechaE){
	this.project=proyect;
	this.user=user;
	this.material=materials;
	this.fechaSalida=fechaS;
	this.fechaEntrada=fechaE;
	this.cantidad=cantidad;
	this.status=true;
}

public Long getId() {return id;}
public void setId(Long id) {this.id = id;}

public Long getProject() { return project;}
public void setProject(Long name) {this.project = name;}

public long getUser() {return user;}
public void setUser(Long user) {this.user = user;}

public Long getMaterials() { return material;}
public void setMaterials(Long materials) { this.material = materials;}

public int getCantidad() { return cantidad;}
public void setCantidad(int cantidad) { this.cantidad = cantidad;}

public String getFechaSalida() {return fechaSalida;}
public void setFechaSalida(String fechaS) { this.fechaSalida =fechaS;}

public String getFechaEntrada() {return fechaEntrada;}
public void setFechaEntrada(String fechaE) { this.fechaEntrada =fechaE;}

public boolean getStatus() {return status;}
public void setStatus(boolean status) { this.status =status;}
}
