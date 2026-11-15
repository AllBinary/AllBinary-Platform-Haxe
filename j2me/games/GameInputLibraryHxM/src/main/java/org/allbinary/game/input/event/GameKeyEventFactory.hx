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
package org.allbinary.game.input.event;

import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;

class GameKeyEventFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameKeyEventFactory {
        if (GameKeyEventFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            GameKeyEventFactory.instance = new GameKeyEventFactory();
        }
        return (cast GameKeyEventFactory.instance : GameKeyEventFactory);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final TOUCH_BUTTON_SOURCE_ID : Int = 2;
    public final MOTION_GESTURE_SOURCE_ID : Int = 3;
    private final MAX_SOURCES : Int = 4;
    private var ARRAY : haxe.ds.Vector<haxe.ds.Vector<GameKeyEvent>>;
    public function new() {
        this.ARRAY = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.MAX_SOURCES) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...InputFactory.getInstance().MAX) null])]);
    }

    public function init() : Void {
        final nullUtil : NullUtil = NullUtil.getInstance();
        final size : Int = InputFactory.getInstance().MAX;
        {
            var index : Int = this.MAX_SOURCES;
            while (--index >= 0) {
            {
                var index2 : Int = size;
                while (--index2 >= 0) {
                this.ARRAY[index][index2] = GameKeyEvent.createEvent(nullUtil.NULL_OBJECT, index, index2);
                }
            }
            }
        }
    }

    // throws Exception
    public function getInstanceForKey(anyType : GameKeyEventSourceInterface, key : Int) : GameKeyEvent {
        final gameKeyEvent : GameKeyEvent = this.ARRAY[anyType.getSourceId()][key];
        return gameKeyEvent;
    }

    // throws Exception
    public function getInstanceForInput(anyType : GameKeyEventSourceInterface, input : Input) : GameKeyEvent {
        final gameKeyEvent : GameKeyEvent = this.ARRAY[anyType.getSourceId()][input.getId()];
        return gameKeyEvent;
    }

}

