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
package org.allbinary.input.automation;

//import java.awt.*;
//import javax.help.HelpSet;
import org.allbinary.logic.communication.log.LogUtil;

class AbstractInputRobot {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var helpSet : HelpSet = null;
    public function new(helpSet : HelpSet) {
        this.setHelpSet(helpSet);
    }

    public function getHelpSet() : HelpSet {
        return this.helpSet;
    }

    public function mouseMove(point : Point) : Void {
        this.mouseMove(point.x, point.y);
        this.logUtil.putF("Moved Mouse To: x: " + point.x + " y: " + point.y, this, "moveMouse");
    }

    // throws Exception
    public function mouseMoveToTarget(rectangle : Rectangle, x : Null<Int>, y : Null<Int>) : Void {
        var point : Point = PointHelper.getCenterPoint(rectangle);
        this.mouseMove(point.x + x, point.y + y);
        this.logUtil.putF("Moved Mouse To: x: " + point.x + " y: " + point.y + " in the middle of: " + rectangle, this, "moveMouseToTarget");
    }

    // throws Exception
    public function mouseMoveToTarget(rectangle : Rectangle) : Void {
        this.mouseMoveToTarget(rectangle, 0, 0);
    }

    public function mouseMove(x : Null<Int>, y : Null<Int>) : Void {
        throw new haxe.Exception();
    }

    private function setHelpSet(helpSet : HelpSet) : Void {
        this.helpSet = helpSet;
    }

}

