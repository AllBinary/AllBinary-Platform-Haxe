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

import org.allbinary.globals.Globals;
import org.allbinary.string.CommonStrings;

class TestRemoteLogUtil {
    public static final PATH : String = "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\";
    public function new() {
        Globals.getInstance().init(Type.getClass(this).getClassLoader(), TestRemoteLogUtil.PATH);
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        logUtil.put(commonStrings.EXCEPTION, "Test", "TestClass", new haxe.Exception("Pretend Exception"));
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        new TestRemoteLogUtil();
    }

}

