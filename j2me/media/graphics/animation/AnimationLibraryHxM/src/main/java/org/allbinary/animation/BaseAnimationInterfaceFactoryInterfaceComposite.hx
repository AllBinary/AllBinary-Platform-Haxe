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
package org.allbinary.animation;

import org.allbinary.media.ScaleProperties;

class BaseAnimationInterfaceFactoryInterfaceComposite implements AnimationInterfaceFactoryInterface {
    private var basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<BasicAnimationInterfaceFactoryInterface>;
    public function new(basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<BasicAnimationInterfaceFactoryInterface>) {
        this.basicAnimationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        return NullAnimationFactory.getFactoryInstance().getInstance(0);
    }

    public function getBasicAnimationInterfaceFactoryInterfaceArray() : haxe.ds.Vector<BasicAnimationInterfaceFactoryInterface> {
        return this.basicAnimationInterfaceFactoryInterfaceArray;
    }

    public function setBasicAnimationInterfaceFactoryInterfaceArray(basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<BasicAnimationInterfaceFactoryInterface>) : Void {
        this.basicAnimationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

