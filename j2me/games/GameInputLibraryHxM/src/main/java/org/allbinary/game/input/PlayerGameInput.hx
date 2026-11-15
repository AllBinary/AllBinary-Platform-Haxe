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
package org.allbinary.game.input;

import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventListenerInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonLabels;
import org.allbinary.util.BasicArrayList;

class PlayerGameInput extends GameInput implements GameKeyEventListenerInterface {
    public final gameInputStrings : GameInputStrings = GameInputStrings.getInstance();
    private final playerInputId : Int;
    public function new(gameKeyEventList : BasicArrayList, removalGameKeyEventList : BasicArrayList, playerInputId : Int) {
        super(gameKeyEventList, removalGameKeyEventList);
        this.playerInputId = playerInputId;
    }

    // synchronized
    public override function onPressGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        this.add(gameKeyEvent);
        this.addForRemoval(gameKeyEvent);
    }

    // synchronized
    public override function onDownGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        this.add(gameKeyEvent);
    }

    // synchronized
    public function onDownKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        this.add(gameKeyEvent);
        this.addForRemoval(gameKeyEvent);
    }

    // synchronized
    public function onDownKey(gameKeyEvent : Null<Int>) : Void {
        PreLogUtil.put(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(gameKeyEvent.toString()).toString(), this, this.gameInputStrings.ON_DOWN_GAME_KEY);
    }

    // synchronized
    public override function onUpGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        this.addForRemoval(gameKeyEvent);
    }

    // synchronized
    public function onUpKeyEvent(gameKeyEvent : Null<Int>) : Void {
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function getPlayerInputId() : Int {
        return this.playerInputId;
    }

}

