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
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class KeyboardInputAutomationProcessor {
    public function new() {
    }

    // throws Exception
    public static function process(keyActionScriptInputInterface : KeyboardActionScriptInputInterface) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(CommonLabels.getInstance().START + keyActionScriptInputInterface.toString(), "KeyInputAutomationProcessor", commonStrings.PROCESS);
        var inputRobotInterface : InputRobotInterface = keyActionScriptInputInterface.getInputRobotInterface();
        var integer : haxe.ds.Vector<Null<Int>> = keyActionScriptInputInterface.getKeyArray();
        if (keyActionScriptInputInterface.getDelayBetweenKeys() == 0) {
            for (index in 0...keyActionScriptInputInterface.getKeyArray().length) {
                if (keyActionScriptInputInterface.isPress()) {
                    inputRobotInterface.keyPress(integer[index]);
                }
            }
            Sys.sleep(haxe.Int64.toInt(keyActionScriptInputInterface.getTime()) / 1000);
            {
                var index : Int = keyActionScriptInputInterface.getKeyArray().length - 1;
                while (index >= 0) {
                if (keyActionScriptInputInterface.isRelease()) {
                    inputRobotInterface.keyRelease(integer[index]);
                }
                    index--;
                }
            }
        } else {
            for (index in 0...keyActionScriptInputInterface.getKeyArray().length) {
                if (keyActionScriptInputInterface.isPress()) {
                    inputRobotInterface.keyPress(integer[index]);
                }
                Sys.sleep(haxe.Int64.toInt(keyActionScriptInputInterface.getTime()) / 1000);
                if (keyActionScriptInputInterface.isRelease()) {
                    inputRobotInterface.keyRelease(integer[index]);
                }
                var timeHelper : TimeDelayHelper = new TimeDelayHelper(keyActionScriptInputInterface.getDelayBetweenKeys());
                var toLong : Int = 0;
                while (!timeHelper.isTimeTNT() || toLong > 6000) {
                    toLong++;
                    Sys.sleep(haxe.Int64.toInt(50) / 1000);
                }
            }
        }
    }

}

