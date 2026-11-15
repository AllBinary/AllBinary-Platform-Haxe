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
import org.allbinary.input.automation.PointHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class InputRobot implements InputRobotInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var robot : Robot;
    public static final NAME : String = "Java Robot";
    public function new(graphicsDevice : GraphicsDevice) {
        this.robot = new Robot(graphicsDevice);
    }

    public function getName() : String {
        return InputRobot.NAME;
    }

    public function getHelpSet() : HelpSet {
        return null;
    }

    public function getMousePoint() : Point {
        final point : Point = MouseInfo.getPointerInfo().getLocation();
        return point;
    }

    // throws Exception
    public function mouseMoveToTarget(rectangle : Rectangle, x : Null<Int>, y : Null<Int>) : Void {
        final point : Point = PointHelper.getCenterPoint(rectangle);
        this.robot.mouseMove(point.x + x, point.y + y);
        final message : String = new StringMaker().append("Moved Mouse To: x: ").appendint(Std.int(point.x)).append(" y: ").appendint(Std.int(point.y)).append(" in the middle of: ").append(StringUtil.getInstance().toString(rectangle)).toString();
        this.logUtil.putF(message, this, "moveMouseToTarget");
    }

    public function mouseMove(point : Point) : Void {
        this.mouseMove(point.x, point.y);
    }

    public function mouseMove(x : Int, y : Int) : Void {
        this.robot.mouseMove(x, y);
        final message : String = new StringMaker().append("Moved Mouse To: x: ").appendint(x).append(" y: ").appendint(y).toString();
        this.logUtil.putF(message, this, "moveMouse");
    }

    // throws Exception
    public function mouseMoveToTarget(rectangle : Rectangle) : Void {
        this.mouseMoveToTarget(rectangle, 0, 0);
    }

    public function createScreenCapture(screenRect : Rectangle) : BufferedImage {
        return this.robot.createScreenCapture(screenRect);
    }

    public function delay(ms : Null<Int>) : Void {
        this.robot.delay(ms);
    }

    public function getAutoDelay() : Null<Int> {
        return this.robot.getAutoDelay();
    }

    public function getPixelColor(x : Null<Int>, y : Null<Int>) : Color {
        return this.robot.getPixelColor(x, y);
    }

    public function isAutoWaitForIdle() : Bool {
        return this.robot.isAutoWaitForIdle();
    }

    public function keyPress(keycode : Null<Int>) : Void {
        this.robot.keyPress(keycode);
    }

    public function keyRelease(keycode : Null<Int>) : Void {
        this.robot.keyRelease(keycode);
    }

    public function mouseMove(x : Null<Int>, y : Null<Int>) : Void {
        this.robot.mouseMove(x, y);
    }

    public function mousePress(buttons : Null<Int>) : Void {
        this.robot.mousePress(buttons);
    }

    public function mouseRelease(buttons : Null<Int>) : Void {
        this.robot.mouseRelease(buttons);
    }

    public function mouseWheel(wheelAmt : Null<Int>) : Void {
        this.robot.mouseWheel(wheelAmt);
    }

    public function setAutoDelay(ms : Null<Int>) : Void {
        this.robot.setAutoDelay(ms);
    }

    public function setAutoWaitForIdle(isOn : Bool) : Void {
        this.robot.setAutoWaitForIdle(isOn);
    }

    public function toString() : String {
        return this.robot.toString();
    }

    public function waitForIdle() : Void {
        this.robot.waitForIdle();
    }

    public function on() : Void {
    }

    public function off() : Void {
    }

}

