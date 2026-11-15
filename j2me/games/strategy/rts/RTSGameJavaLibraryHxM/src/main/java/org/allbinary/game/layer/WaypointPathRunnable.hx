/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

class WaypointPathRunnable extends WaypointPathRunnableBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
    }

    public override function run() : Void {
        try {
            this.pathFindingLayer.getWaypointRunnableLogHelper().start(this.pathFindingLayer);
            final waypointBehavior : WaypointBehaviorBase = this.pathFindingLayer.getWaypointBehavior();
            final geographicMapCellPosition : GeographicMapCellPosition = this.pathFindingLayer.getCurrentGeographicMapCellPosition();
            if (geographicMapCellPosition == null) {
                throw new haxe.Exception("Should never be running here");
            }
            waypointBehavior.setWaypointPathsList(this.targetPathFindingLayer.getWaypointBehavior().getWaypoint().getPathsListRunnable(geographicMapCellPosition));
            this.pathFindingLayer.getWaypointRunnableLogHelper().end(this.pathFindingLayer);
            Sys.sleep(haxe.Int64.toInt(15 + (this.priorityP * 2)) / 1000);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            this.setRunning(false);
        }
    }

    public override function isDone() : Bool {
        return true;
    }

}

