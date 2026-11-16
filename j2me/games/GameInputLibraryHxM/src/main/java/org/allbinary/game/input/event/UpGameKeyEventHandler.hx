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

class UpGameKeyEventHandler extends UpGameKeyEventHandlerBase {
    private static final instance : UpGameKeyEventHandler = new UpGameKeyEventHandler();
    private static final instanceArray : haxe.ds.Vector<UpGameKeyEventHandlerBase> = haxe.ds.Vector.fromArrayCopy(([new UpGameKeyEventHandlerBase(), new UpGameKeyEventHandlerBase(), new UpGameKeyEventHandlerBase(), new UpGameKeyEventHandlerBase(), new UpGameKeyEventHandlerBase(), new UpGameKeyEventHandlerBase()] : Array<UpGameKeyEventHandlerBase>));
    public static function getInstance() : UpGameKeyEventHandler {
        return UpGameKeyEventHandler.instance;
    }

    private final playerInputIdFactory : LocalPlayerInputIdFactory = LocalPlayerInputIdFactory.getInstance();
    public function getInstanceForDevice(deviceId : Int) : UpGameKeyEventHandlerBase {
        final playerInputId : Int = this.playerInputIdFactory.getPlayerForDevice(deviceId);
        return UpGameKeyEventHandler.instanceArray[playerInputId];
    }

    public function getInstanceForPlayer(playerInputId : Int) : UpGameKeyEventHandlerBase {
        return UpGameKeyEventHandler.instanceArray[playerInputId];
    }

    public function new() {
        super();
    }

    public override function removeAllListeners() : Void {
        super.removeAllListeners();
        {
            var index : Int = UpGameKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            UpGameKeyEventHandler.instanceArray[index].removeAllListeners();
                index--;
            }
        }
    }

    public override function removeListenerSingleThreaded(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListenerSingleThreaded(eventListenerInterface);
        {
            var index : Int = UpGameKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            UpGameKeyEventHandler.instanceArray[index].removeListenerSingleThreaded(eventListenerInterface);
                index--;
            }
        }
    }

    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        super.removeListener(eventListenerInterface);
        {
            var index : Int = UpGameKeyEventHandler.instanceArray.length - 1;
            while (index >= 0) {
            UpGameKeyEventHandler.instanceArray[index].removeListener(eventListenerInterface);
                index--;
            }
        }
    }

}

