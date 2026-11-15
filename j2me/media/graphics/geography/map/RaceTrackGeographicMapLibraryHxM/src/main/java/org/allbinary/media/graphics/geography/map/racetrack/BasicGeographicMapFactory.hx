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

import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;

class BasicGeographicMapFactory {
    // throws Exception
    public function getInstance(raceTrackInfo : RaceTrackInfo, raceTrackData : RaceTrackData, tiledLayerFactoryInterface : AllBinaryTiledLayerFactoryInterface, geographicMapCellPositionFactoryInterface : GeographicMapCellPositionFactoryInterface, geographicMapCellTypeFactory : GeographicMapCellTypeFactory) : BasicGeographicMap {
        return new BasicGeographicMap(SmallIntegerSingletonFactory.getInstance().getAt(Std.int(raceTrackInfo.getId()) + 100 + 1), raceTrackInfo.getName(), raceTrackData.getCellTypeIdToGeographicMapCellTypeArray(), tiledLayerFactoryInterface.getMiniInstance(raceTrackData), BasicColorFactory.getInstance().CLEAR_COLOR, BasicColorFactory.getInstance().CLEAR_COLOR, geographicMapCellPositionFactoryInterface, new GeographicMapCellPositionBaseFactory(), geographicMapCellTypeFactory);
    }

    public function new() {
    }
}

