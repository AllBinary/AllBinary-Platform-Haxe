// Generated Code Do Not Modify
package org.allbinary.time;

//import java.util.Calendar;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class TimeTypeTest {
    private static function millisForHourLocal(hour : Int) : haxe.Int64 {
        var cal : Calendar = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, hour);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTimeInMillis();
    }

    // Java inner class: Haxe does not nest classes so move this to its own module
    class TestableTimeTypeUtil extends TimeTypeUtil {
        private final hour : Int;
        public function new(hour : Int) {
            super();
            this.hour = hour;
        }

        public override function getHourOfDay() : Int {
            return this.hour;
        }

    }
    public function isNight_returnsTrue_for_hours_less_than_6() : Void {
        /* Otherwise - statement - ForEachStmt */
    }

    public function isNight_returnsTrue_for_hours_greater_than_18() : Void {
        /* Otherwise - statement - ForEachStmt */
    }

    public function isNight_returnsFalse_for_boundary_hours_6_and_18() : Void {
        /* Otherwise - statement - ForEachStmt */
    }

    public function getNightOrDay_returns_expected_label() : Void {
        var nightUtil : TimeTypeUtil = new TestableTimeTypeUtil(0);
        Assertions.assertEquals(nightUtil.NIGHT, nightUtil.getNightOrDay());
        var dayUtil : TimeTypeUtil = new TestableTimeTypeUtil(12);
        Assertions.assertEquals(dayUtil.DAY, dayUtil.getNightOrDay());
    }

    public function getHourOfDay_long_converts_epoch_to_local_hour() : Void {
        var util : TimeTypeUtil = new TimeTypeUtil();
        /* Otherwise - statement - ForEachStmt */
    }

    public function isNight_long_expected_ranges() : Void {
        var util : TimeTypeUtil = new TimeTypeUtil();
        /* Otherwise - statement - ForEachStmt */
        /* Otherwise - statement - ForEachStmt */
    }

    public function getNightOrDay_long_consistency() : Void {
        var util : TimeTypeUtil = new TimeTypeUtil();
        var nightMillis : haxe.Int64 = TimeTypeTest.millisForHourLocal(0);
        var dayMillis : haxe.Int64 = TimeTypeTest.millisForHourLocal(12);
        Assertions.assertEquals(util.NIGHT, util.getNightOrDay(nightMillis));
        Assertions.assertEquals(util.DAY, util.getNightOrDay(dayMillis));
    }

    public function boundaries_day_for_long_based_api() : Void {
        var util : TimeTypeUtil = new TimeTypeUtil();
        /* Otherwise - statement - ForEachStmt */
    }

    public function constants_accessible_and_stable() : Void {
        var util : TimeTypeUtil = new TimeTypeUtil();
        Assertions.assertEquals("Night", util.NIGHT);
        Assertions.assertEquals("Day", util.DAY);
    }

    public function getInstance_returns_same_singleton() : Void {
        var a : TimeTypeUtil = TimeTypeUtil.getInstance();
        var b : TimeTypeUtil = TimeTypeUtil.getInstance();
        Assertions.assertSame(a, b);
    }

    public function new() {
    }
}

