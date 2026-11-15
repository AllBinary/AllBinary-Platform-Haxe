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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.input.GameInputStrings;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.RectangleCollisionUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

class PopupMenuInputProcessor extends BasicMenuInputProcessor {
    private final rectangleCollisionUtil : RectangleCollisionUtil = RectangleCollisionUtil.getInstance();
    private final CLICK_DELAY : Int = 120;
    private final clickTimeHelper : TimeDelayHelper;
    private var rectangle : Rectangle;
    public function new(gameKeyEventList : BasicArrayList, playerInputId : Int, gameCanvas : MyCanvas, rectangle : Rectangle) {
        super(gameKeyEventList, playerInputId, gameCanvas);
        this.clickTimeHelper = new TimeDelayHelper(this.CLICK_DELAY);
        this.rectangle = rectangle;
    }

    public function init(rectangle : Rectangle) : Void {
        this.rectangle = rectangle;
    }

    // throws Exception
    public function processInput(key : Int) : Int {
        if (key == Canvas.KEY_STAR) {
            final gameCanvas : AllBinaryGameCanvas = (cast this.getCanvas() : AllBinaryGameCanvas);
            gameCanvas.toggleMenu();
            return 1;
        }
        return 0;
    }

    // throws Exception
    public override function processInputList() : Int {
        try {
            final motionInputsIndex : Int = this.processMotionInputs();
            final list : BasicArrayList = this.getGameKeyEventList();
            final size : Int = list.size();
            var key : Int = 0;
            var gameKeyEvent : GameKeyEvent = null;
            for (index in 0...size) {
                gameKeyEvent = (cast list.objectArray[index] : GameKeyEvent);
                if (gameKeyEvent != null) {
                    key = gameKeyEvent.getKey();
                    if (this.processInput(key) == 1) {
                        break;
                    }
                }
            }
            this.clear();
            if (size > 0 || motionInputsIndex >= 0) {
                return 1;
            } else {
                return -1;
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, GameInputStrings.getInstance().PROCESS_INPUT, e);
            return -1;
        }
    }

    // throws Exception
    public function processMotionInputs() : Int {
        final lastIndex : Int = this.motionGestureEventList.size() - 1;
        if (lastIndex >= 0) {
            final motionGestureEvent : MotionGestureEvent = (cast this.motionGestureEventList.objectArray[lastIndex] : MotionGestureEvent);
            this.processMotionInput(motionGestureEvent);
        }
        this.motionGestureEventList.clear();
        return lastIndex;
    }

    // throws Exception
    public function processMotionInput(motionGestureEvent : MotionGestureEvent) : Void {
        if (motionGestureEvent == null) {
            this.logUtil.putF("Exception: Bug", this, this.gameInputStrings.PROCESS_MOTION_INPUT);
            return;
        }
        final touchMotionGestureFactory : TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
        final motionGestureInput : MotionGestureInput = motionGestureEvent.getMotionGesture();
        if (motionGestureInput == touchMotionGestureFactory.RELEASED) {
            var point : GPoint = motionGestureEvent.getCurrentPoint();
            var rectPoint : GPoint = this.rectangle.getPoint();
            if (this.rectangleCollisionUtil.isInside(rectPoint.getX(), rectPoint.getY(), this.rectangle.getMaxX() + 20, this.rectangle.getMaxY(), point.getX(), point.getY())) {
                if (this.clickTimeHelper.isTimeTNT()) {
                    final gameCanvas : AllBinaryGameCanvas = (cast this.getCanvas() : AllBinaryGameCanvas);
                    gameCanvas.toggleMenu();
                }
            }
        }
    }

}

