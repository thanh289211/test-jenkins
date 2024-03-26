//package com.foxtek.admin.server.core.security.exception;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;
//import org.springframework.security.oauth2.provider.error.WebResponseExceptionTranslator;
//import org.springframework.stereotype.Component;
//
//@Component("customWebResponseExceptionTranslator")
//public class CustomWebResponseExceptionTranslator implements WebResponseExceptionTranslator<OAuth2Exception> {
//    @Override
//    public ResponseEntity<OAuth2Exception> translate(Exception e) {
//        e.printStackTrace();
//        if (e instanceof OAuth2Exception) {
//            OAuth2Exception oAuth2Exception = (OAuth2Exception) e;
//            return ResponseEntity
//                    .status(oAuth2Exception.getHttpErrorCode())
//                    .body(new CustomOauthException(oAuth2Exception.getMessage()));
//
//        } else if (e instanceof AuthenticationException) {
//            AuthenticationException authenticationException = (AuthenticationException) e;
//            return ResponseEntity
//                    .status(HttpStatus.UNAUTHORIZED)
//                    .body(new CustomOauthException(authenticationException.getMessage()));
//        } else {
//            return ResponseEntity
//                    .status(HttpStatus.BAD_REQUEST)
//                    .body(new CustomOauthException(e.getMessage()));
//        }
//    }
//}
