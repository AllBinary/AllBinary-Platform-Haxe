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

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.NullUtil;
import org.allbinary.vector.VectorInfo;

class IndependentVectorExplosionRotationAnimationFactory implements ProceduralAnimationInterfaceFactoryInterface {
    private var framePoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY;
    private var vectorInfo : VectorInfo;
    private var basicColor : BasicColor;
    private var vectorAnimationFactoryInterface : VectorAnimationFactoryInterface;
    public function new(vectorInfo : VectorInfo, basicColor : BasicColor, vectorAnimationFactoryInterface : VectorAnimationFactoryInterface) {
        this.vectorInfo = vectorInfo;
        this.basicColor = basicColor;
        this.vectorAnimationFactoryInterface = vectorAnimationFactoryInterface;
        this.init();
    }

    // throws Exception
    public function init() : Void {
        this.framePoints = VectorRotationGenerator.getInstance().getInstance(this.vectorInfo);
    }

    private final vectorExplosionGenerator : VectorExplosionGenerator = VectorExplosionGenerator.getInstance();
    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        var frame : Int = 0;
        if (animationInterface != null) {
            var rotationAnimationInterface : IndexedAnimation = (cast animationInterface : IndexedAnimation);
            frame = rotationAnimationInterface.getFrame();
        }
        var points : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = this.vectorExplosionGenerator.getInstance(this.framePoints[frame], 6, this.vectorExplosionGenerator.ROTATION);
        return this.vectorAnimationFactoryInterface.getInstance(points, this.basicColor);
    }

}

