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
import org.allbinary.layer.Layer;
import org.allbinary.layer.NullLayer;
import org.allbinary.view.ViewPosition;

class TileLayerPositionIntoViewPosition extends ViewPosition {
    private var tiledLayer : Layer = NullLayer.getInstance();
    public function new() {
        super(0, 0, 0);
    }

    public override function getX() : Int {
        return super.getX() - this.tiledLayer.getXP();
    }

    public override function getY() : Int {
        return super.getY() - this.tiledLayer.getYP();
    }

    public override function getZ() : Int {
        return super.getZ() - this.tiledLayer.getZP();
    }

    public function setTiledLayer(tiledLayer : AllBinaryTiledLayer) : Void {
        this.tiledLayer = tiledLayer;
    }

}

