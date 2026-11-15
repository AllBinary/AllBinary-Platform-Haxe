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
package org.allbinary.input.motion.button;

import org.allbinary.game.input.event.DownGameKeyEventHandler;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.UpGameKeyEventHandler;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.RectangleCollisionUtil;
import org.allbinary.util.BasicArrayList;

class TouchButtonRecognizer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final rectangleCollisionUtil : RectangleCollisionUtil = RectangleCollisionUtil.getInstance();
    private final upGameKeyEventHandler : UpGameKeyEventHandler = UpGameKeyEventHandler.getInstance();
    private final downGameKeyEventHandler : DownGameKeyEventHandler = DownGameKeyEventHandler.getInstance();
    private var lastPressedTouchButtonInput : TouchButtonInput = BasicTouchInputFactory.getInstance().NONE;
    private final currentlyPressedTouchButtonSingleton : CurrentlyPressedTouchButtonSingleton = CurrentlyPressedTouchButtonSingleton.getInstance();
    //CurrentlyPressedTouchButtonSingletonDebug.getInstance();
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ReleaseHelper {
        public final touchButtonRecognizer : TouchButtonRecognizer;
        public function new(touchButtonRecognizer : TouchButtonRecognizer) {
            this.touchButtonRecognizer = touchButtonRecognizer;
        }

        // throws Exception
        public function release(touchButtonInput : TouchButtonInput, deviceId : Int) : Void {
            var nextTouchButtonInput : TouchButtonInput = null;
            var gameKeyEvent : GameKeyEvent = null;
            {
                var index : Int = this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.size() - 1;
                while (index >= 0) {
                nextTouchButtonInput = this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.get(index);
                gameKeyEvent = nextTouchButtonInput.getGameKeyEvent();
                this.touchButtonRecognizer.upGameKeyEventHandler.fireEvent(gameKeyEvent);
                this.touchButtonRecognizer.upGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
                this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.removeAt(index);
                    index--;
                }
            }
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class MultitouchReleaseHelper extends ReleaseHelper {
        public function new(touchButtonRecognizer : TouchButtonRecognizer) {
            super(touchButtonRecognizer);
        }

        // throws Exception
        public override function release(touchButtonInput : TouchButtonInput, deviceId : Int) : Void {
            final cancelTouchButtonInput : TouchButtonInput = CancelTouchButtonInputFactory.getInstance().getCancel(touchButtonInput);
            var nextTouchButtonInput : TouchButtonInput = null;
            var gameKeyEvent : GameKeyEvent = null;
            {
                var index : Int = this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.size() - 1;
                while (index >= 0) {
                nextTouchButtonInput = this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.get(index);
                if (cancelTouchButtonInput == nextTouchButtonInput) {
                    gameKeyEvent = nextTouchButtonInput.getGameKeyEvent();
                    this.touchButtonRecognizer.upGameKeyEventHandler.fireEvent(gameKeyEvent);
                    this.touchButtonRecognizer.upGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
                    this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.removeAt(index);
                }
                    index--;
                }
            }
        }

    }
    private final releaseHelper : ReleaseHelper = null;
    public function new() {
        if (TouchScreenFactory.getInstance().isMultiTouch()) {
            this.releaseHelper = new MultitouchReleaseHelper(this);
        } else {
            this.releaseHelper = new ReleaseHelper(this);
        }
    }

    // throws Exception
    private function processRelease(touchButtonInput : TouchButtonInput, deviceId : Int) : Void {
        this.releaseHelper.release(touchButtonInput, deviceId);
        final gameKeyEvent : GameKeyEvent = touchButtonInput.getGameKeyEvent();
        this.upGameKeyEventHandler.fireEvent(gameKeyEvent);
        this.upGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
        this.currentlyPressedTouchButtonSingleton.remove(touchButtonInput);
    }

    // throws Exception
    // synchronized
    public function releaseTouchButtonInput(x : Int, y : Int, deviceId : Int) : Bool {
        var touchButtonInput : TouchButtonInput = this.lastPressedTouchButtonInput;
        if (this.currentlyPressedTouchButtonSingleton.contains(touchButtonInput)) {
            this.lastPressedTouchButtonInput = BasicTouchInputFactory.getInstance().NONE;
            this.processRelease(touchButtonInput, deviceId);
            return true;
        } else {
            final list : BasicArrayList = TouchButtonFactory.getInstance().getList();
            var rectangle : Rectangle = null;
            var point : GPoint = null;
            var touchButton : TouchButton = null;
            {
                var index : Int = list.size() - 1;
                while (index >= 0) {
                touchButton = (cast list.objectArray[index] : TouchButton);
                rectangle = touchButton.getRectangle();
                point = rectangle.getPoint();
                if (this.rectangleCollisionUtil.isInside(point.getX(), point.getY(), rectangle.getMaxX(), rectangle.getMaxY(), x, y)) {
                    touchButtonInput = touchButton.getTouchButtonInput();
                    this.processRelease(touchButtonInput, deviceId);
                    return true;
                }
                    index--;
                }
            }
        }
        return false;
    }

    // throws Exception
    // synchronized
    public function pressTouchButtonInput(x : Int, y : Int, deviceId : Int) : Bool {
        final list : BasicArrayList = TouchButtonFactory.getInstance().getList();
        var rectangle : Rectangle = null;
        var point : GPoint = null;
        var touchButton : TouchButton = null;
        var touchButtonInput : TouchButtonInput = null;
        var gameKeyEvent : GameKeyEvent = null;
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            touchButton = (cast list.objectArray[index] : TouchButton);
            rectangle = touchButton.getRectangle();
            point = rectangle.getPoint();
            if (this.rectangleCollisionUtil.isInside(point.getX(), point.getY(), rectangle.getMaxX(), rectangle.getMaxY(), x, y)) {
                touchButtonInput = touchButton.getTouchButtonInput();
                if (!this.currentlyPressedTouchButtonSingleton.contains(touchButtonInput)) {
                    this.releaseHelper.release(touchButtonInput, deviceId);
                    this.lastPressedTouchButtonInput = touchButtonInput;
                    this.currentlyPressedTouchButtonSingleton.add(touchButtonInput);
                    gameKeyEvent = touchButtonInput.getGameKeyEvent();
                    this.downGameKeyEventHandler.fireEvent(gameKeyEvent);
                    this.downGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
                }
                return true;
            }
                index--;
            }
        }
        return false;
    }

}

