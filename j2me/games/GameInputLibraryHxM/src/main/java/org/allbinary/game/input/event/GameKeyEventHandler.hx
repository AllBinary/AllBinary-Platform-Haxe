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
package org.allbinary.game.input.event;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.string.CommonStrings;

class GameKeyEventHandler {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : GameKeyEventHandler = new GameKeyEventHandler();
    public static function getInstance() : GameKeyEventHandler {
        return GameKeyEventHandler.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final pressGameKeyEventHandler : PressGameKeyEventHandler = PressGameKeyEventHandler.getInstance();
    private final upGameKeyEventHandler : UpGameKeyEventHandler = UpGameKeyEventHandler.getInstance();
    private final downGameKeyEventHandler : DownGameKeyEventHandler = DownGameKeyEventHandler.getInstance();
    // synchronized
    public function removeAllListeners() : Void {
        this.pressGameKeyEventHandler.removeAllListeners();
        this.upGameKeyEventHandler.removeAllListeners();
        this.downGameKeyEventHandler.removeAllListeners();
    }

    public function addListenerForPlayer(eventListenerInterface : EventListenerInterface, playerInputId : Int) : Void {
        this.logUtil.putF(Std.string(eventListenerInterface), this, this.commonStrings.ADD_LISTENER);
        this.pressGameKeyEventHandler.addListenerSingleThreaded(eventListenerInterface);
        this.upGameKeyEventHandler.getInstanceForPlayer(playerInputId).addListenerSingleThreaded(eventListenerInterface);
        this.downGameKeyEventHandler.getInstanceForPlayer(playerInputId).addListenerSingleThreaded(eventListenerInterface);
    }

    public function addListener(eventListenerInterface : EventListenerInterface) : Void {
        this.logUtil.putF(Std.string(eventListenerInterface), this, this.commonStrings.ADD_LISTENER);
        this.pressGameKeyEventHandler.addListenerSingleThreaded(eventListenerInterface);
        this.upGameKeyEventHandler.addListenerSingleThreaded(eventListenerInterface);
        this.downGameKeyEventHandler.addListenerSingleThreaded(eventListenerInterface);
    }

    public function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.logUtil.putF(Std.string(eventListenerInterface), this, this.commonStrings.REMOVE_LISTENER);
        this.pressGameKeyEventHandler.removeListenerSingleThreaded(eventListenerInterface);
        this.upGameKeyEventHandler.removeListenerSingleThreaded(eventListenerInterface);
        this.downGameKeyEventHandler.removeListenerSingleThreaded(eventListenerInterface);
    }

    public function new() {
    }
}

