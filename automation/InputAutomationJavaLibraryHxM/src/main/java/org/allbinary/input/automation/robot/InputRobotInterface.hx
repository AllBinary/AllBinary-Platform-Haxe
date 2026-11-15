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

interface InputRobotInterface {
    function getName() : String;

    function getHelpSet() : HelpSet;

    function createScreenCapture(screenRect : Rectangle) : BufferedImage;

    function delay(ms : Null<Int>) : Void;

    function getAutoDelay() : Null<Int>;

    function getPixelColor(x : Null<Int>, y : Null<Int>) : Color;

    function isAutoWaitForIdle() : Bool;

    function keyPress(keycode : Null<Int>) : Void;

    function keyRelease(keycode : Null<Int>) : Void;

    function getMousePoint() : Point;

    function mouseMove(x : Null<Int>, y : Null<Int>) : Void;

    function mousePress(buttons : Null<Int>) : Void;

    function mouseRelease(buttons : Null<Int>) : Void;

    function mouseWheel(wheelAmt : Null<Int>) : Void;

    function setAutoDelay(ms : Null<Int>) : Void;

    function setAutoWaitForIdle(isOn : Bool) : Void;

    function toString() : String;

    function waitForIdle() : Void;

    function mouseMove(point : Point) : Void;

    // throws Exception
    function mouseMoveToTarget(rectangle : Rectangle) : Void;

    // throws Exception
    function mouseMoveToTarget(rectangle : Rectangle, x : Null<Int>, y : Null<Int>) : Void;

}

