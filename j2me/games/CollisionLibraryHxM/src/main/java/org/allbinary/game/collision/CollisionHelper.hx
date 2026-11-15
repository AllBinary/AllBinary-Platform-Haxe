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
package org.allbinary.game.collision;

import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.layer.AllBinaryLayer;

class CollisionHelper {
    public var sourceLayerInterface : AllBinaryLayer;
    public function new(sourceLayerInterface : AllBinaryLayer) {
        this.sourceLayerInterface = sourceLayerInterface;
    }

    public function isCollidable(layerInterface : CollidableCompositeLayer) : Bool {
        return true;
    }

    public function getOwnerLayerInterface() : AllBinaryLayer {
        return this.sourceLayerInterface;
    }

    public function setOwnerLayerInterface(sourceLayerInterface : AllBinaryLayer) : Void {
        this.sourceLayerInterface = sourceLayerInterface;
    }

}

