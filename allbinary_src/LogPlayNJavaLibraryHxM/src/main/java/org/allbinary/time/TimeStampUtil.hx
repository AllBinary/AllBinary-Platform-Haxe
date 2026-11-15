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

import com.google.gwt.i18n.client.DateTimeFormat;
//import java.util.Date;

//ActualPlatform
class TimeStampUtil {
    private static final instance : TimeStampUtil = new TimeStampUtil();
    public static function getInstance() : TimeStampUtil {
        return TimeStampUtil.instance;
    }

    public function new() {
    }

    public function getAsString() : String {
        final simpleDataFormat : DateTimeFormat = DateTimeFormat.getFormat("yyyy-MM-dd HH:mm:ss.SSS");
        final date : Date = new Date();
        return simpleDataFormat.format(date);
    }

}

