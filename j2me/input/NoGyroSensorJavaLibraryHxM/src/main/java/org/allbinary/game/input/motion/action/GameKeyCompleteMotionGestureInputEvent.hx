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
import org.allbinary.game.input.mapping.InputToGameKeyMapping;
import org.allbinary.input.motion.gesture.MotionGestureInput;

class GameKeyCompleteMotionGestureInputEvent extends CompleteMotionGestureInputEvent implements GameKeyEventSourceInterface {
    private var gameKey : GameKey = GameKey.NULL_GAME_KEY;
    private var gameKeyEvent : GameKeyEvent = GameKeyEvent.NONE;
    public function new(name : String, motionGestureInput : MotionGestureInput, inputToGameKeyMapping : InputToGameKeyMapping) {
        super(name, motionGestureInput);
    }

    public function getSourceId() : Int {
        return 0;
    }

    public function update() : Void {
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

