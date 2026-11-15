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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicEventHandler implements BasicEventHandlerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final PERFORMANCE_MESSAGE : String = "Use Custom onEvent Methods for needed optimization";
    private var eventListenerInterfaceList : BasicArrayList;
    public function new() {
        this.eventListenerInterfaceList = new BasicArrayListD();
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final LISTENER : String = " Listener: ";
        stringBuffer.append("Total Listeners: ");
        stringBuffer.appendint(this.eventListenerInterfaceList.size());
        var eventListenerInterface : EventListenerInterface = null;
        var index : Int = 0;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.objectArray[index] : EventListenerInterface);
                stringBuffer.append(LISTENER);
                stringBuffer.append(StringUtil.getInstance().toString(eventListenerInterface));
            } catch (e : haxe.Exception) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.TOSTRING, e);
            }
            index++;
        }
        return stringBuffer.toString();
    }

    // synchronized
    public function removeAllListeners() : Void {
        this.eventListenerInterfaceList = new BasicArrayListD();
    }

    public function addListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        if (!this.eventListenerInterfaceList.contains(eventListenerInterface)) {
            this.eventListenerInterfaceList.add(eventListenerInterface);
        }
    }

    // synchronized
    public function addListenerInterface(eventListenerInterface : EventListenerInterface) : Void {
        if (!this.eventListenerInterfaceList.contains(eventListenerInterface)) {
            this.eventListenerInterfaceList.add(eventListenerInterface);
        }
    }

    public function removeListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        this.eventListenerInterfaceList.remove(eventListenerInterface);
    }

    // synchronized
    public function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.eventListenerInterfaceList.remove(eventListenerInterface);
    }

    // throws Exception
    // synchronized
    public function fireEvent(eventObject : AllBinaryEventObject) : Void {
        var index : Int = 0;
        var eventListenerInterface : EventListenerInterface = null;
        while (index < this.eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast this.eventListenerInterfaceList.objectArray[index] : EventListenerInterface);
                this.process(eventObject, eventListenerInterface);
            } catch (e : haxe.Exception) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
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

}

