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
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class DownKeyEventHandlerBase extends BasicEventHandler {
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
    public function fireEventI(eventObject : Null<Int>) : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                var playerGameInput : PlayerGameInput = (cast this.list.objectArray[index] : PlayerGameInput);
                playerGameInput.onDownKey(eventObject);
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        var index : Int = 0;
        var eventListenerInterface : EventListenerInterface = null;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.get(index) : EventListenerInterface);
                this.processI(eventObject, eventListenerInterface);
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            index++;
        }
    }

    // throws Exception
    public function fireEventForGameKeyEvent(eventObject : GameKeyEvent) : Void {
        final size : Int = this.list.size();
        {
            var index : Int = size;
            while (--index >= 0) {
            try {
                var playerGameInput : PlayerGameInput = (cast this.list.objectArray[index] : PlayerGameInput);
                playerGameInput.onDownKeyEvent(eventObject);
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        var index : Int = 0;
        var eventListenerInterface : EventListenerInterface = null;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.get(index) : EventListenerInterface);
                this.processEvent(eventObject, eventListenerInterface);
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            index++;
        }
    }

    // throws Exception
    public function processI(eventObject : Null<Int>, eventListenerInterface : EventListenerInterface) : Void {
        final downKeyEventListenerInterface : DownKeyEventListenerInterface = (cast eventListenerInterface : DownKeyEventListenerInterface);
        downKeyEventListenerInterface.onDownKey(eventObject);
    }

    // throws Exception
    public function processEvent(eventObject : GameKeyEvent, eventListenerInterface : EventListenerInterface) : Void {
        final downKeyEventListenerInterface : DownKeyEventListenerInterface = (cast eventListenerInterface : DownKeyEventListenerInterface);
        downKeyEventListenerInterface.onDownKeyEvent(eventObject);
    }

    private static final TOTAL_LISTENERS : String = " Total PlayerGameInput Listeners: ";
    private static final LISTENER_LABEL : String = " PlayerGameInput Listener: ";
    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(DownKeyEventHandlerBase.TOTAL_LISTENERS);
        stringBuffer.appendint(this.list.size());
        var eventListenerInterface : EventListenerInterface = null;
        for (index in 0...this.list.size()) {
            try {
                eventListenerInterface = (cast this.list.get(index) : EventListenerInterface);
                stringBuffer.append(DownKeyEventHandlerBase.LISTENER_LABEL);
                stringBuffer.append(eventListenerInterface.toString());
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.TOSTRING, e);
            }
        }
        return stringBuffer.toString();
    }

}

