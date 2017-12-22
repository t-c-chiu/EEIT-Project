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
@ComponentScan(basePackages = { "controller.admin" })
@EnableWebMvc
public class SpringMvcConfigAdmin extends AbstractAnnotationConfigDispatcherServletInitializer
		implements WebMvcConfigurer {
	@Autowired
	private ServletContext application;

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		XmlViewResolver xmlViewResolver = new XmlViewResolver();
		Resource location = new ServletContextResource(application, "/WEB-INF/adminViews.xml");
		xmlViewResolver.setLocation(location);
		registry.viewResolver(xmlViewResolver);
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { SpringMvcConfigAdmin.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "*.admin" };
	}

	@Override
	protected String getServletName() {
		return "springMvcConfigAdmin";
	}
}
