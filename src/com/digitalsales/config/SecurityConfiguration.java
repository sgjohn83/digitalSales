package com.digitalsales.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	private DataSource dataSource;
	
	
	
	    @Autowired
	    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
	        auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(new BCryptPasswordEncoder());
	         
	    }
	    
	    @Bean 
	    public PasswordEncoder passwordEncoder() { 
	        return  new BCryptPasswordEncoder();
	    }
	   
	    
	
	    @Override
	    protected void configure(final HttpSecurity http) throws Exception {
	    	http
	        .csrf().disable()
	        .authorizeRequests()
	        //.antMatchers("/login/**").permitAll()
	        .antMatchers("/admin/**").hasRole("ADMIN")
	        .antMatchers("/anonymous*").anonymous()
	        .antMatchers("/**").permitAll()
	        .anyRequest().authenticated()
	    	.and()
	    	      .formLogin()
	    	      .loginPage("/login")
	    	      .loginProcessingUrl("/checklogin")
	    	      .defaultSuccessUrl("/dashboard", true)
	    	      .failureUrl("/login?error")
	    	     .and()
	    	     .logout()
	    	      .logoutUrl("/perform_logout")
	    	      .deleteCookies("JSESSIONID");
	    	      
	       
	    }
	    
	   
	   

}
