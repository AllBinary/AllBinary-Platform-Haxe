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
package org.allbinary.system;

import org.allbinary.logic.string.StringMaker;

//ActualPlatform
class Memory {
    public static function getInfo() : String {
        var stringBuffer : StringMaker = new StringMaker();
        var maxUtilizedMemoryAvailable : haxe.Int64 = Runtime.getRuntime().maxMemory();
        var memoryUsed : haxe.Int64 = Runtime.getRuntime().totalMemory();
        stringBuffer.append("APK Memory: Available: ");
        stringBuffer.appendlong(maxUtilizedMemoryAvailable);
        stringBuffer.append("/");
        stringBuffer.appendlong(haxe.Int64.ofInt(Runtime.getRuntime().maxMemory()));
        stringBuffer.append(" Used: ");
        stringBuffer.appendlong(memoryUsed);
        stringBuffer.append(" Free: ");
        stringBuffer.appendlong(maxUtilizedMemoryAvailable - memoryUsed);
        stringBuffer.append("/");
        stringBuffer.appendlong(haxe.Int64.ofInt(Runtime.getRuntime().maxMemory() - memoryUsed));
        return stringBuffer.toString();
    }

    public function new() {
    }
}

