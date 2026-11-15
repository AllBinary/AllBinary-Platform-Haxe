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

class GameMidletEventHandler extends BasicEventHandler {
    private static final gameKeyEventHandler : GameMidletEventHandler = new GameMidletEventHandler();
    public function new() {
        super();
    }

    public static function getInstance() : GameMidletEventHandler {
        return GameMidletEventHandler.gameKeyEventHandler;
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final gameMidletEventListener : GameMidletEventListener = (cast eventListenerInterface : GameMidletEventListener);
        gameMidletEventListener.onGameEnd(eventObject);
    }

}

