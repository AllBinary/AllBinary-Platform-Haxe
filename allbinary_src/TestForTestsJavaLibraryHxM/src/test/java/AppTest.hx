// Generated Code Do Not Modify
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class AppTest {
    public function testAddition() : Void {
        Assertions.assertEquals(2, 1 + 1);
    }

    public function testStringEquality() : Void {
        var expected : String = "Hello World!";
        var actual : String = "Hello World!";
        Assertions.assertEquals(expected, actual);
    }

    public function testBooleanAssertions() : Void {
        Assertions.assertTrue(true);
        Assertions.assertFalse(false);
    }

    public function new() {
    }
}

