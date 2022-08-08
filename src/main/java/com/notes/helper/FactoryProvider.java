package com.notes.helper;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
public class FactoryProvider {
	public static SessionFactory factory;
	public static SessionFactory getConnection() {
		factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		return factory;
	}
	
}
