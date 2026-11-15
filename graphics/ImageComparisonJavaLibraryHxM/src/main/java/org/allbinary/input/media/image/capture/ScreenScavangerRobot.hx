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
package org.allbinary.input.media.image.capture;

//import java.awt.Dimension;
//import java.awt.Rectangle;
//import java.awt.Toolkit;
//import java.awt.image.BufferedImage;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.InputRobotInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class ScreenScavangerRobot {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    // throws Exception
    public function getScreenAsBufferedImages() : haxe.ds.Vector<BufferedImage> {
        this.logUtil.putF(this.commonStrings.START, this, "getScreenAsBufferedImages");
        final dimScreenSize : Dimension = Toolkit.getDefaultToolkit().getScreenSize();
        final rectScreenSize : Rectangle = new Rectangle(dimScreenSize);
        final robotHashtable : ABHashtable<Any, Any> = InputRobotFactory.getInstance().get();
        var bufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
        var index : Int = 0;
        final inputRobotInterface : InputRobotInterface = (cast robotHashtable.get("Java Robot") : InputRobotInterface);
        bufferedImageArray[index] = inputRobotInterface.createScreenCapture(rectScreenSize);
        this.logUtil.putF("Finish", this, "getScreenAsBufferedImages");
        return bufferedImageArray;
    }

}

