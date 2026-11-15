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
package org.allbinary.game.ag.layer.pickup.life;

import org.allbinary.game.ag.life.Life;
import org.allbinary.game.ag.life.LifeInterfaceCompositeInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerCircularPool;
import org.allbinary.layer.AllBinaryLayerFactoryInterface;

class LifeLayerCircularStaticPool extends AllBinaryLayerCircularPool {
    public function new(allbinaryLayerFactoryInterface : AllBinaryLayerFactoryInterface, total : Int) {
        super();
        super.initAllBinaryLayerCircularPool(allbinaryLayerFactoryInterface, total);
    }

    // throws Exception
    public function visit(sourceLayerInterface : AllBinaryLayer) : Void {
        final lifeLayer : LifeLayer = (cast this.getNextInstance() : LifeLayer);
        final lifeInterfaceCompositeInterface : LifeInterfaceCompositeInterface = (cast sourceLayerInterface : LifeInterfaceCompositeInterface);
        final lifeInterface : Life = lifeInterfaceCompositeInterface.getLifeInterface();
        lifeLayer.visit(lifeInterface);
    }

}

