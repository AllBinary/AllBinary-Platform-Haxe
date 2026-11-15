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
package org.allbinary.input.automation.robot;

//import java.awt.*;
//import java.awt.image.BufferedImage;
//import javax.help.HelpSet;
import org.allbinary.input.automation.AbstractInputRobot;
import org.allbinary.input.automation.PointFactory;
import org.allbinary.logic.communication.log.LogUtil;

class NullInputRobot extends AbstractInputRobot implements InputRobotInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final LIBRARY_NAME : String = "null";
    public static final NAME : String = "NULL";
    public function new() {
        super(null);
    }

    public function getName() : String {
        return NullInputRobot.NAME;
    }

    public function getHelpSet() : HelpSet {
        return null;
    }

    public function getMousePoint() : Point {
        return PointFactory.getInstance(0, 0);
    }

    public function keyPress(keycode : Null<Int>) : Void {
        this.logUtil.putF("KeyCode: " + keycode, this, "keyPress");
    }

    public function keyRelease(keycode : Null<Int>) : Void {
        this.logUtil.putF("KeyCode: " + keycode, this, "keyRelease");
    }

    public function mouseMove(x : Null<Int>, y : Null<Int>) : Void {
        this.logUtil.putF("X: " + x + " Y: " + y, this, "mouseMove");
    }

    public function mousePress(buttons : Null<Int>) : Void {
        this.logUtil.putF("Buttons: " + buttons, this, "mousePress");
    }

    public function mouseRelease(buttons : Null<Int>) : Void {
        this.logUtil.putF("Buttons: " + buttons, this, "mouseRelease");
    }

    public function createScreenCapture(screenRect : Rectangle) : BufferedImage {
        return null;
    }

    public function delay(ms : Null<Int>) : Void {
    }

    public function getAutoDelay() : Null<Int> {
        return -1;
    }

    public function getPixelColor(x : Null<Int>, y : Null<Int>) : Color {
        return null;
    }

    public function isAutoWaitForIdle() : Bool {
        return false;
    }

    public function mouseWheel(wheelAmt : Null<Int>) : Void {
    }

    public function setAutoDelay(ms : Null<Int>) : Void {
    }

    public function setAutoWaitForIdle(isOn : Bool) : Void {
    }

    public function toString() : String {
        return "DirectXWindowsInputRobot";
    }

    public function waitForIdle() : Void {
    }

}

