package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType=IdentityType.APPLICATION)
public class Report {
	@PrimaryKey
	@Persistent(valueStrategy=IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private Long idMonto;
	@Persistent
	private String Descripcion;
	@Persistent
	private Double Monto;
	@Persistent
	private String Operacion;
	public Report(String descripcion, Double monto, String operacion) {
		super();
		Descripcion = descripcion;
		Monto = monto;
		Operacion = operacion;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public Double getMonto() {
		return Monto;
	}
	public void setMonto(Double monto) {
		Monto = monto;
	}
	public String getOperacion() {
		return Operacion;
	}
	public void setOperacion(String operacion) {
		Operacion = operacion;
	}
	
	
	
}
