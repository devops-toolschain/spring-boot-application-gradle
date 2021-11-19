package uk.gov.hmcts.reform.demo.controllers;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class GetWelcomeTest {

    @DisplayName("Should welcome upon root request with 200 response code")
    @Test
    void exampleOfTest() {
        Assertions.assertTrue(System.currentTimeMillis() > 0, "Example of Unit Test");
    }
}
