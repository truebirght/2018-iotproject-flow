package com.FlowProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ClassPathResource;

@SpringBootApplication
@EnableCaching
public class FlowProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FlowProjectApplication.class, args);
	}
	
	 @Bean
	    public CacheManager cacheManager() {
	        return new EhCacheCacheManager(ehCacheCacheManager().getObject());
	    }

	    @Bean
	    public EhCacheManagerFactoryBean ehCacheCacheManager() {
	        EhCacheManagerFactoryBean factory = new EhCacheManagerFactoryBean();
	        factory.setConfigLocation(new ClassPathResource("/xml/ehcache.xml"));
	        factory.setShared(true);
	        return factory;
	    }
}
