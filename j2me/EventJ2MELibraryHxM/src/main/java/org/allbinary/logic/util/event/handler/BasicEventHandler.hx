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
package org.allbinary.logic.util.event.handler;

import jsinterop.annotations.JsType;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;
import jsinterop.annotations.JsProperty;

class BasicEventHandler implements BasicEventHandlerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final eventStrings : EventStrings = EventStrings.getInstance();
    public var eventListenerInterfaceList : BasicArrayList;
    public function new() {
        this.eventListenerInterfaceList = new BasicArrayListD();
    }

    public function removeAllListeners() : Void {
        this.eventListenerInterfaceList = new BasicArrayListD();
    }

    public function addListeners(vector : BasicArrayList) : Void {
        var eventListenerInterface : EventListenerInterface = null;
        final size : Int = vector.size();
        for (index in 0...size) {
            eventListenerInterface = (cast vector.get(index) : EventListenerInterface);
            this.addListenerInterface(eventListenerInterface);
        }
    }

    public function removeListeners(vector : BasicArrayList) : Void {
        var eventListenerInterface : EventListenerInterface = null;
        final size : Int = vector.size();
        for (index in 0...size) {
            eventListenerInterface = (cast vector.get(index) : EventListenerInterface);
            this.removeListener(eventListenerInterface);
        }
    }

    public function addListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        if (!this.eventListenerInterfaceList.contains(eventListenerInterface)) {
            this.eventListenerInterfaceList.add(eventListenerInterface);
        }
    }

    public function addListenerInterface(eventListenerInterface : EventListenerInterface) : Void {
        if (!this.eventListenerInterfaceList.contains(eventListenerInterface)) {
            this.eventListenerInterfaceList.add(eventListenerInterface);
        }
    }

    public function removeListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        this.eventListenerInterfaceList.remove(eventListenerInterface);
    }

    public function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.eventListenerInterfaceList.remove(eventListenerInterface);
    }

    // throws Exception
    public function fireEvent(eventObject : AllBinaryEventObject) : Void {
        var eventListenerInterface : EventListenerInterface = null;
        var index : Int = 0;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.get(index) : EventListenerInterface);
                this.process(eventObject, eventListenerInterface);
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.eventStrings.FIRE_EVENT, e);
            }
            index++;
        }
    }

    // throws Exception
    public function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        eventListenerInterface.onEvent(eventObject);
    }

    public function getEventListenerInterfaceListP() : BasicArrayList {
        return this.eventListenerInterfaceList;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.eventStrings.TOTAL_LISTENERS);
        stringBuffer.appendint(this.eventListenerInterfaceList.size());
        var eventListenerInterface : EventListenerInterface = null;
        var index : Int = 0;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.get(index) : EventListenerInterface);
                stringBuffer.append(this.eventStrings.LISTENER_LABEL);
                stringBuffer.append(eventListenerInterface.toString());
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.TOSTRING, e);
            }
            index++;
        }
        return stringBuffer.toString();
    }

}

