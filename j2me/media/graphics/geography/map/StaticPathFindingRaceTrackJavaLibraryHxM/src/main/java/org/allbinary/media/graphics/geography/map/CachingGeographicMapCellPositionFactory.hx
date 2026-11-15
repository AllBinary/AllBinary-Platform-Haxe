/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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

import org.allbinary.graphics.CellPosition;
import org.allbinary.util.ABHashtable;

class CachingGeographicMapCellPositionFactory extends BasicGeographicMapCellPositionFactory {
    public function new(geographicMapInterface : BasicGeographicMap) {
        super(geographicMapInterface);
    }

    // throws Exception
    public override function createInstance(i_column : Int, i_row : Int, width : Int, height : Int) : GeographicMapCellPosition {
        final hashtable : ABHashtable<Any, Any> = GeographicMapCellPositionFactory.getHashtable();
        final cellPositionKey : String = CellPosition.toStringColRow(i_column, i_row);
        var cellPositionCanBeNull : Any = hashtable.get(cellPositionKey);
        if (cellPositionCanBeNull == null) {
            cellPositionCanBeNull = this.geographicMapCellPositionFactoryInterface.getInstance(this.geographicMapInterface, i_column, i_row, this.getColumns(), this.getRows(), width, height);
            this.geographicMapCellPositionArray[i_row][i_column] = (cast cellPositionCanBeNull : GeographicMapCellPosition);
            hashtable.put(cellPositionKey, cellPositionCanBeNull);
        }
        return (cast cellPositionCanBeNull : GeographicMapCellPosition);
    }

}

