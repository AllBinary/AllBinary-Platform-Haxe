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
package org.allbinary.animation.vector;

import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.media.ScaleProperties;

class LineAnimationFactory implements AnimationInterfaceFactoryInterface {
    private var basicColor : BasicColor;
    public function new(basicColor : BasicColor) {
        this.basicColor = basicColor;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        return new LineAnimation(this.basicColor);
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

