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
package org.allbinary.game.layer.pickup;

import org.allbinary.layer.AllBinaryLayerCircularPool;

class PickupLayerCircularStaticPool extends AllBinaryLayerCircularPool {
    private static var SINGLETON : PickupLayerCircularStaticPool = new PickupLayerCircularStaticPool();
    public function new() {
        super();
    }

    public static function getInstance() : PickupLayerCircularStaticPool {
        return PickupLayerCircularStaticPool.SINGLETON;
    }

    // throws Exception
    public function getInstanceXYZ(pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface, x : Int, y : Int, z : Int) : PickedUpLayerInterface {
        final pickupLayer : PickupLayer = (cast this.getNextInstance() : PickupLayer);
        pickupLayer.initXYZ(x, y, z);
        pickupLayer.init(pickedUpLayerInterfaceFactoryInterface, pickedUpLayerInterfaceFactoryInterface.getAnimationInterface());
        return pickupLayer;
    }

}

