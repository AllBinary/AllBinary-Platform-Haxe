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
import org.allbinary.layer.AllBinaryLayer;

class PickedUpLayerInterfaceFactory extends PickedUpLayerInterfaceFactoryBase {
    private final pickedUpLayerType : PickedUpLayerType;
    private final iconLayer : IconLayer;
    private final animationInterface : Animation;
    public function new(pickeUpLayerType : PickedUpLayerType, iconLayer : IconLayer, animationInterface : Animation) {
        super();
        this.pickedUpLayerType = pickeUpLayerType;
        this.animationInterface = animationInterface;
        this.iconLayer = iconLayer;
    }

    public override function getIconLayer() : AllBinaryLayer {
        return this.iconLayer;
    }

    public override function getAnimationInterface() : Animation {
        return this.animationInterface;
    }

    public override function getPickedUpLayerType() : PickedUpLayerType {
        return this.pickedUpLayerType;
    }

}

