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

import org.allbinary.game.collision.CollidableBaseBehavior;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.layer.LayerManager;

class AllBinaryCollisionManager {
    private static var allBinaryCollisionManager : AllBinaryCollisionManager = new AllBinaryCollisionManager();
    public function new() {
    }

    public static function getInstance() : AllBinaryCollisionManager {
        return AllBinaryCollisionManager.allBinaryCollisionManager;
    }

    // throws Exception
    public function process(layerManager : LayerManager, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface, startIndex : Int) : Void {
        var size : Int = layerManager.getSize();
        for (index in startIndex + 1...size) {
            var collidableInterfaceCompositeInterface2 : CollidableInterfaceCompositeInterface = (cast layerManager.getLayerAt(index) : CollidableInterfaceCompositeInterface);
            this.collide(layerManager, collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2);
        }
    }

    // throws Exception
    private function collide(layerManager : LayerManager, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2 : CollidableInterfaceCompositeInterface) : Void {
        var collidableBase2 : CollidableBaseBehavior = collidableInterfaceCompositeInterface2.getCollidableInferface();
        var collidableBase : CollidableBaseBehavior = collidableInterfaceCompositeInterface.getCollidableInferface();
        if (collidableBase2.isCollidable((cast collidableInterfaceCompositeInterface : CollidableCompositeLayer))) {
            if (collidableBase.isCollisionInterface((cast collidableInterfaceCompositeInterface : CollidableCompositeLayer), collidableInterfaceCompositeInterface2)) {
                collidableBase.collideInterface((cast collidableInterfaceCompositeInterface : CollidableCompositeLayer), collidableInterfaceCompositeInterface2);
                collidableBase2.collideInterface((cast collidableInterfaceCompositeInterface : CollidableCompositeLayer), collidableInterfaceCompositeInterface);
            }
        }
    }

}

