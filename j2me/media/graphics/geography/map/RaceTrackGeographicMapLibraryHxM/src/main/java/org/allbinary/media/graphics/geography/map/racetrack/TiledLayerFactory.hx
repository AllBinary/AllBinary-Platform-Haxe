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

//import javax.microedition.lcdui.game.TiledLayer;

class TiledLayerFactory {
    public function getInstance(raceTrackData : RaceTrackData) : TiledLayer {
        final mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = raceTrackData.getMapArray();
        return new TiledLayer(mapArray[0].length, mapArray.length, raceTrackData.getTileSetImage(), raceTrackData.getCellWidth(), raceTrackData.getCellHeight());
    }

    public function getMiniInstance(raceTrackData : RaceTrackData) : TiledLayer {
        final mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = raceTrackData.getMapArray();
        return new TiledLayer(mapArray[0].length, mapArray.length, raceTrackData.getMiniTileSetImage(), raceTrackData.getMiniCellWidth(), raceTrackData.getMiniCellHeight());
    }

    public function new() {
    }
}

