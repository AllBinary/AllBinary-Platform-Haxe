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
package org.allbinary.media.graphics.geography.map.platform;

//import java.util.Enumeration;
import org.allbinary.string.CommonStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.EnumerationUtil;

class BasicPlatormGeographicMapCellTypeFactory extends GeographicMapCellTypeFactory {
    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    public final BLOCK_CELL_TYPE : BasicPlatormGeographicMapCellType;
    public final JUMP_THRU_CELL_TYPE : BasicPlatormGeographicMapCellType;
    public final LADDER_CELL_TYPE : BasicPlatormGeographicMapCellType;
    private final maxTileId : Int;
    public function new(tileTypeToTileIdsMap : ABHashtable<Any, Any>, maxTileId : Int) {
        super();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(commonStrings.START, this, commonStrings.INIT);
        this.maxTileId = maxTileId;
        new GeographicMapCellType(0, 0);
        var BLOCK_CELL_TYPE : BasicPlatormGeographicMapCellType = BasicPlatormGeographicMapCellType.createType(1);
        var JUMP_THRU_CELL_TYPE : BasicPlatormGeographicMapCellType = BLOCK_CELL_TYPE;
        var LADDER_CELL_TYPE : BasicPlatormGeographicMapCellType = BLOCK_CELL_TYPE;
        final PLATFORM : String = "Platform";
        final JUMP_TRHU : String = "JumpThru";
        final LADDER : String = "Ladder";
        final enumeration : Enumeration = tileTypeToTileIdsMap.keys();
        var idsWithTypeList : BasicArrayList = null;
        var key : String = null;
        var basicPlatormGeographicMapCellType : BasicPlatormGeographicMapCellType = null;
        while (this.enumerationUtil.hasMoreElements(enumeration)) {
            key = (cast this.enumerationUtil.nextElement(enumeration) : String);
            this.logUtil.putF(key, this, commonStrings.INIT);
            idsWithTypeList = (cast tileTypeToTileIdsMap.get(key) : BasicArrayList);
            basicPlatormGeographicMapCellType = new BasicPlatormGeographicMapCellType(idsWithTypeList);
            if ((key == PLATFORM)) {
                BLOCK_CELL_TYPE = basicPlatormGeographicMapCellType;
            }
            if ((key == JUMP_TRHU)) {
                JUMP_THRU_CELL_TYPE = basicPlatormGeographicMapCellType;
            }
            if ((key == LADDER)) {
                LADDER_CELL_TYPE = basicPlatormGeographicMapCellType;
            }
        }
        this.BLOCK_CELL_TYPE = BLOCK_CELL_TYPE;
        this.JUMP_THRU_CELL_TYPE = JUMP_THRU_CELL_TYPE;
        this.LADDER_CELL_TYPE = LADDER_CELL_TYPE;
        new GeographicMapCellType(this.maxTileId - 1, 0);
        new GeographicMapCellType(this.maxTileId - 2, 0);
    }

    public override function getStartType() : Int {
        return this.maxTileId - 1;
    }

    public override function getEndType() : Int {
        return this.maxTileId - 2;
    }

    public override function getEmptyType() : Int {
        return 0;
    }

    public override function isPath(cellType : GeographicMapCellType) : Bool {
        if (cellType.getType() == 0) {
            return true;
        }
        return false;
    }

}

