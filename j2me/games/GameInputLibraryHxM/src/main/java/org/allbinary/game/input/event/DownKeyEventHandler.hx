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

class DownKeyEventHandler extends DownKeyEventHandlerBase {
    private static final instance : DownKeyEventHandler = new DownKeyEventHandler();
    private static final instanceArray : haxe.ds.Vector<DownKeyEventHandlerBase> = haxe.ds.Vector.fromArrayCopy(([new DownKeyEventHandlerBase(), new DownKeyEventHandlerBase(), new DownKeyEventHandlerBase(), new DownKeyEventHandlerBase(), new DownKeyEventHandlerBase(), new DownKeyEventHandlerBase()] : Array<DownKeyEventHandlerBase>));
    public static function getInstance() : DownKeyEventHandler {
        return DownKeyEventHandler.instance;
    }

    private final playerInputIdFactory : LocalPlayerInputIdFactory = LocalPlayerInputIdFactory.getInstance();
    public function getInstanceForDevice(deviceId : Int) : DownKeyEventHandlerBase {
        final playerInputId : Int = this.playerInputIdFactory.getPlayerForDevice(deviceId);
        return DownKeyEventHandler.instanceArray[playerInputId];
    }

    public function getInstanceForPlayer(playerInputId : Int) : DownKeyEventHandlerBase {
        return DownKeyEventHandler.instanceArray[playerInputId];
    }

    public function new() {
        super();
    }

    public override function removeAllListeners() : Void {
        super.removeAllListeners();
        {
            var index : Int = DownKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            DownKeyEventHandler.instanceArray[index].removeAllListeners();
                index--;
            }
        }
    }

    public override function removeListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListenerSingleThreaded(eventListenerInterface);
        {
            var index : Int = DownKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            DownKeyEventHandler.instanceArray[index].removeListenerSingleThreaded(eventListenerInterface);
                index--;
            }
        }
    }

    // synchronized
    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListener(eventListenerInterface);
        {
            var index : Int = DownKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            DownKeyEventHandler.instanceArray[index].removeListener(eventListenerInterface);
                index--;
            }
        }
    }

}

