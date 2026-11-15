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
package org.allbinary.game.behavior.topview;

import org.allbinary.direction.Direction;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.tracking.TrackingEventCircularStaticPool;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

class PlayerTopViewCharacterBehavior extends TopViewCharacterBehavior {
    public final logUtil : LogUtil = LogUtil.getInstance();
    // throws Exception
    public override function terrainEvent(layer : AllBinaryLayer, direction : Direction, x : Int, y : Int, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellPosition : GeographicMapCellPosition) : Void {
        TrackingEventHandler.getInstance().fireEvent(TrackingEventCircularStaticPool.getInstance().getNextInstance(layer));
    }

    public override function terrainMove(layer : AllBinaryLayer, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, x : Int, y : Int) : Void {
        final basicGeographicMapUtil : BasicGeographicMapUtil = BasicGeographicMapUtil.getInstance();
        basicGeographicMapUtil.setPosition(geographicMapInterfaceArray, x, y);
    }

    private function moveIfOnScreen(layer : AllBinaryLayer, ax : Int, ay : Int) : Void {
    }

    private function isTiledLayerMoveable(terrainTiledLayer : AllBinaryTiledLayer, x : Int, y : Int) : Bool {
        return (terrainTiledLayer.getXP() + DisplayInfoSingleton.getInstance().getLastWidth() < terrainTiledLayer.getWidth() || x < 0) && (terrainTiledLayer.getXP() > 0 || x > 0);
    }

    public function new() {
        super();
    }
}

