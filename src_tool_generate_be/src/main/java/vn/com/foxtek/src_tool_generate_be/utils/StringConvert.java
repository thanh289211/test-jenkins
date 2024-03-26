package vn.com.foxtek.src_tool_generate_be.utils;

import org.springframework.stereotype.Service;

@Service
public class StringConvert {
    public static String toSnakeCase(String input) {
        return input.replace('_','-');
    }

    public static String toTitleCase(String input) {
        // user_name  => User Name
        String[] parts = input.split("_");
        StringBuilder convertedString = new StringBuilder();
        for (String part : parts) {
            part = part.substring(0, 1).toUpperCase() + part.substring(1);
            convertedString.append(part).append(" ");
        }
        return convertedString.toString().trim();
    }

    public static String toCamelCase(String inputString) {
        // user_name  => userName
        String[] parts = inputString.split("_");
        StringBuilder convertedString = new StringBuilder(parts[0]);
        for (int i = 1; i < parts.length; i++) {
            String part = parts[i];
            part = part.substring(0, 1).toUpperCase() + part.substring(1);
            convertedString.append(part);
        }
        return convertedString.toString();
    }

    public static String toPascalCase(String input) {
        // user_name  => UserName
        if (input == null || input.isEmpty()) {
            return input;
        }
        StringBuilder result = new StringBuilder();
        boolean capitalizeNext = true;

        for (int i = 0; i < input.length(); i++) {
            char currentChar = input.charAt(i);
            if (currentChar == ' ' || currentChar == '_') {
                capitalizeNext = true;
            } else if (capitalizeNext) {
                result.append(Character.toUpperCase(currentChar));
                capitalizeNext = false;
            } else {
                result.append(currentChar);
            }
        }
        return result.toString();
    }

}

