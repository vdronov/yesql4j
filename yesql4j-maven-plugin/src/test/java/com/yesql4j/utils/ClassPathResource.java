package com.yesql4j.utils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @author Vasiliy Dronov
 */
public class ClassPathResource {

    private final String path;

    public ClassPathResource(String path) {
        this.path = path;
    }

    public String getContent(){
        try {
            Path path = Paths.get(getClass().getResource("/" + this.path).toURI());
            return new String(Files.readAllBytes(path));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
