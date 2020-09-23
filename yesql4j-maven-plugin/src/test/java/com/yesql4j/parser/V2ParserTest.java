package com.yesql4j.parser;

import com.yesql4j.antlr.YeSQLGrammar2Lexer;
import com.yesql4j.antlr.YeSQLGrammar2Parser;
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
public class V2ParserTest {

    @Test
    void testHappyPath() {
        String sql = new ClassPathResource("v2/happy_path.sql").getContent();

        var lexer = new YeSQLGrammar2Lexer(CharStreams.fromString(sql));
        var parser = new YeSQLGrammar2Parser(new CommonTokenStream(lexer));
        parser.addErrorListener(new BaseErrorListener() {
            @Override
            public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
                System.out.println("msg = " + msg);
            }
        });

        System.out.println("version: " + parser.dao().version().NUMBER().getText());

        parser.dao().queries().query().forEach(
                query -> {
                    String name = query.name().NON_WS().getText();
                    System.out.println("name = " + name + ", params:");
                    query.param().forEach(
                            param -> {
                                String paramType = param.NON_WS().get(0).getText();
                                String paramName = param.NON_WS().get(1).getText();
                                System.out.println("paramName = " + paramName + ", paramType = " + paramType);
                            }
                    );
//                    List<YeSQLGrammar2Parser.ResultTypeHolderLineContext> results = query.statement().resultTypeHolderLine();
//                    if (results != null) {
//                        results.forEach(it ->
//                                {
//                                    String resultName = it.alias().WORD().getText();
//                                    String resultType = it.type().getText();
//                                    System.out.println("resultType = " + resultType + ", resultName = " + resultName);
//                                }
//                        );
//                    }
                }
        );
    }

    private static class Query {
        String name;
        Map<String, String> resultTypes = new HashMap<>();
        List<String> params = new ArrayList<>();
    }


}
