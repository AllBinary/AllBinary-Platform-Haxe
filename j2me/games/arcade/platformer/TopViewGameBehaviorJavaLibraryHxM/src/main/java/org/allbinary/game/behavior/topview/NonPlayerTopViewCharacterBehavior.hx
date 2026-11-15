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

import org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.game.terrain.BasicTerrainInfo;
import org.allbinary.game.terrain.TerrainEvent;
import org.allbinary.game.terrain.TerrainEventCircularStaticPool;
import org.allbinary.game.terrain.TerrainEventHandler;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.math.AngleFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;

class NonPlayerTopViewCharacterBehavior extends TopViewCharacterBehavior {
    private final geographicMapBehavior : MultiGeographicMapBehavior = new MultiGeographicMapBehavior();
    private final CLIFF : BasicTerrainInfo = new BasicTerrainInfo(AngleFactory.getInstance().DOWN);
    // throws Exception
    public function terrainEvent(layer : AllBinaryLayer, direction : Direction, x : Int, y : Int, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition) : Void {
        final maxColumns : Int = geographicMapInterfaceArray[0].getAllBinaryTiledLayer().getColumns();
        if (geographicMapCellPosition.getColumn() > 0 && geographicMapCellPosition.getColumn() < maxColumns) {
            var nextTerrainGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
            final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory();
            if (direction == DirectionFactory.getInstance().LEFT) {
                nextTerrainGeographicMapCellPosition = geographicMapCellPositionFactory.getAt(geographicMapCellPosition.getColumn() - 1, geographicMapCellPosition.getRow());
            } else if (direction == DirectionFactory.getInstance().RIGHT) {
                nextTerrainGeographicMapCellPosition = geographicMapCellPositionFactory.getAt(geographicMapCellPosition.getColumn() + 1, geographicMapCellPosition.getRow());
            }
            this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, nextTerrainGeographicMapCellPosition);
            final hasSolidBlock : Bool = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            if (!hasSolidBlock) {
                final terrainEvent : TerrainEvent = TerrainEventCircularStaticPool.getInstance().getNext(this.CLIFF);
                TerrainEventHandler.getInstance(layer).fireEvent(terrainEvent);
            }
        }
    }

    public override function terrainMove(layer : AllBinaryLayer, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, x : Int, y : Int) : Void {
        layer.moveDXY(x, y);
    }

    public function new() {
        super();
    }
}

