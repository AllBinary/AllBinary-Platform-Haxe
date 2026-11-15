/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.view;

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.Layer;
import org.allbinary.layer.NullLayer;
import org.allbinary.view.ViewPosition;

class StaticTileLayerIntoPositionViewPosition extends ViewPosition {
    private static var tiledLayer : Layer = NullLayer.getInstance();
    public static var layer : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    public function new() {
        super(0, 0, 0);
    }

    public override function getX() : Int {
        return super.getX() - StaticTileLayerIntoPositionViewPosition.tiledLayer.getXP();
    }

    public override function getY() : Int {
        return super.getY() - StaticTileLayerIntoPositionViewPosition.tiledLayer.getYP();
    }

    public override function getZ() : Int {
        return super.getZ() - StaticTileLayerIntoPositionViewPosition.tiledLayer.getZP();
    }

    public static function setTiledLayer(tiledLayer : AllBinaryTiledLayer) : Void {
        StaticTileLayerIntoPositionViewPosition.tiledLayer = tiledLayer;
    }

}

