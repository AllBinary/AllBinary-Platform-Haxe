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

import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory;
import org.allbinary.util.BasicArrayList;

class GeographicMapTopViewLayerBehavior extends TopViewGameLayerBehavior {
    public function new(maxGravityActionIndex : Int) {
        super(maxGravityActionIndex);
    }

    // throws Exception
    public function getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer, x : Int, y : Int) : GeographicMapCellPosition {
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    }

    // throws Exception
    public function getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition, velocityProperties : VelocityProperties, layer : AllBinaryLayer) : GeographicMapCellPosition {
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    }

    // throws Exception
    public function getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPositionList : BasicArrayList, velocityProperties : VelocityProperties, layer : AllBinaryLayer) : GeographicMapCellPosition {
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    }

    // throws Exception
    public function gravity(velocityProperties : VelocityProperties, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition) : Void {
    }

    // throws Exception
    public function left(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer) : Void {
    }

    // throws Exception
    public function move(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer, x : Int, y : Int) : Bool {
        return false;
    }

    // throws Exception
    public function moveAndLand(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition, velocityProperties : VelocityProperties, layer : AllBinaryLayer, x : Int, y : Int) : Void {
    }

    // throws Exception
    public function right(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer) : Void {
    }

    public function hasSolidBlock(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>) : Bool {
        final size : Int = geographicMapInterfaceArray.length;
        var basicTopViewGeographicMapCellTypeFactory : BasicTopViewGeographicMapCellTypeFactory = null;
        for (index in 0...size) {
            basicTopViewGeographicMapCellTypeFactory = (cast geographicMapInterfaceArray[index].getGeographicMapCellTypeFactory() : BasicTopViewGeographicMapCellTypeFactory);
            if (basicTopViewGeographicMapCellTypeFactory.BLOCK_CELL_TYPE.isType(geographicMapCellTypeArray[index])) {
                return true;
            }
        }
        return false;
    }

    public function isOffMap(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>) : Bool {
        final size : Int = geographicMapInterfaceArray.length;
        var basicTopViewGeographicMapCellTypeFactory : BasicTopViewGeographicMapCellTypeFactory = null;
        for (index in 0...size) {
            basicTopViewGeographicMapCellTypeFactory = (cast geographicMapInterfaceArray[index].getGeographicMapCellTypeFactory() : BasicTopViewGeographicMapCellTypeFactory);
            if (basicTopViewGeographicMapCellTypeFactory.OFF_MAP_CELL_TYPE.isType(geographicMapCellTypeArray[index])) {
                return true;
            }
        }
        return false;
    }

}

