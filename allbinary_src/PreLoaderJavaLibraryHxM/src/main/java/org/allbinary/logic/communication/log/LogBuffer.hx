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
package org.allbinary.logic.communication.log;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;

class LogBuffer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var logEntryVector : BasicArrayList;
    public function new() {
        this.logEntryVector = new BasicArrayListD();
    }

    public function add(log : Log) : Void {
        this.logEntryVector.add(log);
    }

    public function logAll() : Void {
        final size : Int = this.logEntryVector.size();
        for (index in 0...size) {
            var log : Log = (cast this.logEntryVector.get(index) : Log);
            this.logUtil.putL(log);
        }
    }

}

