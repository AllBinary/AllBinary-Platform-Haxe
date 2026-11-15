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
package org.allbinary.business.time;


class TimeData {
    private static final instance : TimeData = new TimeData();
    public static function getInstance() : TimeData {
        return TimeData.instance;
    }

    public function new() {
    }

    public final NAME : String = "TIME_NAME";
    public final START : String = "TIME_START";
    public final END : String = "TIME_END";
}

