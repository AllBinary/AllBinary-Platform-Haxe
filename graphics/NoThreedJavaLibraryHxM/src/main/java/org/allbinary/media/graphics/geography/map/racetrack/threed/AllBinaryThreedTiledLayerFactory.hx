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
package org.allbinary.media.graphics.geography.map.racetrack.threed;

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo;

class AllBinaryThreedTiledLayerFactory {
    private static final instance : AllBinaryThreedTiledLayerFactory = new AllBinaryThreedTiledLayerFactory();
    public static function getInstance() : AllBinaryThreedTiledLayerFactory {
        return AllBinaryThreedTiledLayerFactory.instance;
    }

    // throws Exception
    public function getInstance(raceTrackInfo : RaceTrackInfo, raceTrackData : RaceTrackData) : AllBinaryTiledLayer {
        throw new haxe.Exception("No Threed");
    }

    public function new() {
    }
}

