package spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

@Configuration
@ComponentScan(basePackages = { "controller" })
@EnableWebMvc
public class SpringMvcConfig extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {

	@Autowired
	private ServletContext application;

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	// @Override
	// public void configureViewResolvers(ViewResolverRegistry registry) {
	// XmlViewResolver xmlViewResolver = new XmlViewResolver();
	// Resource location = new ServletContextResource(application, "放自己View設定位置");
	// xmlViewResolver.setLocation(location);
	// }

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { SpringMvcConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "*.controller" };
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

}
