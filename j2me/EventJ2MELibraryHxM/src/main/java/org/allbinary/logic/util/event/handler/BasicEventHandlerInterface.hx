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
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.util.BasicArrayList;
import jsinterop.annotations.JsMethod;

interface BasicEventHandlerInterface {
    function addListenerInterface(eventListenerInterface : EventListenerInterface) : Void;

    function addListeners(basicArrayList : BasicArrayList) : Void;

    // throws Exception
    function fireEvent(eventObject : AllBinaryEventObject) : Void;

    function removeAllListeners() : Void;

    function removeListener(eventListenerInterface : EventListenerInterface) : Void;

}

