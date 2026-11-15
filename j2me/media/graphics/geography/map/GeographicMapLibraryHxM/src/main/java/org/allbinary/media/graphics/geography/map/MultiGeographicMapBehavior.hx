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
package org.allbinary.media.graphics.geography.map;


class MultiGeographicMapBehavior {
    // throws Exception
    public function getCellTypeAt(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition) : haxe.ds.Vector<GeographicMapCellType> {
        final size : Int = geographicMapInterfaceArray.length;
        var cellType : GeographicMapCellType = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE;
        {
            var index : Int = size;
            while (--index >= 0) {
            cellType = geographicMapInterfaceArray[index].getCellTypeAt(geographicMapCellPosition);
            geographicMapCellTypeArray[index] = cellType;
            }
        }
        return geographicMapCellTypeArray;
    }

    public function new() {
    }
}

