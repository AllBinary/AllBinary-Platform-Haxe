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
package org.allbinary.media.graphics.geography.map.racetrack;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;

class BaseRaceTrackGeographicMap extends BasicGeographicMap implements RaceTrackGeographicMapInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var raceTrackInfo : RaceTrackInfo;
    private var raceTrackData : RaceTrackData;
    private var miniGeographicMap : BasicGeographicMap;
    public function new(raceTrackInfo : RaceTrackInfo, raceTrackData : RaceTrackData, tiledLayer : AllBinaryTiledLayer, miniGeographicMap : BasicGeographicMap, geographicMapCellPositionFactoryInterface : GeographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory : GeographicMapCellPositionBaseFactory, geographicMapCellTypeFactory : GeographicMapCellTypeFactory) {
        super(raceTrackInfo.getId(), raceTrackInfo.getName(), raceTrackData.getCellTypeIdToGeographicMapCellTypeArray(), tiledLayer, raceTrackInfo.getForegroundBasicColor(), raceTrackInfo.getBackgroundBasicColor(), geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory);
        this.raceTrackInfo = raceTrackInfo;
        this.raceTrackData = raceTrackData;
        this.miniGeographicMap = miniGeographicMap;
        var miniTiledLayer : AllBinaryTiledLayer = this.miniGeographicMap.getAllBinaryTiledLayer();
        if (miniTiledLayer.getColumns() != this.getGeographicMapCellPositionFactory().getColumns()) {
            final error : String = new StringMaker().append("RaceTrackMap has incorrect Mini Map columns: ").appendint(Std.int(miniTiledLayer.getColumns())).append(" != ").appendint(Std.int(this.getGeographicMapCellPositionFactory().getColumns())).toString();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR);
            throw new haxe.Exception(error);
        }
        if (miniTiledLayer.getRows() != this.getGeographicMapCellPositionFactory().getRows()) {
            var error : String = "RaceTrackMap has incorrect Mini Map rows";
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR);
            throw new haxe.Exception(error);
        }
    }

    public override function getRaceTrackInfo() : RaceTrackInfo {
        return this.raceTrackInfo;
    }

    public override function setRaceTrackInfo(aRaceTrackInfo : RaceTrackInfo) : Void {
        this.raceTrackInfo = aRaceTrackInfo;
    }

    public function setMiniBasicGeographicMap(miniBasicGeographicMap : BasicGeographicMap) : Void {
        this.miniGeographicMap = miniBasicGeographicMap;
    }

    public function getMiniBasicGeographicMap() : BasicGeographicMap {
        return this.miniGeographicMap;
    }

    public override function getRaceTrackData() : RaceTrackData {
        return this.raceTrackData;
    }

    public override function setRaceTrackData(raceTrackData : RaceTrackData) : Void {
        this.raceTrackData = raceTrackData;
    }

}

