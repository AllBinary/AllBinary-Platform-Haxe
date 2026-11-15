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
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerManager;
import org.allbinary.layer.LayerProcessor;

class OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer extends LayerProcessor {
    public function new() {
        super(new OptimizedAllBinaryCollisionLayerManager());
    }

    // throws Exception
    public override function processAt(allBinaryLayerManager : AllBinaryLayerManager, layerInterface : AllBinaryLayer, startIndex : Int) : Void {
        var collidableInterfaceCompositeInterface : CollidableCompositeLayer = (cast layerInterface : CollidableCompositeLayer);
        var collidableBase : CollidableBaseBehavior = collidableInterfaceCompositeInterface.getCollidableInferface();
        if (collidableBase.isCollidable(collidableInterfaceCompositeInterface)) {
            final layerManager : LayerManager = this.getLayerManager();
            final size : Int = layerManager.getSize();
            var collidableInterfaceCompositeInterface2 : CollidableCompositeLayer = null;
            var collidableBase2 : CollidableBaseBehavior = null;
            for (index in startIndex + 1...size) {
                collidableInterfaceCompositeInterface2 = (cast layerManager.getLayerAt(index) : CollidableCompositeLayer);
                collidableBase2 = collidableInterfaceCompositeInterface2.getCollidableInferface();
                if (collidableBase2.isCollidable(collidableInterfaceCompositeInterface) && collidableBase.isCollision(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)) {
                    collidableBase.collide(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2);
                    collidableBase2.collide(collidableInterfaceCompositeInterface2, collidableInterfaceCompositeInterface);
                }
            }
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

