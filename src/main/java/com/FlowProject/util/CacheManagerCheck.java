package com.FlowProject.util;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import net.sf.ehcache.CacheManager;

@Component
class CacheManagerCheck implements CommandLineRunner {
    private final CacheManager cacheManager;

    public CacheManagerCheck(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

    @Override
    public void run(String... strings) throws Exception {
        System.out.println("\n\n" + "=========================================================\n" + "Using cache manager: " + this.cacheManager.getClass().getName() + "\n" + "=========================================================\n\n");
    }
}