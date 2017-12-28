package spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages = { "controller.shopping" })
@EnableWebMvc
public class SpringMvcConfigShoppingMAll  
				extends AbstractAnnotationConfigDispatcherServletInitializer 
				implements WebMvcConfigurer	{
	@Autowired
	private ServletContext application;
	
	//為了解析      enctype="multipart/form-data"
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	//為了解析      enctype="multipart/form-data"
	
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		XmlViewResolver xmlViewResolver = new XmlViewResolver();
		Resource location = new ServletContextResource(application, "/WEB-INF/shoppingViews.xml");
		xmlViewResolver.setLocation(location);
		registry.viewResolver(xmlViewResolver);
		

	}



	@Override
	protected Class<?>[] getRootConfigClasses() {
		
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		/*
		<init-param>
			<param-name>contextConfigLocation</param-name> 
			<param-value>model.spring.SpringMvcJavaConfiguration</param-value> 	</init-param>
		*/

		return new Class[] {SpringMvcConfigShoppingMAll.class};
	}

	@Override
	protected String[] getServletMappings() {
		/*
		<servlet-mapping> 
			<servlet-name>DispatcherServlet</servlet-name>
			<url-pattern>*.controller</url-pattern> 
		</servlet-mapping>	
		*/

		return new String[] {"*.shopping"};
	}
	
	@Override
	protected String getServletName() {
		
		return "springMvcConfigShoppingMAll";
	}

}
