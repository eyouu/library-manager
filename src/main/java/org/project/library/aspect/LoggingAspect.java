package org.project.library.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    private static final Logger logger = Logger.getLogger(LoggingAspect.class);

    @Pointcut("execution(* org.project.library.controller.*.*(..))")
    private void forControllerPackage() {}

    @Pointcut("execution(* org.project.library.service.*.*(..))")
    private void forServicePackage() {}

    @Pointcut("execution(* org.project.library.dao.*.*(..))")
    private void forDaoPackage() {}

    @Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
    private void forAppFlow() {}

    @Before("forAppFlow()")
    public void before(JoinPoint joinPoint) {
        String method = joinPoint.getSignature().toShortString();

        logger.info("Calling method: " + method);

        Object[] args = joinPoint.getArgs();
        for (Object temp: args) {
            logger.info("argument: " + temp);
        }
    }

    @AfterReturning(pointcut = "forAppFlow()")
    public void afterReturning(JoinPoint joinPoint) {
        String method = joinPoint.getSignature().toShortString();

        logger.info("Returning from method: " + method);
    }
}
