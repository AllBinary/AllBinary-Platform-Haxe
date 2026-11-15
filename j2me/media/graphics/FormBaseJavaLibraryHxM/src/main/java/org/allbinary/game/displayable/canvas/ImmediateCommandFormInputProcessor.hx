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

import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

class ImmediateCommandFormInputProcessor extends CommandFormInputProcessor {
    private final timeHelper : TimeDelayHelper = new TimeDelayHelper(25);
    public var gameCommandCanvas : GameCommandCanvas;
    public function new(gameKeyEventList : BasicArrayList, playerInputId : Int, gameCommandCanvas : GameCommandCanvas, form : ScrollSelectionForm) {
        super(gameKeyEventList, playerInputId, gameCommandCanvas, form);
        this.gameCommandCanvas = gameCommandCanvas;
    }

    // synchronized
    public override function onPressGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        try {
            super.onPressGameKeyEvent(gameKeyEvent);
            if (this.timeHelper.isTimeTNT()) {
                this.processInputList();
                this.gameCommandCanvas.repaintBehavior.onChangeRepaint(this.getCanvas());
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.ON_PRESS_GAME_KEY, e);
        }
    }

    // synchronized
    public override function onDownGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        try {
            super.onDownGameKeyEvent(gameKeyEvent);
            if (this.timeHelper.isTimeTNT()) {
                this.processInputList();
                this.gameCommandCanvas.repaintBehavior.onChangeRepaint(this.getCanvas());
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.ON_DOWN_GAME_KEY, e);
        }
    }

    // synchronized
    public override function onUpGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        try {
            super.onUpGameKeyEvent(gameKeyEvent);
            if (this.timeHelper.isTimeTNT()) {
                this.processInputList();
                this.gameCommandCanvas.repaintBehavior.onChangeRepaint(this.getCanvas());
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.ON_UP_GAME_KEY, e);
        }
    }

    public override function onMotionGestureEvent(motionGestureEvent : MotionGestureEvent) : Void {
        try {
            super.onMotionGestureEvent(motionGestureEvent);
            if (this.timeHelper.isTimeTNT()) {
                this.processInputList();
                this.gameCommandCanvas.repaintBehavior.onChangeRepaint(this.getCanvas());
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onMotionGestureEvent", e);
        }
    }

}

