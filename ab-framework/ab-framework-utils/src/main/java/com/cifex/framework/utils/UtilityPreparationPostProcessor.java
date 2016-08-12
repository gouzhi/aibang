package com.cifex.framework.utils;


import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

import com.cifex.framework.utils.MessageStrUtil;


@Component
public class UtilityPreparationPostProcessor {

    private static final Logger LOGGER = LoggerFactory.getLogger(UtilityPreparationPostProcessor.class);
 
    @Autowired
    @Qualifier("messageSource")
    private MessageSource messageSource;
     

    @PostConstruct
    public void postProcessAfterInitialization() throws BeansException {
        LOGGER.info("postProcessAfterInitialization() invoked");
        MessageStrUtil.setMessageSource(messageSource);
    }
	
}
