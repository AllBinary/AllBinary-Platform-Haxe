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
package org.allbinary.media.image.comparison.motion;

//import java.awt.Rectangle;
//import java.awt.event.InputEvent;
//import java.awt.event.KeyEvent;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.InputRobotInterface;
import org.allbinary.input.automation.robot.TempInputRobotNames;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;

class TestInputForMotionRectanglesResultsWorker implements MotionRectanglesResultsListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var index : haxe.Int64 = haxe.Int64.ofInt(0);
    private var running : Bool = false;
    private var motionRectanglesVector : BasicArrayList;
    public function new() {
        this.motionRectanglesVector = new BasicArrayListD();
    }

    public function getMotionRectanglesVector() : BasicArrayList {
        return this.motionRectanglesVector;
    }

    public function onMotionRectanglesImageComparisonResultsEvent(motionRectanglesImageComparisonResultsEvent : MotionRectanglesResultsEvent) : Void {
        this.getMotionRectanglesVector().add(motionRectanglesImageComparisonResultsEvent.getMotionRectangles());
        this.run();
    }

    public function onEvent(allBinaryEventObject : AllBinaryEventObject) : Void {
        this.onMotionRectanglesImageComparisonResultsEvent((cast allBinaryEventObject : MotionRectanglesResultsEvent));
    }

    // synchronized
    public function isRunning() : Bool {
        return this.running;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
        this.running = running;
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            timeHelper.setStartTimeTNT();
            var motionRectangles : MotionRectangles = (cast this.getMotionRectanglesVector().get(0) : MotionRectangles);
            var motionRectangleVector : BasicArrayList = motionRectangles.getVector();
            if (motionRectangleVector.size() > 0) {
                final rectangle : Rectangle = (cast motionRectangleVector.get(0) : Rectangle);
                final robotHashtable : ABHashtable<Any, Any> = InputRobotFactory.getInstance().get();
                final inputTypeNameArray : haxe.ds.Vector<Any> = robotHashtable.keySet().toArray();
                final size : Int = inputTypeNameArray.length;
                for (index in 0...size) {
                    var inputTypeNameString : String = (cast inputTypeNameArray[index] : String);
                    var inputRobotInterface : InputRobotInterface = (cast robotHashtable.get(inputTypeNameString) : InputRobotInterface);
                    inputRobotInterface.mouseMoveToTarget(rectangle);
                    if (inputRobotInterface.getName().compareTo(TempInputRobotNames.DX_NAME) == 0) {
                        inputRobotInterface.mousePress(InputEvent.BUTTON1_MASK);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.mouseRelease(InputEvent.BUTTON1_MASK);
                        inputRobotInterface.mousePress(InputEvent.BUTTON2_MASK);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.mouseRelease(InputEvent.BUTTON2_MASK);
                        inputRobotInterface.mousePress(InputEvent.BUTTON3_MASK);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.mouseRelease(InputEvent.BUTTON3_MASK);
                        inputRobotInterface.keyPress(KeyEvent.VK_1);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.keyRelease(KeyEvent.VK_1);
                        inputRobotInterface.keyPress(KeyEvent.VK_2);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.keyRelease(KeyEvent.VK_2);
                        inputRobotInterface.keyPress(KeyEvent.VK_3);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.keyRelease(KeyEvent.VK_3);
                        inputRobotInterface.keyPress(KeyEvent.VK_4);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.keyRelease(KeyEvent.VK_4);
                        inputRobotInterface.keyPress(KeyEvent.VK_F1);
                        Sys.sleep(haxe.Int64.toInt(300) / 1000);
                        inputRobotInterface.keyRelease(KeyEvent.VK_F1);
                    }
                }
            }
            this.index++;
            this.getMotionRectanglesVector().remove(motionRectangles);
            this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT(), this, this.commonStrings.RUN);
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

