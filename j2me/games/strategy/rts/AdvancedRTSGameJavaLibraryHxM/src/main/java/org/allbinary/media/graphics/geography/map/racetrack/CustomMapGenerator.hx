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
package org.allbinary.media.graphics.geography.map.racetrack;

import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.waypoint.WaypointLayer;
import org.allbinary.graphics.CellPosition;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;

class CustomMapGenerator extends CustomMapGeneratorBase {
    private final customMapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>;
    private final raceTrackGeographicMap : RaceTrackGeographicMap;
    private final geographicMapCellTypeFactory : GeographicMapCellTypeFactory;
    public function new(raceTrackGeographicMap : RaceTrackGeographicMap) {
        super();
        this.raceTrackGeographicMap = raceTrackGeographicMap;
        this.geographicMapCellTypeFactory = this.raceTrackGeographicMap.getGeographicMapCellTypeFactory();
        final mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = raceTrackGeographicMap.getRaceTrackData().getMapArray();
        final size2 : Int = mapArray[0].length;
        this.customMapArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...mapArray.length) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...size2) 0])]);
        if (mapArray.length != this.customMapArray.length || mapArray[0].length != this.customMapArray[0].length) {
            throw new haxe.Exception("Array Incorrect");
        }
    }

    // throws Exception
    public override function copyMapIntoCustomMap() : Void {
        var mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = this.raceTrackGeographicMap.getRaceTrackData().getMapArray();
        var startIndex2 : Int = mapArray[0].length - 1;
        {
            var index : Int = mapArray.length - 1;
            while (index >= 0) {
            {
                var index2 : Int = startIndex2;
                while (index2 >= 0) {
                this.customMapArray[index][index2] = this.getCustomType(index2, index, mapArray[index][index2]);
                    index2--;
                }
            }
                index--;
            }
        }
    }

    private final dropCellPositionHistory : DropCellPositionHistory = DropCellPositionHistory.getInstance();
    // throws Exception
    public override function getCustomType(column : Int, row : Int, currentType : Int) : Int {
        final emptyType : Int = this.geographicMapCellTypeFactory.getEmptyType();
        final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = this.raceTrackGeographicMap.getGeographicMapCellPositionFactory();
        final cellPosition : CellPosition = geographicMapCellPositionFactory.getAt(column, row);
        if (this.dropCellPositionHistory.isCellPositionWithDrop(cellPosition)) {
            final layer : AllBinaryLayer = this.dropCellPositionHistory.getLayerInterface(cellPosition);
            if (layer == AllBinaryLayer.NULL_ALLBINARY_LAYER) {
                return emptyType;
            }
            final rtsLayer : AdvancedRTSGameLayer = (cast layer : AdvancedRTSGameLayer);
            if (!(rtsLayer.getType() == WaypointLayer.getStaticType())) {
                return emptyType;
            }
        }
        return currentType;
    }

    public override function getCustomMapArray() : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        return this.customMapArray;
    }

}

