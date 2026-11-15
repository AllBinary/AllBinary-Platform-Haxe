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
package org.allbinary.media.graphics.geography.map.topview;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.HashtableUtil;

class BasicTopViewGeographicMapCellTypeFactory extends GeographicMapCellTypeFactory {
    public final BLOCK_CELL_TYPE : BasicTopViewGeographicMapCellType;
    public final OFF_MAP_CELL_TYPE : BasicTopViewGeographicMapCellType;
    public final FLOOR_CELL_TYPE : BasicTopViewGeographicMapCellType;
    public final DOOR_CELL_TYPE : BasicTopViewGeographicMapCellType;
    public final STAIRS_UP_CELL_TYPE : BasicTopViewGeographicMapCellType;
    public final STAIRS_DOWN_CELL_TYPE : BasicTopViewGeographicMapCellType;
    public final OTHER_CELL_TYPE : BasicTopViewGeographicMapCellType;
    private final maxTileId : Int;
    public function new(tileTypeToTileIdsMap : ABHashtable<Any, Any>, maxTileId : Int) {
        super();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(commonStrings.START, this, commonStrings.CONSTRUCTOR);
        this.maxTileId = maxTileId;
        final basicTopViewGeographicMapStrings : BasicTopViewGeographicMapStrings = BasicTopViewGeographicMapStrings.getInstance();
        final geographicMapCellTypeFactory : GeographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance();
        final geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType> = geographicMapCellTypeFactory.getGeographicMapCellTypeArray();
        var type : Int = 0;
        if (geographicMapCellTypeArray[type] == null) {
            new RaceTrackGeographicMapCellType(CommonStrings.getInstance().UNKNOWN, type, 999, 0);
        } else {
        }
        var BLOCK_CELL_TYPE : BasicTopViewGeographicMapCellType = BasicTopViewGeographicMapCellType.createType(basicTopViewGeographicMapStrings.DEFAULT, 1, 1);
        var OFF_MAP_CELL_TYPE : BasicTopViewGeographicMapCellType = BLOCK_CELL_TYPE;
        var FLOOR_CELL_TYPE : BasicTopViewGeographicMapCellType = BLOCK_CELL_TYPE;
        var DOOR_CELL_TYPE : BasicTopViewGeographicMapCellType = BLOCK_CELL_TYPE;
        var STAIRS_UP_CELL_TYPE : BasicTopViewGeographicMapCellType = BLOCK_CELL_TYPE;
        var STAIRS_DOWN_CELL_TYPE : BasicTopViewGeographicMapCellType = BLOCK_CELL_TYPE;
        var OTHER_CELL_TYPE : BasicTopViewGeographicMapCellType = BLOCK_CELL_TYPE;
        final keyArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(tileTypeToTileIdsMap);
        final size : Int = keyArray.length;
        var idsWithTypeList : BasicArrayList = null;
        var key : String = null;
        var basicPlatormGeographicMapCellType : BasicTopViewGeographicMapCellType = null;
        for (index in 0...size) {
            key = (cast keyArray[index] : String);
            idsWithTypeList = (cast tileTypeToTileIdsMap.get(key) : BasicArrayList);
            if ((key == basicTopViewGeographicMapStrings.WALL)) {
                basicPlatormGeographicMapCellType = new BasicTopViewGeographicMapCellType(basicTopViewGeographicMapStrings.WALL, idsWithTypeList, 1000);
                BLOCK_CELL_TYPE = basicPlatormGeographicMapCellType;
            } else if ((key == basicTopViewGeographicMapStrings.OFF_MAP)) {
                basicPlatormGeographicMapCellType = new BasicTopViewGeographicMapCellType(basicTopViewGeographicMapStrings.OFF_MAP, idsWithTypeList, 1001);
                OFF_MAP_CELL_TYPE = basicPlatormGeographicMapCellType;
            } else if ((key == basicTopViewGeographicMapStrings.FLOOR)) {
                basicPlatormGeographicMapCellType = new BasicTopViewGeographicMapCellType(basicTopViewGeographicMapStrings.FLOOR, idsWithTypeList, 1);
                FLOOR_CELL_TYPE = basicPlatormGeographicMapCellType;
            } else if ((key == basicTopViewGeographicMapStrings.DOOR)) {
                basicPlatormGeographicMapCellType = new BasicTopViewGeographicMapCellType(basicTopViewGeographicMapStrings.DOOR, idsWithTypeList, 1);
                DOOR_CELL_TYPE = basicPlatormGeographicMapCellType;
            } else if ((key == basicTopViewGeographicMapStrings.STAIRS_UP)) {
                basicPlatormGeographicMapCellType = new BasicTopViewGeographicMapCellType(basicTopViewGeographicMapStrings.STAIRS_UP, idsWithTypeList, 1);
                STAIRS_UP_CELL_TYPE = basicPlatormGeographicMapCellType;
            } else if ((key == basicTopViewGeographicMapStrings.STAIRS_DOWN)) {
                basicPlatormGeographicMapCellType = new BasicTopViewGeographicMapCellType(basicTopViewGeographicMapStrings.STAIRS_DOWN, idsWithTypeList, 1);
                STAIRS_DOWN_CELL_TYPE = basicPlatormGeographicMapCellType;
            } else if ((key == basicTopViewGeographicMapStrings.OTHER)) {
                basicPlatormGeographicMapCellType = new BasicTopViewGeographicMapCellType(basicTopViewGeographicMapStrings.OTHER, idsWithTypeList, 1);
                OTHER_CELL_TYPE = basicPlatormGeographicMapCellType;
            }
        }
        this.BLOCK_CELL_TYPE = BLOCK_CELL_TYPE;
        this.OFF_MAP_CELL_TYPE = OFF_MAP_CELL_TYPE;
        this.FLOOR_CELL_TYPE = FLOOR_CELL_TYPE;
        this.DOOR_CELL_TYPE = DOOR_CELL_TYPE;
        this.STAIRS_UP_CELL_TYPE = STAIRS_UP_CELL_TYPE;
        this.STAIRS_DOWN_CELL_TYPE = STAIRS_DOWN_CELL_TYPE;
        this.OTHER_CELL_TYPE = OTHER_CELL_TYPE;
        type = this.maxTileId - 1;
        if (geographicMapCellTypeArray[type] == null) {
            new RaceTrackGeographicMapCellType(commonStrings.START, type, 1, 0);
        } else {
        }
        type = this.maxTileId - 2;
        if (geographicMapCellTypeArray[type] == null) {
            new RaceTrackGeographicMapCellType(commonStrings.START, type, 1, 0);
        } else {
        }
    }

    public override function getStartType() : Int {
        return this.maxTileId - 1;
    }

    public override function getEndType() : Int {
        return this.maxTileId - 2;
    }

    public override function getEmptyType() : Int {
        return this.FLOOR_CELL_TYPE.getTypes()[0];
    }

    public override function isPath(cellType : GeographicMapCellType) : Bool {
        if (this.FLOOR_CELL_TYPE.isType(cellType)) {
            return true;
        }
        return false;
    }

    public override function toString() : String {
        return new StringMaker().append("key: WALL/BLOCK_CELL_TYPE: ").append(this.BLOCK_CELL_TYPE.toString()).append("key: FLOOR_CELL_TYPE: ").append(this.FLOOR_CELL_TYPE.toString()).append("key: OTHER_CELL_TYPE: ").append(this.OTHER_CELL_TYPE.toString()).append("key: OFF_MAP_CELL_TYPE: ").append(this.OFF_MAP_CELL_TYPE.toString()).append("key: DOOR_CELL_TYPE: ").append(this.DOOR_CELL_TYPE.toString()).append("key: STAIRS_DOWN_CELL_TYPE: ").append(this.STAIRS_DOWN_CELL_TYPE.toString()).append("key: STAIRS_UP_CELL_TYPE: ").append(this.STAIRS_UP_CELL_TYPE.toString()).toString();
    }

}

