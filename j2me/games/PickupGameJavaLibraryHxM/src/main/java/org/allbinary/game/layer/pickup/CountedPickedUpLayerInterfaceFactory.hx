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

import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

class CountedPickedUpLayerInterfaceFactory extends PickedUpLayerInterfaceFactory implements CountedPickedUpLayerInterfaceFactoryInterface {
    public static final NULL_COUNTED_PICKUP_LAYER_FACTORY : CountedPickedUpLayerInterfaceFactory = new CountedPickedUpLayerInterfaceFactory(PickedUpLayerTypeFactory.getInstance().NONE, IconLayer.NULL_ICON_LAYER, NullAnimationFactory.getFactoryInstance().getInstance(0));
    private final id : Int;
    public function new(pickeUpLayerType : PickedUpLayerType, iconLayer : IconLayer, animationInterface : Animation) {
        super(pickeUpLayerType, iconLayer, animationInterface);
        var list : BasicArrayList = CountedPickedUpLayerInterfaceFactoryPool.getInstance().getList();
        this.id = list.size();
        list.add(this);
    }

    // throws Exception
    public override function getNextInstance(hashtable : ABHashtable<Any, Any>, x : Int, y : Int, z : Int) : AllBinaryLayer {
        throw new haxe.Exception(CommonStrings.getInstance().NOT_IMPLEMENTED);
    }

    public override function getTotal() : Int {
        return -1;
    }

    public override function getId() : Int {
        return this.id;
    }

}

