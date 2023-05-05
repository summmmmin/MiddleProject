package com.yedam.user.control;

import java.security.SecureRandom;

public class TokenGenerator {
    private static final String CHARACTERS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static final int LENGTH = 32;
    
    private static SecureRandom random = new SecureRandom();
    
    public static String generateToken() {
        char[] chars = new char[LENGTH];
        for (int i = 0; i < chars.length; i++) {
            chars[i] = CHARACTERS.charAt(random.nextInt(CHARACTERS.length()));
        }
        return new String(chars);
    }
}
