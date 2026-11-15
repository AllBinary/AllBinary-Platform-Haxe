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
package org.allbinary.game.ag.layer.pickup.health;

import org.allbinary.game.health.HealthInterface;
import org.allbinary.game.health.HealthInterfaceCompositeInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerCircularPool;
import org.allbinary.layer.AllBinaryLayerFactoryInterface;

class HealLayerCircularStaticPool extends AllBinaryLayerCircularPool {
    public function new(allbinaryLayerFactoryInterface : AllBinaryLayerFactoryInterface, total : Int) {
        super();
        super.initAllBinaryLayerCircularPool(allbinaryLayerFactoryInterface, total);
    }

    // throws Exception
    public function visit(sourceLayerInterface : AllBinaryLayer) : Void {
        final healLayer : HealLayer = (cast this.getNextInstance() : HealLayer);
        final healthInterfaceCompositeInterface : HealthInterfaceCompositeInterface = (cast sourceLayerInterface : HealthInterfaceCompositeInterface);
        final healthInterface : HealthInterface = healthInterfaceCompositeInterface.getHealthInterface();
        healLayer.visit(healthInterface);
    }

}

