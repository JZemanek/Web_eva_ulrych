/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.webEvaElrych.Security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * Konfigurační třída pro zabezpečení.
 * @author Jan Zemánek
 */
@Configuration
public class SecurityConfig{
    
    /**
     * Bean pro vytvoření šifračního objektu pro hesla uživatelů.
     * V této konfiguraci se použije BCryptPasswordEncoder.
     * @return BCryptPasswordEncoder
     */
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    
    /**
     * Bean pro konfiguraci uživatelů a jejich rolí. Vytvoření uživatele "admin" s rolí "ADMIN".
     * Heslo "admin" je zašifrováno pomocí BCryptPasswordEncoder.
     * @return UserDetailsService s definovaným uživatelem
     */
    @Bean
    public UserDetailsService userDetailsService() {
        UserDetails user = User.withUsername("admin")
            .password(passwordEncoder().encode("admin"))
            .roles("ADMIN")
            .build();
        return new InMemoryUserDetailsManager(user);
    }

    /**
     * Bean pro konfiguraci zabezpečení v aplikaci. Omezuje přístup k URL začínajícím "/administrace/**" pouze pro uživatele s rolí "ADMIN".
     * Nastavuje form-based přihlášení a vypnutí ochrany CSRF (Cross-Site Request Forgery).
     * @param http HttpSecurity objekt pro konfiguraci zabezpečení
     * @return SecurityFilterChain
     * @throws Exception
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeRequests(authorizeRequests ->
                authorizeRequests
                    .requestMatchers(AntPathRequestMatcher.antMatcher("/administrace/**"))
                    .hasRole("ADMIN")
            )
            .formLogin(Customizer.withDefaults())
            .logout(logout -> logout.logoutUrl("/logout"))
            .csrf(AbstractHttpConfigurer::disable);

        return http.build();
    }
}
