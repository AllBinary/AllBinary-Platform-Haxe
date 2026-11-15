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
package org.allbinary.game.input.form;

import org.allbinary.game.layer.NullPathFindingLayer;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.waypoint.WaypointLayer;

class PrimaryWaypointHelper {
    private static final instance : PrimaryWaypointHelper = new PrimaryWaypointHelper();
    public static function getInstance() : PrimaryWaypointHelper {
        return PrimaryWaypointHelper.instance;
    }

    private var waypointLayer : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    public function new() {
    }

    public function getWaypointLayer() : PathFindingLayerInterface {
        return this.waypointLayer;
    }

    public function setWaypointLayer(waypointLayer : WaypointLayer) : Void {
        this.waypointLayer = waypointLayer;
    }

}

