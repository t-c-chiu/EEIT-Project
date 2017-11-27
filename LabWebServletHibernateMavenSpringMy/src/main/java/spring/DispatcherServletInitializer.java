package spring;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class DispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { MvcAnnotationConfig.class };
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
