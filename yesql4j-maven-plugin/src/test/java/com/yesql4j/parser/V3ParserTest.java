package com.yesql4j.parser;

import com.yesql4j.antlr.YeSQLGrammar2Lexer;
import com.yesql4j.antlr.YeSQLGrammar2Parser;
import com.yesql4j.antlr.YeSQLGrammar3Lexer;
import com.yesql4j.antlr.YeSQLGrammar3Parser;
import com.yesql4j.utils.ClassPathResource;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Vasiliy Dronov
 */
public class V3ParserTest {

    @Test
    void testHappyPath() {
        String sql = new ClassPathResource("v2/happy_path.sql").getContent();

        var lexer = new YeSQLGrammar3Lexer(CharStreams.fromString(sql));

        var parser = new YeSQLGrammar3Parser(new CommonTokenStream(lexer));
        parser.addErrorListener(new BaseErrorListener() {
            @Override
            public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
                System.out.println("msg = " + msg);
            }
        });

        System.out.println("version: " + parser.dao().version().NUMBER().getText());


    }

    private static class Query {
        String name;
        Map<String, String> resultTypes = new HashMap<>();
        List<String> params = new ArrayList<>();
    }


}
