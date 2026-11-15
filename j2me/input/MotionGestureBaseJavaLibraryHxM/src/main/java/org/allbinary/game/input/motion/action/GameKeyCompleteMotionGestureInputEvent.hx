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
package org.allbinary.game.input.motion.action;

import org.allbinary.game.input.CompleteMotionGestureInputEvent;
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.input.mapping.InputToGameKeyMapping;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.string.CommonStrings;

class GameKeyCompleteMotionGestureInputEvent extends CompleteMotionGestureInputEvent implements GameKeyEventSourceInterface {
    private final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
    private final SOURCE_ID : Int = this.gameKeyEventFactory.MOTION_GESTURE_SOURCE_ID;
    private var gameKey : GameKey = GameKey.NULL_GAME_KEY;
    private var gameKeyEvent : GameKeyEvent = GameKeyEvent.NONE;
    private var inputToGameKeyMapping : InputToGameKeyMapping;
    public function new(name : String, motionGestureInput : MotionGestureInput, inputToGameKeyMapping : InputToGameKeyMapping) {
        super(name, motionGestureInput);
        this.inputToGameKeyMapping = inputToGameKeyMapping;
        GameKeyCompleteMotionGestureInputEventFactory.getInstance().add(this);
        this.update();
    }

    public override function getSourceId() : Int {
        return this.SOURCE_ID;
    }

    public function update() : Void {
        try {
            this.setGameKey(this.inputToGameKeyMapping.getInstance(this.getMotionGestureInput().getId()));
            this.setGameKeyEvent(this.gameKeyEventFactory.getInstanceForInput(this, this.getGameKey()));
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.UPDATE, e);
        }
    }

    public function setGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        this.gameKeyEvent = gameKeyEvent;
    }

    public function getGameKeyEvent() : GameKeyEvent {
        return this.gameKeyEvent;
    }

    public function setGameKey(gameKey : GameKey) : Void {
        this.gameKey = gameKey;
    }

    public function getGameKey() : GameKey {
        return this.gameKey;
    }

}

