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
package org.allbinary.game.input;

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;

class RTSGameLayerPositionFinder implements LayerPositionFinderInterface {
    private static final instance : RTSGameLayerPositionFinder = new RTSGameLayerPositionFinder();
    public static function getInstance() : RTSGameLayerPositionFinder {
        return RTSGameLayerPositionFinder.instance;
    }

    public function new() {
    }

    public function getLayerInterface(geographicMapCellPosition : GeographicMapCellPosition) : AllBinaryLayer {
        return DropCellPositionHistory.getInstance().getLayerInterface(geographicMapCellPosition);
    }

}

