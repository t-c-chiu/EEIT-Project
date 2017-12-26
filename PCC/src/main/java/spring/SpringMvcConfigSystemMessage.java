package spring;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

@Configuration
@ComponentScan(basePackages = { "controller.systemmsg" })
@EnableWebMvc
public class SpringMvcConfigSystemMessage extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { SpringMvcConfigSystemMessage.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "*.sysMsg" };
	}

	@Override
	protected String getServletName() {
		return "springMvcConfigSystemMessage";
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

}
