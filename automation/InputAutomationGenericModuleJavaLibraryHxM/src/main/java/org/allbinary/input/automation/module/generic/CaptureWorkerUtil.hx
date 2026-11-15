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
package org.allbinary.input.automation.module.generic;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class CaptureWorkerUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public static function processProfileActionConditions(vector : BasicArrayList, frame : Null<haxe.Int64>) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(commonStrings.START, "CaptureWorkerUtil", "processProfileActionConditions");
        final size : Int = vector.size();
        for (index in 0...size) {
            var profileActionConditionInterface : ProfileActionScriptConditionInterface = (cast vector.get(index) : ProfileActionScriptConditionInterface);
            if (profileActionConditionInterface.shouldProcess(frame)) {
                profileActionConditionInterface.process(frame);
            } else {
            }
        }
    }

}

