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
package org.allbinary.input.automation.actions.script.condition.processors.input;

import org.allbinary.input.automation.robot.InputRobotInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class MouseInputAutomationProcessor {
    public function new() {
    }

    // throws Exception
    public static function process(mouseActionScriptInputInterface : MouseActionScriptInputInterface) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(new StringMaker().append("Start - Processing Mouse Input at: ").append(mouseActionScriptInputInterface.getPoint().toString()).append(" clicks: ").appendint(Std.int(mouseActionScriptInputInterface.getButtonClicks())).toString(), "MouseInputAutomationProcessor", commonStrings.PROCESS);
        var inputRobotInterface : InputRobotInterface = mouseActionScriptInputInterface.getInputRobotInterface();
        if (mouseActionScriptInputInterface.getPoint().x != -1 && mouseActionScriptInputInterface.getPoint().y != -1) {
            inputRobotInterface.mouseMove(mouseActionScriptInputInterface.getPoint());
        }
        Sys.sleep(haxe.Int64.toInt(mouseActionScriptInputInterface.getTime()) / 1000);
        if (mouseActionScriptInputInterface.getButtonClicks() != 0) {
            inputRobotInterface.mousePress(mouseActionScriptInputInterface.getButtonClicks());
            Sys.sleep(haxe.Int64.toInt(mouseActionScriptInputInterface.getTime()) / 1000);
            inputRobotInterface.mouseRelease(mouseActionScriptInputInterface.getButtonClicks());
        }
        Sys.sleep(haxe.Int64.toInt(mouseActionScriptInputInterface.getTime()) / 1000);
    }

}

