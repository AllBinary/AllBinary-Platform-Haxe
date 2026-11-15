/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.game.combat.destroy.DestroyableInterface;
import org.allbinary.game.identification.GroupInterfaceCompositeInterface;
import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.layer.waypoint.WaypointLayerInterface;
import org.allbinary.util.BasicArrayList;

interface PathFindingLayerInterface extends WaypointLayerInterface extends GameKeyEventSourceInterface extends GroupInterfaceCompositeInterface extends DestroyableInterface {
    // throws Exception
    function getEndGeographicMapCellPositionList() : BasicArrayList;

    function shouldHandleStartSameAsEnd() : Bool;

    function getGeographicMapCellPositionArea() : GeographicMapCellPositionAreaBase;

    function getHudPaintable() : SelectionHudPaintable;

    // throws Exception
    function handleCost(ownerLayer : PathFindingLayerInterface) : Void;

    function getParentLayer() : PathFindingLayerInterface;

    function getRTSLayer2LogHelper() : RTSLayer2LogHelper;

    // throws Exception
    function setTarget(targetGameLayer : PathFindingLayerInterface) : Void;

}

