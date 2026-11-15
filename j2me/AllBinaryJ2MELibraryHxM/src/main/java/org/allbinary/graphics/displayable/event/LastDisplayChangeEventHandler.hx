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
package org.allbinary.graphics.displayable.event;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.handler.BasicEventHandler;

class LastDisplayChangeEventHandler extends BasicEventHandler {
    private static final SINGLETON : LastDisplayChangeEventHandler = new LastDisplayChangeEventHandler();
    public static function getInstance() : LastDisplayChangeEventHandler {
        return LastDisplayChangeEventHandler.SINGLETON;
    }

    public function new() {
        super();
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final displayChangeEventListener : DisplayChangeEventListener = ((cast eventListenerInterface : DisplayChangeEventListener));
        displayChangeEventListener.onDisplayChangeEvent((cast eventObject : DisplayChangeEvent));
    }

}

