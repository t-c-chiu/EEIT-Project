package spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages = { "controller.login" })
@EnableWebMvc
public class LoginMvcConfig extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {
	@Autowired
	private ServletContext application;

	public void configureViewResolvers(ViewResolverRegistry registry) {
		Resource resource = new ServletContextResource(application, "/WEB-INF/loginViews.xml");
		XmlViewResolver viewResolver = new XmlViewResolver();
		viewResolver.setLocation(resource);
		registry.viewResolver(viewResolver);
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { LoginMvcConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "*.login" };
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected String getServletName() {
		return "loginMvcConfig";
	}

}
