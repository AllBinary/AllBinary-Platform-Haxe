/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.time;

import jre.util.Calendar;

class TimeUtil {
    private static final instance : TimeUtil = new TimeUtil();
    public static function getInstance() : TimeUtil {
        return TimeUtil.instance;
    }

    public function setCalendar(calendar : Calendar, yearString : String, monthString : String, dayString : String, hourString : String) : Void {
        var year : Int = Std.int(yearString);
        var month : Int = Std.int(monthString);
        var day : Int = Std.int(dayString);
        var hour : Int = Std.int(hourString);
        calendar.set(year, month, day, hour, 0);
    }

    public function setCalendarWithTime(calendar : Calendar, yearString : String, monthString : String, dayString : String, hourString : String, minuteString : String, secondString : String) : Void {
        var year : Int = Std.int(yearString);
        var month : Int = Std.int(monthString);
        var day : Int = Std.int(dayString);
        var hour : Int = Std.int(hourString);
        var minute : Int = Std.int(minuteString);
        var second : Int = Std.int(secondString);
        calendar.set(year, month, day, hour, minute, second);
    }

    public function setExpirationCalendar(calendar : Calendar, yearsString : String, monthsString : String, daysString : String, hoursString : String, minutesString : String, secondsString : String) : Void {
        var year : Int = calendar.get(Calendar.YEAR) + Std.int(yearsString);
        var month : Int = calendar.get(Calendar.MONTH) + Std.int(monthsString);
        var day : Int = calendar.get(Calendar.DAY_OF_MONTH) + Std.int(daysString);
        var hour : Int = calendar.get(Calendar.HOUR) + Std.int(hoursString);
        var minute : Int = calendar.get(Calendar.MINUTE) + Std.int(minutesString);
        var second : Int = calendar.get(Calendar.SECOND) + Std.int(secondsString);
        calendar.set(year, month, day, hour, minute, second);
    }

    private static final calendar : Calendar = Calendar.getInstance();
    public function getTotalTime(yearString : String, monthString : String, dayString : String, hourString : String, minuteString : String, secondString : String) : haxe.Int64 {
        var time : haxe.Int64 = TimeUtil.calendar.getTimeInMillis();
        this.setExpirationCalendar(TimeUtil.calendar, yearString, monthString, dayString, hourString, minuteString, secondString);
        var timeDelta : haxe.Int64 = TimeUtil.calendar.getTimeInMillis();
        return timeDelta - time;
    }

    public function new() {
    }
}

