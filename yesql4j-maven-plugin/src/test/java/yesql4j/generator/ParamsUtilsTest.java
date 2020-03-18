package yesql4j.generator;

import org.junit.jupiter.api.Test;
import yesql4j.parser.SQLParamsFinder;
import yesql4j.parser.SQLQueryDefinition;

import java.util.Arrays;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.*;

class ParamsUtilsTest {

    @Test
    void cleanupQuery() {
        String query = "SELECT name FROM test_table WHERE a = :a1 AND b = ? AND c = :a;";

        SQLQueryDefinition queryDefinition = new SQLQueryDefinition(
                "test",
                query
        );

        assertEquals(
                "SELECT name FROM test_table WHERE a = ? AND b = ? AND c = ?;",
                ParamsUtils.cleanupQuery(queryDefinition)
        );
    }

    @Test
    void getQueryParamsNamesAndBinding() {
        String query = "SELECT name FROM test_table WHERE a = :a AND b = ? AND c = :a AND d = :b AND e = ?;";

        SQLQueryDefinition queryDefinition = new SQLQueryDefinition(
                "test",
                query
        );

        assertEquals(
                Arrays.asList("a", "p0", "b", "p1"),
                ParamsUtils.getQueryParamsNames(queryDefinition)
        );

        assertEquals(
                Arrays.asList("a", "p0", "a", "b", "p1"),
                ParamsUtils.getQueryParamsBinding(queryDefinition)
        );
    }
}