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

import org.allbinary.game.input.LocalPlayerInputIdFactory;
import org.allbinary.logic.util.event.EventListenerInterface;

class DownGameKeyEventHandler extends DownGameKeyEventHandlerBase {
    private static final instance : DownGameKeyEventHandler = new DownGameKeyEventHandler();
    private static final instanceArray : haxe.ds.Vector<DownGameKeyEventHandlerBase> = haxe.ds.Vector.fromArrayCopy(([new DownGameKeyEventHandlerBase(), new DownGameKeyEventHandlerBase(), new DownGameKeyEventHandlerBase(), new DownGameKeyEventHandlerBase(), new DownGameKeyEventHandlerBase(), new DownGameKeyEventHandlerBase()] : Array<DownGameKeyEventHandlerBase>));
    public static function getInstance() : DownGameKeyEventHandler {
        return DownGameKeyEventHandler.instance;
    }

    private final playerInputIdFactory : LocalPlayerInputIdFactory = LocalPlayerInputIdFactory.getInstance();
    public function getInstanceForDevice(deviceId : Int) : DownGameKeyEventHandlerBase {
        final playerInputId : Int = this.playerInputIdFactory.getPlayerForDevice(deviceId);
        return DownGameKeyEventHandler.instanceArray[playerInputId];
    }

    public function getInstanceForPlayer(playerInputId : Int) : DownGameKeyEventHandlerBase {
        return DownGameKeyEventHandler.instanceArray[playerInputId];
    }

    public function new() {
        super();
    }

    public override function removeAllListeners() : Void {
        super.removeAllListeners();
        {
            var index : Int = DownGameKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            DownGameKeyEventHandler.instanceArray[index].removeAllListeners();
                index--;
            }
        }
    }

    public override function removeListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListenerSingleThreaded(eventListenerInterface);
        {
            var index : Int = DownGameKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            DownGameKeyEventHandler.instanceArray[index].removeListenerSingleThreaded(eventListenerInterface);
                index--;
            }
        }
    }

    // synchronized
    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListener(eventListenerInterface);
        {
            var index : Int = DownGameKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            DownGameKeyEventHandler.instanceArray[index].removeListener(eventListenerInterface);
                index--;
            }
        }
    }

}

