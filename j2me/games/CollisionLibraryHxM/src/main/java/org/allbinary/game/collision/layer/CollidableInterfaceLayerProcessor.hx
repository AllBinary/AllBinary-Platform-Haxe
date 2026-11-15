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
package org.allbinary.game.collision.layer;

import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerProcessor;

class CollidableInterfaceLayerProcessor extends LayerProcessor {
    public function new() {
        super(new CollidableInterfaceLayerManager());
    }

    // throws Exception
    public override function processAt(allBinaryLayerManager : AllBinaryLayerManager, layerInterface : AllBinaryLayer, index : Int) : Void {
        var collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface = (cast layerInterface : CollidableInterfaceCompositeInterface);
        if (collidableInterfaceCompositeInterface.getCollidableInferface().isCollidable((cast collidableInterfaceCompositeInterface : CollidableCompositeLayer))) {
            AllBinaryCollisionManager.getInstance().process(this.getLayerManager(), collidableInterfaceCompositeInterface, index);
        }
    }

    public override function isProcessorLayer(layerInterface : AllBinaryLayer) : Bool {
        if (layerInterface.implmentsCollidableInterface()) {
            return true;
        } else {
            return false;
        }
    }

}

