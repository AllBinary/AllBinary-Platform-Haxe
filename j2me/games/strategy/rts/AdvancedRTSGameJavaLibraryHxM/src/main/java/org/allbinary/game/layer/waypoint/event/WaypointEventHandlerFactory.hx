/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.waypoint.event;

import org.allbinary.game.identification.Group;

class WaypointEventHandlerFactory {
    private static final eventHandlerArray : haxe.ds.Vector<WaypointEventHandler> = haxe.ds.Vector.fromArrayCopy([new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler(), new WaypointEventHandler()]);
    public static function getInstance(groupInterface : Group) : WaypointEventHandler {
        return WaypointEventHandlerFactory.eventHandlerArray[Std.int(groupInterface.getGroupId())];
    }

    public static function removeAll() : Void {
        {
            var index : Int = WaypointEventHandlerFactory.eventHandlerArray.length - 1;
            while (index >= 0) {
            WaypointEventHandlerFactory.eventHandlerArray[index].removeAllListeners();
                index--;
            }
        }
    }

    public function new() {
    }
}

