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

class UpKeyEventHandler extends UpKeyEventHandlerBase {
    private static final instance : UpKeyEventHandler = new UpKeyEventHandler();
    private static final instanceArray : haxe.ds.Vector<UpKeyEventHandlerBase> = haxe.ds.Vector.fromArrayCopy(([new UpKeyEventHandlerBase(), new UpKeyEventHandlerBase(), new UpKeyEventHandlerBase(), new UpKeyEventHandlerBase(), new UpKeyEventHandlerBase(), new UpKeyEventHandlerBase()] : Array<UpKeyEventHandlerBase>));
    public static function getInstance() : UpKeyEventHandler {
        return UpKeyEventHandler.instance;
    }

    private final playerInputIdFactory : LocalPlayerInputIdFactory = LocalPlayerInputIdFactory.getInstance();
    public function getInstanceForDevice(deviceId : Int) : UpKeyEventHandlerBase {
        final playerInputId : Int = this.playerInputIdFactory.getPlayerForDevice(deviceId);
        return UpKeyEventHandler.instanceArray[playerInputId];
    }

    public function getInstanceForPlayer(playerInputId : Int) : UpKeyEventHandlerBase {
        return UpKeyEventHandler.instanceArray[playerInputId];
    }

    public function new() {
        super();
    }

    public override function removeAllListeners() : Void {
        super.removeAllListeners();
        {
            var index : Int = UpKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            UpKeyEventHandler.instanceArray[index].removeAllListeners();
                index--;
            }
        }
    }

    public override function removeListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListenerSingleThreaded(eventListenerInterface);
        {
            var index : Int = UpKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            UpKeyEventHandler.instanceArray[index].removeListenerSingleThreaded(eventListenerInterface);
                index--;
            }
        }
    }

    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListener(eventListenerInterface);
        {
            var index : Int = UpKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            UpKeyEventHandler.instanceArray[index].removeListener(eventListenerInterface);
                index--;
            }
        }
    }

}

