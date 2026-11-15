/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
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
package org.allbinary.game.layer.geological.resources;

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface;

class GeologicalGeographicMapCellPositionFactory implements GeographicMapCellPositionFactoryInterface {
    private final resourcePerMapCellType : haxe.ds.Vector<Int>;
    public function new(resourcePerMapCellType : haxe.ds.Vector<Int>) {
        this.resourcePerMapCellType = resourcePerMapCellType;
    }

    // throws Exception
    public function getInstance(geographicMapInterface : BasicGeographicMap, i_column : Int, i_row : Int, columns : Int, rows : Int, width : Int, height : Int) : GeographicMapCellPosition {
        var tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        var resources : Int = this.resourcePerMapCellType[tiledLayer.getCell(i_column, i_row)] + MyRandomFactory.getInstance().getAbsoluteNextInt(1000);
        return new GeologicalGeographicMapCellPosition(i_column, i_row, columns, rows, width, height, new GeologicalResource(resources));
    }

}

