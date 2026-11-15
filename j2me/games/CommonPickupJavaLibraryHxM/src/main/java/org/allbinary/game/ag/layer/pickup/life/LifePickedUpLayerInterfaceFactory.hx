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

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory;
import org.allbinary.game.layer.pickup.IconLayerFactory;
import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactory;
import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface;
import org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory;
import org.allbinary.game.layer.pickup.PickupProcessorInterface;
import org.allbinary.layer.AllBinaryLayer;

class LifePickedUpLayerInterfaceFactory extends PickedUpLayerInterfaceFactory implements PickupProcessorInterface {
    private static var pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY;
    // throws Exception
    public static function init() : Void {
        LifePickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = new LifePickedUpLayerInterfaceFactory();
    }

    private var pool : LifeLayerCircularStaticPool = new LifeLayerCircularStaticPool(new LifeLayerFactory(), 1);
    public function new() {
        super(PickedUpLayerTypeFactory.getInstance().LIFE, IconLayerFactory.getInstance(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(LifeResources.getInstance().RESOURCE).getInstance(0), 10, 10), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(LifeResources.getInstance().RESOURCE).getInstance(0));
    }

    public function getTotal() : Int {
        return 1;
    }

    public static function getInstance() : PickedUpLayerInterfaceFactoryInterface {
        return LifePickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface;
    }

    // throws Exception
    public override function process(sourceLayerInterface : AllBinaryLayer) : Void {
        this.pool.visit(sourceLayerInterface);
    }

}

