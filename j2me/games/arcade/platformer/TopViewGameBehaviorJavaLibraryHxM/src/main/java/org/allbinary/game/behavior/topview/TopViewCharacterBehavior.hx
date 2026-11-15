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
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory;

class TopViewCharacterBehavior {
    // throws Exception
    public function terrainEvent(layer : AllBinaryLayer, direction : Direction, x : Int, y : Int, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellPosition : GeographicMapCellPosition) : Void {
    }

    public function terrainMove(layer : AllBinaryLayer, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, x : Int, y : Int) : Void {
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

    public function new() {
    }
}

