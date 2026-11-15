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
package org.allbinary.game.midlet;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.handler.BasicEventHandler;

class DemoGameMidletEventHandler extends BasicEventHandler {
    private static final gameKeyEventHandler : DemoGameMidletEventHandler = new DemoGameMidletEventHandler();
    public function new() {
        super();
    }

    public static function getInstance() : DemoGameMidletEventHandler {
        return DemoGameMidletEventHandler.gameKeyEventHandler;
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final demoGameMidletEventListener : DemoGameMidletEventListener = (cast eventListenerInterface : DemoGameMidletEventListener);
        demoGameMidletEventListener.onDemoGameMidletEvent((cast eventObject : DemoGameMidletEvent));
    }

}

