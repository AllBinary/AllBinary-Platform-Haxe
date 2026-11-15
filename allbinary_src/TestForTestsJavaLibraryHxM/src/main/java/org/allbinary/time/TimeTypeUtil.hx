// Generated Code Do Not Modify
package org.allbinary.time;

//import java.util.Calendar;
//import java.util.TimeZone;

class TimeTypeUtil {
    private static final instance : TimeTypeUtil = new TimeTypeUtil();
    public static function getInstance() : TimeTypeUtil {
        return TimeTypeUtil.instance;
    }

    public final NIGHT : String = "Night";
    public final DAY : String = "Day";
    public function isNight() : Bool {
        final hoursOfDay : Int = this.getHourOfDay();
        return hoursOfDay < 6 || hoursOfDay > 18;
    }

    public function getHourOfDay() : Int {
        final calendar : Calendar = Calendar.getInstance();
        return calendar.get(Calendar.HOUR_OF_DAY);
    }

    public function getNightOrDay() : String {
        return (this.isNight() ? this.NIGHT : this.DAY);
    }

    public function getHourOfDay(timeInMillis : haxe.Int64) : Int {
        final calendar : Calendar = Calendar.getInstance();
        calendar.setTimeInMillis(timeInMillis);
        return calendar.get(Calendar.HOUR_OF_DAY);
    }

    public function isNight(timeInMillis : haxe.Int64) : Bool {
        final hoursOfDay : Int = this.getHourOfDay(timeInMillis);
        return hoursOfDay < 6 || hoursOfDay > 18;
    }

    public function getNightOrDay(timeInMillis : haxe.Int64) : String {
        return (this.isNight(timeInMillis) ? this.NIGHT : this.DAY);
    }

    public function new() {
    }
}

