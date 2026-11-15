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


class BasicLayerPlacement {
    private var layerType : LayerPlacementType;
    private var width : Int;
    private var height : Int;
    public function new(layerType : LayerPlacementType, width : Int, height : Int) {
        this.layerType = layerType;
        this.width = width;
        this.height = height;
    }

    public function getWidth() : Int {
        return this.width;
    }

    public function getHeight() : Int {
        return this.height;
    }

    public function getLayerType() : LayerPlacementType {
        return this.layerType;
    }

    public function setLayerType(layerType : LayerPlacementType) : Void {
        this.layerType = layerType;
    }

}

