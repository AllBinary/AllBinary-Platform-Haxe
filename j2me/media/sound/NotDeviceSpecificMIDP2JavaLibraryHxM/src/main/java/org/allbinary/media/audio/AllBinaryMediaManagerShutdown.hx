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
package org.allbinary.media.audio;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class AllBinaryMediaManagerShutdown {
    private static final instance : AllBinaryMediaManagerShutdown = new AllBinaryMediaManagerShutdown();
    // throws Exception
    public static function shutdown(soundsFactoryInterface : SoundsFactoryInterface) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(commonStrings.START, instance, "shutdown");
        AllBinaryMediaManager.shutdown(soundsFactoryInterface);
    }

    public function new() {
    }
}

