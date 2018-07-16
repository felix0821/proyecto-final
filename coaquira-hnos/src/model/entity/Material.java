package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Material {
@PrimaryKey
@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long
id;
@Persistent private String name;
@Persistent private double cost;
@Persistent private String fecha;
@Persistent private int quantity;

public Material(String name,double cost,String fecha,int quantity){
	this.name=name;
	this.cost=cost;
	this.fecha=fecha;
	this.quantity=quantity;
}
public Material(){
	this.name=null;
	this.cost=0;
	this.fecha=null;
	this.quantity=0;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public double getCost() {
	return cost;
}
public void setCost(String cost) {
	this.cost =Double.parseDouble(cost);
}
public String getFecha() {
	return fecha;
}
public void setDate(String fecha) {
	this.fecha = fecha;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity =Integer.parseInt(quantity);;
}
}
