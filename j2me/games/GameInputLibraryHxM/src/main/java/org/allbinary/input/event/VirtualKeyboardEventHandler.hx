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
package org.allbinary.input.event;

import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.handler.BasicEventHandler;

class VirtualKeyboardEventHandler extends BasicEventHandler {
    private static final gameKeyEventHandler : VirtualKeyboardEventHandler = new VirtualKeyboardEventHandler();
    public function new() {
        super();
    }

    public final SHOW_EVENT : VirtualKeyboardEvent = new VirtualKeyboardEvent(BooleanFactory.getInstance().TRUE);
    public final HIDE_EVENT : VirtualKeyboardEvent = new VirtualKeyboardEvent(BooleanFactory.getInstance().FALSE);
    public static function getInstance() : VirtualKeyboardEventHandler {
        return VirtualKeyboardEventHandler.gameKeyEventHandler;
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final virtualKeyboardEventListenerInterface : VirtualKeyboardEventListenerInterface = (cast eventListenerInterface : VirtualKeyboardEventListenerInterface);
        virtualKeyboardEventListenerInterface.onVirtualKeyboardEvent((cast eventObject : VirtualKeyboardEvent));
    }

    public function open() : Void {
        try {
            Sys.sleep(haxe.Int64.toInt(120) / 1000);
            this.fireEvent(this.SHOW_EVENT);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "open", e);
        }
    }

    // throws Exception
    public function close() : Void {
        try {
            Sys.sleep(haxe.Int64.toInt(120) / 1000);
            this.fireEvent(this.HIDE_EVENT);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CLOSE, e);
        }
    }

}

