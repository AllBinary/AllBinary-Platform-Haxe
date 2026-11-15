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
package org.allbinary.game;

import org.allbinary.business.advertisement.GameAdStateBase;
import org.allbinary.business.advertisement.AdConfiguration;
import org.allbinary.input.event.VirtualKeyboardEvent;
import org.allbinary.input.event.VirtualKeyboardEventHandler;
import org.allbinary.input.event.VirtualKeyboardEventListenerInterface;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class GameAdState extends GameAdStateBase implements VirtualKeyboardEventListenerInterface {
    public function new(adConfiguration : AdConfiguration) {
        super(adConfiguration);
        VirtualKeyboardEventHandler.getInstance().addListenerInterface(this);
    }

    // throws Exception
    public override function onVirtualKeyboardEvent(virtualKeyboardEvent : VirtualKeyboardEvent) : Void {
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        super.onEvent(eventObject);
    }

}

