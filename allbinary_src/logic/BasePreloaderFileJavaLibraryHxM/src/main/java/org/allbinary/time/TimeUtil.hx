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
        var year : Int = jre.lang.JavaObject.intValue(yearString);
        var month : Int = jre.lang.JavaObject.intValue(monthString);
        var day : Int = jre.lang.JavaObject.intValue(dayString);
        var hour : Int = jre.lang.JavaObject.intValue(hourString);
        calendar.set(year, month, day, hour, 0);
    }

    public function setCalendarWithTime(calendar : Calendar, yearString : String, monthString : String, dayString : String, hourString : String, minuteString : String, secondString : String) : Void {
        var year : Int = jre.lang.JavaObject.intValue(yearString);
        var month : Int = jre.lang.JavaObject.intValue(monthString);
        var day : Int = jre.lang.JavaObject.intValue(dayString);
        var hour : Int = jre.lang.JavaObject.intValue(hourString);
        var minute : Int = jre.lang.JavaObject.intValue(minuteString);
        var second : Int = jre.lang.JavaObject.intValue(secondString);
        calendar.set(year, month, day, hour, minute, second);
    }

    public function setExpirationCalendar(calendar : Calendar, yearsString : String, monthsString : String, daysString : String, hoursString : String, minutesString : String, secondsString : String) : Void {
        var year : Int = calendar.get(Calendar.YEAR) + jre.lang.JavaObject.intValue(yearsString);
        var month : Int = calendar.get(Calendar.MONTH) + jre.lang.JavaObject.intValue(monthsString);
        var day : Int = calendar.get(Calendar.DAY_OF_MONTH) + jre.lang.JavaObject.intValue(daysString);
        var hour : Int = calendar.get(Calendar.HOUR) + jre.lang.JavaObject.intValue(hoursString);
        var minute : Int = calendar.get(Calendar.MINUTE) + jre.lang.JavaObject.intValue(minutesString);
        var second : Int = calendar.get(Calendar.SECOND) + jre.lang.JavaObject.intValue(secondsString);
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

