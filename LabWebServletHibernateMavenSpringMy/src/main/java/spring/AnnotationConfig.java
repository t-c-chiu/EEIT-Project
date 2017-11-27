package spring;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import model.CustomerBean;
import model.ProductBean;

@Configuration
@ComponentScan(basePackages = { "model" })
@EnableTransactionManagement
public class AnnotationConfig {

	@Bean
	public DataSource dataSource() {
		try {
			InitialContext ctx = new InitialContext();
			return (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			throw new ExceptionInInitializerError(e);
		}
	}

	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		builder.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		builder.setProperty("show_sql", "true");
		builder.addAnnotatedClasses(CustomerBean.class, ProductBean.class);
		return builder.buildSessionFactory();
	}

	@Bean
	public HibernateTransactionManager transactionManager() {
		return new HibernateTransactionManager(sessionFactory());
	}
}
