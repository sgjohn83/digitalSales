package com.digitalsales.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@EnableWebMvc
@Configuration
@ComponentScan(basePackages="com.digitalsales.controller")
@ImportResource("classpath:com/digitalsales/config/spring-mvc-demo-servlet.xml")
@Import({ApplicationContext.class,SecurityConfiguration.class})
@PropertySource("classpath:/resources/mysql-connection.properties")
public class WebConfig extends org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter{
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver(){
		InternalResourceViewResolver viewResolver=new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		
		return viewResolver;
	}
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // when static resources are inside resources folder under WEB-INF
        // registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");

        // when static resources are inside static folder under webapp
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    }


}
