/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.input.form;

import org.allbinary.game.input.LayerPositionFinderInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;

class NullRTSGameLayerPositionFinder implements LayerPositionFinderInterface {
    private static final instance : NullRTSGameLayerPositionFinder = new NullRTSGameLayerPositionFinder();
    public static function getInstance() : NullRTSGameLayerPositionFinder {
        return NullRTSGameLayerPositionFinder.instance;
    }

    public function new() {
    }

    public function getLayerInterface(geographicMapCellPosition : GeographicMapCellPosition) : AllBinaryLayer {
        var layerInterface : AllBinaryLayer = DropCellPositionHistory.getInstance().getLayerInterface(geographicMapCellPosition);
        return layerInterface;
    }

}

