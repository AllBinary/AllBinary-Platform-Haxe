/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class RawKeyEventHandler {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : RawKeyEventHandler = new RawKeyEventHandler();
    public static function getInstance() : RawKeyEventHandler {
        return RawKeyEventHandler.instance;
    }

    public var eventListenerInterfaceList : BasicArrayList;
    public function new() {
        this.eventListenerInterfaceList = new BasicArrayListD();
    }

    public function removeAllListeners() : Void {
        this.eventListenerInterfaceList = new BasicArrayListD();
    }

    public function addListeners(vector : BasicArrayList) : Void {
        var eventListenerInterface : RawKeyEventListener = null;
        final size : Int = vector.size();
        for (index in 0...size) {
            eventListenerInterface = (cast vector.get(index) : RawKeyEventListener);
            this.addListener(eventListenerInterface);
        }
    }

    public function addListenerSingleThreaded(eventListenerInterface : RawKeyEventListener) : Void {
        if (!this.eventListenerInterfaceList.contains(eventListenerInterface)) {
            this.eventListenerInterfaceList.add(eventListenerInterface);
        }
    }

    public function addListener(eventListenerInterface : RawKeyEventListener) : Void {
        if (!this.eventListenerInterfaceList.contains(eventListenerInterface)) {
            this.eventListenerInterfaceList.add(eventListenerInterface);
        }
    }

    public function removeListenerSingleThreaded(eventListenerInterface : RawKeyEventListener) : Void {
        this.eventListenerInterfaceList.remove(eventListenerInterface);
    }

    public function removeListener(eventListenerInterface : RawKeyEventListener) : Void {
        this.eventListenerInterfaceList.remove(eventListenerInterface);
    }

    // throws Exception
    public function fireEvent(keyCode : Int, deviceId : Int, repeated : Bool) : Void {
        var eventListenerInterface : RawKeyEventListener = null;
        var index : Int = 0;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.get(index) : RawKeyEventListener);
                this.process(keyCode, deviceId, repeated, eventListenerInterface);
            } catch (e : haxe.Exception) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            index++;
        }
    }

    // throws Exception
    public function process(keyCode : Int, deviceId : Int, repeated : Bool, eventListenerInterface : RawKeyEventListener) : Void {
        eventListenerInterface.onEventRaw(keyCode, deviceId, repeated);
    }

    public function getEventListenerInterfaceListP() : BasicArrayList {
        return this.eventListenerInterfaceList;
    }

    private static final TOTAL_LISTENERS : String = "Total Listeners: ";
    private static final LISTENER_LABEL : String = " Listener: ";
    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(RawKeyEventHandler.TOTAL_LISTENERS);
        stringBuffer.appendint(this.eventListenerInterfaceList.size());
        var eventListenerInterface : RawKeyEventListener = null;
        var index : Int = 0;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.get(index) : RawKeyEventListener);
                stringBuffer.append(RawKeyEventHandler.LISTENER_LABEL);
                stringBuffer.append(eventListenerInterface.toString());
            } catch (e : haxe.Exception) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.TOSTRING, e);
            }
            index++;
        }
        return stringBuffer.toString();
    }

}

