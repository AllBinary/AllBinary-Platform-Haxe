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
package org.allbinary.game.layer.building.event;

import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.handler.BasicEventHandler;

class BuildingEventHandler extends BasicEventHandler {
    private static var eventHandler : BuildingEventHandler = new BuildingEventHandler();
    public function new() {
        super();
    }

    public static function getInstance() : BuildingEventHandler {
        return BuildingEventHandler.eventHandler;
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final buildingEventListenerInterface : BuildingEventListenerInterface = ((cast eventListenerInterface : BuildingEventListenerInterface));
        buildingEventListenerInterface.onBuildingEvent((cast eventObject : RTSLayerEvent));
    }

}

