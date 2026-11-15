/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.layer.Layer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;

class NullRaceTrackGeographicMap implements RaceTrackGeographicMapInterface {
    public static final NULL_RACE_TRACK_GEOGRAPHIC_MAP : NullRaceTrackGeographicMap = new NullRaceTrackGeographicMap();
    public function getId() : Null<Int> {
        throw new haxe.Exception();
    }

    public function getName() : String {
        throw new haxe.Exception();
    }

    public function reset() : Void {
        throw new haxe.Exception();
    }

    public function getAllBinaryTiledLayer() : AllBinaryTiledLayer {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getCellPositionsAt(layer : Layer, currentCellPositionArray : haxe.ds.Vector<haxe.ds.Vector<GeographicMapCellPosition>>, cellPositionArray : haxe.ds.Vector<haxe.ds.Vector<GeographicMapCellPosition>>) : Bool {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getCellPositionAtXY(x : Int, y : Int) : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getCellPositionAtXYNoThrow(x : Int, y : Int) : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    public function getCellTypeFromMapCellTypeInt(cellTypeId : Int) : Int {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getCellTypeAtXY(x : Int, y : Int) : GeographicMapCellType {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getCellTypeAt(geographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellType {
        throw new haxe.Exception();
    }

    public function getGeographicMapCellPositionFactory() : BasicGeographicMapCellPositionFactory {
        throw new haxe.Exception();
    }

    public function getGeographicMapCellPositionFactoryInterface() : GeographicMapCellPositionFactoryInterface {
        throw new haxe.Exception();
    }

    public function getForegroundBasicColor() : BasicColor {
        throw new haxe.Exception();
    }

    public function getBackgroundBasicColor() : BasicColor {
        throw new haxe.Exception();
    }

    public function getRaceTrackInfo() : RaceTrackInfo {
        throw new haxe.Exception();
    }

    public function setRaceTrackInfo(aRaceTrackInfo : RaceTrackInfo) : Void {
        throw new haxe.Exception();
    }

    public function getRaceTrackData() : RaceTrackData {
        throw new haxe.Exception();
    }

    public function setRaceTrackData(raceTrackData : RaceTrackData) : Void {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

