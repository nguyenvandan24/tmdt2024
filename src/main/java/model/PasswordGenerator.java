package model;

import java.security.SecureRandom;

public class PasswordGenerator {
    private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";
    private static final String OTHER_CHAR = "!@#$%&*()_+-=[]|,./?><";

    private static final String PASSWORD_ALLOW_BASE = CHAR_LOWER + CHAR_UPPER + NUMBER + OTHER_CHAR;
    private static SecureRandom random = new SecureRandom();

    public static String generateRandomPassword(int length) {
        if (length < 1) throw new IllegalArgumentException("Length must be at least 1.");

        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int randomCharIndex = random.nextInt(PASSWORD_ALLOW_BASE.length());
            sb.append(PASSWORD_ALLOW_BASE.charAt(randomCharIndex));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        // Example of generating a random password with length 8
        String randomPassword = generateRandomPassword(8);
        System.out.println("Random Password: " + randomPassword);
    }
}
