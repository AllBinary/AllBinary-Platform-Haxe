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
package org.allbinary.animation.image;

import javax.microedition.lcdui.Image;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.media.ScaleProperties;

class ImageArrayAnimationFactory implements AnimationInterfaceFactoryInterface {
    private var dx : Int = 0;
    private var dy : Int = 0;
    private final imageArray : haxe.ds.Vector<Image>;
    private final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(imageArray : haxe.ds.Vector<Image>, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.imageArray = imageArray;
        this.animationBehaviorFactory = animationBehaviorFactory;
        this.dx = dx;
        this.dy = dy;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        if (this.dx != 0 || this.dy != 0) {
            return new AdjustedImageArrayAnimation(this.imageArray, this.dx, this.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new ImageArrayAnimation(this.imageArray, AnimationBehavior.getInstance());
        }
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

