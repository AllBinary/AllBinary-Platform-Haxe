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

import org.allbinary.game.input.PlayerGameInput;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class DownGameKeyEventHandlerBase extends BasicEventHandler {
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(playerGameInput : PlayerGameInput) : Void {
        if (!this.list.contains(playerGameInput)) {
            this.list.add(playerGameInput);
        }
    }

    public override function removeAllListeners() : Void {
        this.list.clear();
        super.removeAllListeners();
    }

    public override function removeListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        this.list.remove(eventListenerInterface);
        super.removeListenerSingleThreaded(eventListenerInterface);
    }

    // synchronized
    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.list.remove(eventListenerInterface);
        super.removeListener(eventListenerInterface);
    }

    // throws Exception
    public override function fireEvent(eventObject : AllBinaryEventObject) : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                var playerGameInput : PlayerGameInput = (cast this.list.objectArray[index] : PlayerGameInput);
                playerGameInput.onDownGameKeyEvent((cast eventObject : GameKeyEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final downGameKeyEventListenerInterface : DownGameKeyEventListenerInterface = (cast eventListenerInterface : DownGameKeyEventListenerInterface);
        downGameKeyEventListenerInterface.onDownGameKeyEvent((cast eventObject : GameKeyEvent));
    }

    private static final TOTAL_LISTENERS : String = " Total PlayerGameInput Listeners: ";
    private static final LISTENER_LABEL : String = " PlayerGameInput Listener: ";
    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(DownGameKeyEventHandlerBase.TOTAL_LISTENERS);
        stringBuffer.appendint(this.list.size());
        var eventListenerInterface : EventListenerInterface = null;
        final size : Int = this.list.size();
        var index : Int = 0;
        while (index < size) {
            try {
                eventListenerInterface = (cast this.list.get(index) : EventListenerInterface);
                stringBuffer.append(DownGameKeyEventHandlerBase.LISTENER_LABEL);
                stringBuffer.append(Std.string(eventListenerInterface));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.TOSTRING, e);
            }
            index++;
        }
        return Std.string(stringBuffer);
    }

}

