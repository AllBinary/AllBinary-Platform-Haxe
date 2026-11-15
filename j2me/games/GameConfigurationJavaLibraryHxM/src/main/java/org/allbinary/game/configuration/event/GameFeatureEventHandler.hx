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
package org.allbinary.game.configuration.event;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.handler.BasicEventHandler;

class GameFeatureEventHandler extends BasicEventHandler {
    private static final gameKeyEventHandler : GameFeatureEventHandler = new GameFeatureEventHandler();
    public function new() {
        super();
    }

    public static function getInstance() : GameFeatureEventHandler {
        return GameFeatureEventHandler.gameKeyEventHandler;
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final gameFeatureListenerInterface : GameFeatureListenerInterface = ((cast eventListenerInterface : GameFeatureListenerInterface));
        gameFeatureListenerInterface.onGameFeatureChange((cast eventObject : GameFeatureEvent));
    }

}

