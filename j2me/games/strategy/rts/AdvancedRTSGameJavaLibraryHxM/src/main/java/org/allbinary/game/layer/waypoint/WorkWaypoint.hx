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
package org.allbinary.game.layer.waypoint;

import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.geological.resources.GeologicalGeographicMapCellPosition;
import org.allbinary.game.layer.geological.resources.GeologicalResource;
import org.allbinary.game.layer.unit.UnitLayer;
import org.allbinary.game.layer.unit.UnitWaypointBehavior;
import org.allbinary.media.audio.WorkSound;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class WorkWaypoint extends Waypoint {
    public static final ID : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(25);
    public function new(ownerLayer : PathFindingLayerInterface) {
        super(ownerLayer, WorkSound.getInstance());
    }

    // throws Exception
    public function visit(unitLayer : UnitLayer) : Void {
        if (unitLayer.getGroupInterface()[0] != this.ownerLayer.getGroupInterface()[0]) {
            return;
        }
        final size : Int = this.getConnectedWaypointList().size();
        if (size > 0) {
            final occupyList : BasicArrayList = this.ownerLayer.getGeographicMapCellPositionArea().getOccupyingGeographicMapCellPositionList();
            var outOfResources : Bool = true;
            var geologicalGeographicMapCellPosition : GeologicalGeographicMapCellPosition = null;
            var geologicalResource : GeologicalResource = null;
            {
                var index : Int = occupyList.size();
                while (--index >= 0) {
                geologicalGeographicMapCellPosition = (cast occupyList.get(index) : GeologicalGeographicMapCellPosition);
                geologicalResource = geologicalGeographicMapCellPosition.getGeologicalResource();
                if (geologicalResource.getTotal() >= 1) {
                    outOfResources = false;
                    final maxResourceLoad : Int = Std.int(unitLayer.getMaxResourceLoad());
                    geologicalResource.remove(maxResourceLoad);
                    unitLayer.setLoad(maxResourceLoad);
                }
                }
            }
            final waypointInfoHudPaintable : WaypointInfoHudPaintable = (cast this.ownerLayer.getHudPaintable() : WaypointInfoHudPaintable);
            if (this.ownerLayer == waypointInfoHudPaintable.getRtsLayer()) {
                waypointInfoHudPaintable.updateSelectionInfo();
            }
            if (!outOfResources) {
                final unitWaypointBehavior : UnitWaypointBehavior = (cast unitLayer.getWaypointBehavior() : UnitWaypointBehavior);
                var rtsLayer : RTSLayer = null;
                while (this.getConnectedWaypointList().size() > 0) {
                    rtsLayer = (cast this.getConnectedWaypointList().get(0) : RTSLayer);
                    if (rtsLayer.isDestroyed()) {
                        this.getConnectedWaypointList().remove(rtsLayer);
                    } else {
                        unitWaypointBehavior.insertWaypoint(0, rtsLayer);
                        break;
                    }
                }
            }
        }
    }

    public override function getType() : Int {
        return 2;
    }

}

