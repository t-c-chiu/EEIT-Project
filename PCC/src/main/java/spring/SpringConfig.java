package spring;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.context.AbstractContextLoaderInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import model.bean.Clazz;
import model.bean.CollectArticle;
import model.bean.Conversation;
import model.bean.Matching;
import model.bean.Member;
import model.bean.Order;
import model.bean.OrderDetail;
import model.bean.PostArticle;
import model.bean.Product;
import model.bean.ReplyArticle;
import model.bean.Reservation;
import model.bean.Room;
import model.bean.RoomReservation;
import model.bean.Servant;
import model.bean.Student;
import model.bean.SystemMessage;

@Configuration
@ComponentScan(basePackages = { "model" })
@EnableTransactionManagement
public class SpringConfig extends AbstractContextLoaderInitializer {

	@Bean
	public DataSource dataSource() {
		try {
			Context ctx = new InitialContext();
			return (DataSource) ctx.lookup("java:comp/env/jdbc/pcc");
		} catch (NamingException e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
	}

	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		builder.setProperty("hibernate.show_sql", "true");
		builder.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		builder.addAnnotatedClasses(Clazz.class, CollectArticle.class, Conversation.class, Matching.class, Member.class,
				Order.class, OrderDetail.class, PostArticle.class, Product.class, ReplyArticle.class, Reservation.class,
				Room.class, RoomReservation.class, Servant.class, Student.class, SystemMessage.class);
		return builder.buildSessionFactory();
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		return new HibernateTransactionManager(sessionFactory());
	}

	@Override
	protected WebApplicationContext createRootApplicationContext() {
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(SpringConfig.class);
		return ctx;
	}

}
