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
package org.allbinary.game.tracking;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.handler.BasicEventHandler;

class TrackingEventHandler extends BasicEventHandler {
    private static final instance : TrackingEventHandler = new TrackingEventHandler();
    public static function getInstance() : TrackingEventHandler {
        return TrackingEventHandler.instance;
    }

    public function new() {
        super();
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final trackingEventListenerInterface : TrackingEventListenerInterface = (cast eventListenerInterface : TrackingEventListenerInterface);
        trackingEventListenerInterface.onMovement((cast eventObject : TrackingEvent));
    }

}

