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
@ComponentScan(basePackages = { "controller" })
@EnableWebMvc
public class SpringMvcConfig extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {

	@Autowired
	private ServletContext serlvetContext;

	// @Override
	// public void addInterceptors(InterceptorRegistry registry) {
	// registry.addInterceptor(new DemoInterceptor()).addPathPatterns("/secure/*");
	// }

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		XmlViewResolver viewResolver = new XmlViewResolver();
		Resource resource = new ServletContextResource(serlvetContext, "/WEB-INF/myVs.xml");
		viewResolver.setLocation(resource);
		registry.viewResolver(viewResolver);
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { SpringMvcConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "*.controller" };
	}

	// @Bean
	// public XmlViewResolver xvr() {
	// XmlViewResolver viewResolver = new XmlViewResolver();
	// Resource resource = new ServletContextResource(serlvetContext,
	// "/WEB-INF/myVs2.xml");
	// viewResolver.setLocation(resource);
	// System.out.println("xvr2");
	// return viewResolver;
	// }

	// @Bean
	// public ResourceBundleViewResolver rbvr() {
	// ResourceBundleViewResolver rbvr = new ResourceBundleViewResolver();
	// rbvr.setBasename("abc");
	// System.out.println("rbvr");
	// return rbvr;
	// }
}
