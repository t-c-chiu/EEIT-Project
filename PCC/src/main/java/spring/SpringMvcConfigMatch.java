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
@ComponentScan(basePackages= {"controller.match"})
@EnableWebMvc
public class SpringMvcConfigMatch extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {
	
	@Autowired
	private ServletContext application;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		XmlViewResolver XmlViewResolver = new XmlViewResolver();
		Resource resource = new ServletContextResource(application, "/WEB-INF/matchViews.xml");
		XmlViewResolver.setLocation(resource);
		registry.viewResolver(XmlViewResolver);
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {SpringMvcConfigMatch.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"*.match"};
	}

	@Override
	protected String getServletName() {
		return "springMvcConfigMatch";
	}
	
	
	

}
