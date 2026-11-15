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
package org.allbinary.game.layer;

//import javax.microedition.lcdui.game.TiledLayer;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo;
import org.allbinary.media.graphics.geography.map.racetrack.TiledLayerFactory;

class AllBinaryTiledLayerFactory implements AllBinaryTiledLayerFactoryInterface {
    // throws Exception
    public function getInstance(raceTrackInfo : RaceTrackInfo, raceTrackData : RaceTrackData) : AllBinaryTiledLayer {
        var allbinaryTiledLayer : AllBinaryTiledLayer = null;
        final tiledLayer : TiledLayer = new TiledLayerFactory().getInstance(raceTrackData);
        allbinaryTiledLayer = new AllBinaryJ2METiledLayer(raceTrackData.getId(), tiledLayer, raceTrackData.getMapArray(), Std.int(BasicColorFactory.getInstance().RED));
        allbinaryTiledLayer.setCells(raceTrackData.getMapArray());
        return allbinaryTiledLayer;
    }

    // throws Exception
    public function getMiniInstance(raceTrackData : RaceTrackData) : AllBinaryTiledLayer {
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final tiledLayer : TiledLayer = new TiledLayerFactory().getMiniInstance(raceTrackData);
        final allbinaryTiledLayer : AllBinaryTiledLayer = new AllBinaryJ2METiledLayer(smallIntegerSingletonFactory.getAt(Std.int(raceTrackData.getId()) + 100 + 1), tiledLayer, raceTrackData.getMapArray(), Std.int(BasicColorFactory.getInstance().RED));
        allbinaryTiledLayer.setCells(raceTrackData.getMapArray());
        return allbinaryTiledLayer;
    }

    public function new() {
    }
}

