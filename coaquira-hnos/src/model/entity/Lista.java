package model.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Lista {
@PrimaryKey
@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long
id;
@Persistent private String correo;
@Persistent private String ip;
@Persistent private Date fecha;
public Lista(String correo,String ip,Date fecha){
	this.correo=correo;
	this.ip=ip;
	this.fecha=fecha;
	
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getCorreo() {
	return correo;
}
public void setCorreo(String correo) {
	this.correo = correo;
}
public String getIp() {
	return ip;
}
public void setIp(String ip) {
	this.ip = ip;
}
public Date getFecha() {
	return fecha;
}
public void setFecha(Date fecha) {
	this.fecha = fecha;
}


}