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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;

class RaceTrackGeographicMap extends BaseRaceTrackGeographicMap {
    private final customMapGenerator : CustomMapGeneratorBase;
    public function new(raceTrackInfo : RaceTrackInfo, raceTrackData : RaceTrackData, tiledLayerFactoryInterface : AllBinaryTiledLayerFactoryInterface, geographicMapCellPositionFactoryInterface : GeographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory : GeographicMapCellPositionBaseFactory, geographicMapCellTypeFactory : GeographicMapCellTypeFactory, customMapGeneratorBaseFactory : CustomMapGeneratorBaseFactory) {
        super(raceTrackInfo, raceTrackData, tiledLayerFactoryInterface.getInstance(raceTrackInfo, raceTrackData), new BasicGeographicMapFactory().getInstance(raceTrackInfo, raceTrackData, tiledLayerFactoryInterface, geographicMapCellPositionFactoryInterface, geographicMapCellTypeFactory), geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory);
        this.customMapGenerator = customMapGeneratorBaseFactory.create(this);
    }

    public function getCustomMapGenerator() : CustomMapGeneratorBase {
        return this.customMapGenerator;
    }

    // throws Exception
    public function isValid(geographicMapCellPosition : GeographicMapCellPosition) : Bool {
        final customMapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = this.customMapGenerator.getCustomMapArray();
        if (geographicMapCellPosition.getColumn() >= customMapArray[0].length) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Column: ");
            stringBuffer.appendint(Std.int(geographicMapCellPosition.getColumn()));
            stringBuffer.append(" not in: ");
            stringBuffer.appendint(customMapArray[0].length);
            this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.IS_VALID);
            if (geographicMapCellPosition.getColumn() == customMapArray[0].length) {
                return true;
            } else {
                return false;
            }
        } else if (geographicMapCellPosition.getRow() > customMapArray.length) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Row: ");
            stringBuffer.appendint(Std.int(geographicMapCellPosition.getRow()));
            stringBuffer.append(" not in: ");
            stringBuffer.appendint(customMapArray.length);
            this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.IS_VALID);
            if (geographicMapCellPosition.getRow() == customMapArray.length) {
                return true;
            } else {
                return false;
            }
        }
        return true;
    }

}

