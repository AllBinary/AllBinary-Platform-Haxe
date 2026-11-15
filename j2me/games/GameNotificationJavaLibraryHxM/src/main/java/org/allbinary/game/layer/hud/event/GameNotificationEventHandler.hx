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
package org.allbinary.game.layer.hud.event;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.NullEventListener;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;

class GameNotificationEventHandler extends BasicEventHandler {
    private static final instance : GameNotificationEventHandler = new GameNotificationEventHandler();
    public function new() {
        super();
    }

    public var enabled : Bool = true;
    // synchronized
    public override function removeAllListeners() : Void {
        var eventListenerInterface : EventListenerInterface = NullEventListener.NULL_EVENT_LISTENER;
        var list : BasicArrayList = this.eventListenerInterfaceList;
        if (list.size() > 0) {
            eventListenerInterface = (cast list.objectArray[0] : EventListenerInterface);
        }
        super.removeAllListeners();
        if (eventListenerInterface != NullEventListener.NULL_EVENT_LISTENER) {
            this.addListenerInterface(eventListenerInterface);
        }
    }

    public static function getInstance() : GameNotificationEventHandler {
        return GameNotificationEventHandler.instance;
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        if (!this.enabled) {
            return;
        }
        final gameNotificationListenerInterface : GameNotificationListenerInterface = (cast eventListenerInterface : GameNotificationListenerInterface);
        gameNotificationListenerInterface.onGameNotificationEvent((cast eventObject : GameNotificationEvent));
    }

}

