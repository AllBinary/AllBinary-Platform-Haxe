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
package org.allbinary.android.input.motion.event;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AnalogControllerConfigurationEventHandler extends BasicEventHandler {
    private static final instance : AnalogControllerConfigurationEventHandler = new AnalogControllerConfigurationEventHandler();
    public static function getInstance() : AnalogControllerConfigurationEventHandler {
        return AnalogControllerConfigurationEventHandler.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(analogControllerConfigurationEventListenerInterface : AnalogControllerConfigurationEventListenerInterface) : Void {
        if (!this.list.contains(analogControllerConfigurationEventListenerInterface)) {
            this.list.add(analogControllerConfigurationEventListenerInterface);
        }
    }

    public override function removeAllListeners() : Void {
        this.list.clear();
        super.removeAllListeners();
    }

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
                var playerGameInput : AnalogControllerConfigurationEventListenerInterface = (cast this.list.objectArray[index] : AnalogControllerConfigurationEventListenerInterface);
                playerGameInput.onAnalogControllerConfigurationEvent((cast eventObject : AnalogControllerConfigurationEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final analogControllerConfigurationEventListenerInterface : AnalogControllerConfigurationEventListenerInterface = ((cast eventListenerInterface : AnalogControllerConfigurationEventListenerInterface));
        analogControllerConfigurationEventListenerInterface.onAnalogControllerConfigurationEvent((cast eventObject : AnalogControllerConfigurationEvent));
    }

}

