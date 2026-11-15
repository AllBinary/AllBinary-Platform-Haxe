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
package org.allbinary.input.automation.module;

//import java.util.Set;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.InputRobotInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface;
import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface;
import org.allbinary.util.ABHashtable;

class TestInputAutomationActionWorker extends AbstractInputAutomationWorker {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var sleep : Int;
    public function new(sleep : Int, inputAutomationActionInterface : InputAutomationActionInterface, imageComparatorConstraintsInterface : ImageComparatorConstraintsInterface, motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface) {
        super(inputAutomationActionInterface);
        this.logUtil.putF("BasicTestAttackWorder", this, this.commonStrings.CONSTRUCTOR);
        this.sleep = sleep;
    }

    // throws Exception
    public function processBetweenWorkers() : Void {
        Sys.sleep(haxe.Int64.toInt(2000) / 1000);
    }

    // throws Exception
    public function process() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.PROCESS);
        final hashtable : ABHashtable<Any, Any> = InputRobotFactory.getInstance().get();
        final set : Set = hashtable.keySet();
        final inputTypeNameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = inputTypeNameArray.length;
        for (index in 0...size) {
            var inputTypeNameString : String = (cast inputTypeNameArray[index] : String);
            var robot : InputRobotInterface = (cast hashtable.get(inputTypeNameString) : InputRobotInterface);
            if (this.sleep > 0) {
                Sys.sleep(haxe.Int64.toInt(this.sleep) / 1000);
            }
        }
    }

}

