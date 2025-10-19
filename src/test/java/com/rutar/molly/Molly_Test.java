package com.rutar.molly;

import java.io.*;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

// ............................................................................

/**
 * Клас Molly_Test
 * @author Rutar_Andriy
 * 19.10.2025
 */

@DisplayName("Main test class")
public class Molly_Test {

private static final String RESOURCES_PATH =
    "src/test/resources/com/rutar/molly/";

///////////////////////////////////////////////////////////////////////////////

@Test
@DisplayName("Should pass")
void should_Answer_With_True()
    { assertTrue(true); }

///////////////////////////////////////////////////////////////////////////////

@Test
@DisplayName("File .empty exist")
void file_Empty_Exist()
    { File file = new File(RESOURCES_PATH + ".empty");
      assertTrue(file.exists()); }

///////////////////////////////////////////////////////////////////////////////
    
// @Test
// @Disabled("skipped")
// @DisplayName("Should skip")
// void should_Skip() {
//     fail("This error will be skipped");
// }

///////////////////////////////////////////////////////////////////////////////

// @Test
// @DisplayName("Should fail")
// void should_Fail() {
//     fail("Some error ...");
// }

// Кінець класу Molly_Test ////////////////////////////////////////////////////

}
