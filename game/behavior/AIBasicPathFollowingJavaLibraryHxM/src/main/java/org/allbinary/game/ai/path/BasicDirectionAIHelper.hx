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
package org.allbinary.game.ai.path;

//import javax.microedition.lcdui.Canvas;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.math.AngleIncrementInfo;
import org.allbinary.math.AngleInfo;

class BasicDirectionAIHelper {
    private var name : String;
    private var angleInfo : AngleInfo;
    public function new(name : String, angleInfo : AngleInfo) {
        this.name = name;
        this.angleInfo = angleInfo;
    }

    private function turnAI(frame : Int) : Int {
        var keyDirection : Int = -1;
        final directionAngle : Int = this.angleInfo.getAngleIncrementInfo().getFrameAngle(frame);
        final angle : Int = this.angleInfo.getAngle();
        final degrees : Int = Math.abs(directionAngle - angle);
        if (degrees < 180) {
            if (angle > directionAngle) {
                keyDirection = Canvas.LEFT;
            } else if (angle < directionAngle) {
                keyDirection = Canvas.RIGHT;
            }
        } else {
            if (angle > directionAngle) {
                keyDirection = Canvas.RIGHT;
            } else if (angle < directionAngle) {
                keyDirection = Canvas.LEFT;
            }
        }
        return keyDirection;
    }

    private function getAIKeyPressed(frame : Null<Int>) : Int {
        final angle : Int = Std.int(this.angleInfo.getAngleIncrementInfo().getFrameAngle(Std.int(frame)));
        if (this.angleInfo.getAngle() != angle) {
            return this.turnAI(Std.int(frame));
        } else {
            return Canvas.UP;
        }
    }

    public function getAIKeyPressedFromDirection(geographicMapDirectionData : Direction) : Int {
        var keyDirection : Int = -1;
        final angleIncrementInfo : AngleIncrementInfo = this.angleInfo.getAngleIncrementInfo();
        final directionFactory : DirectionFactory = DirectionFactory.getInstance();
        if (geographicMapDirectionData == directionFactory.DOWN) {
            keyDirection = this.getAIKeyPressed(angleIncrementInfo.DOWN_FRAME);
        } else if (geographicMapDirectionData == directionFactory.UP) {
            keyDirection = this.getAIKeyPressed(angleIncrementInfo.UP_FRAME);
        } else if (geographicMapDirectionData == directionFactory.LEFT) {
            keyDirection = this.getAIKeyPressed(angleIncrementInfo.LEFT_FRAME);
        } else if (geographicMapDirectionData == directionFactory.RIGHT) {
            keyDirection = this.getAIKeyPressed(angleIncrementInfo.RIGHT_FRAME);
        }
        return keyDirection;
    }

    public function getAngleInfoP() : AngleInfo {
        return this.angleInfo;
    }

    public function getName() : String {
        return this.name;
    }

}

