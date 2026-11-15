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

import org.allbinary.logic.io.path.AbPathData;

class LogData {
    public final MAX : haxe.Int64 = 5000000;
    public final extension : String = "log";
    public final backupFileExt : String = AbPathData.getInstance().EXTENSION_SEP + "bak" + AbPathData.getInstance().EXTENSION_SEP + "txt";
    public final ALLBINARY : String = "allbinary";
    public final NAME : String = "LOG_NAME";
    public final DESCRIPTION : String = "LOG_DESCRIPTION";
    public function new() {
    }
}

