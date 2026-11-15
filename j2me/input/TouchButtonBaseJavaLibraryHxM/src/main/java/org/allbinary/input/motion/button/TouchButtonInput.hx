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

import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.input.mapping.InputToGameKeyMapping;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class TouchButtonInput extends Input implements GameKeyEventSourceInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
    private final TOUCH_BUTTON_SOURCE_ID : Int = this.gameKeyEventFactory.TOUCH_BUTTON_SOURCE_ID;
    private var gameKeyEvent : GameKeyEvent = GameKeyEvent.NONE;
    public function new(id : Int, name : String) {
        super(id, name);
        final inputFactory : InputFactory = InputFactory.getInstance();
        inputFactory.add(this.getId(), this);
    }

    public function update(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        try {
            var gameKey : GameKey = inputToGameKeyMapping.getInstance(this.getId());
            this.gameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(this, gameKey);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.UPDATE, e);
        }
    }

    public override function getSourceId() : Int {
        return this.TOUCH_BUTTON_SOURCE_ID;
    }

    public function getGameKeyEvent() : GameKeyEvent {
        return this.gameKeyEvent;
    }

}

