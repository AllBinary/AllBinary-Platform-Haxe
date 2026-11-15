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

import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.NullPathFindingLayer;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.unit.UnitLayer;
import org.allbinary.game.layer.unit.UnitWaypointBehavior;
import org.allbinary.util.BasicArrayList;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;

class AssignWaypointsUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AssignWaypointsUtil = new AssignWaypointsUtil();
    public static function getInstance() : AssignWaypointsUtil {
        return AssignWaypointsUtil.instance;
    }

    private final WAYPOINT_EVENT : RTSLayerEvent = new RTSLayerEvent(NullPathFindingLayer.NULL_PATH_FINDING_LAYER);
    public function set(unitLayer : UnitLayer, ownerAdvancedRTSGameLayer : AdvancedRTSGameLayer) : Void {
        try {
            var list : BasicArrayList = ownerAdvancedRTSGameLayer.getWaypointBehavior().getOwnedWaypointList();
            var unitWaypointBehavior : UnitWaypointBehavior = (cast unitLayer.getWaypointBehavior() : UnitWaypointBehavior);
            {
                var index : Int = list.size() - 1;
                while (index >= 0) {
                var waypointLayer : RTSLayer = (cast list.get(index) : RTSLayer);
                this.WAYPOINT_EVENT.setRtsLayer(waypointLayer);
                unitWaypointBehavior.onWaypointEvent(this.WAYPOINT_EVENT);
                    index--;
                }
            }
            final waypointLayer : PathFindingLayerInterface = PrimaryWaypointHelper.getInstance().getWaypointLayer();
            if (waypointLayer != NullPathFindingLayer.NULL_PATH_FINDING_LAYER) {
                this.WAYPOINT_EVENT.setRtsLayer(waypointLayer);
                unitWaypointBehavior.onWaypointEvent(this.WAYPOINT_EVENT);
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "set", e);
        }
    }

    public function new() {
    }
}

