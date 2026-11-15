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

class VectorAnimationFactory implements VectorAnimationFactoryInterface {
    public function getInstance(points : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, basicColor : BasicColor) : VectorAnimation {
        return new VectorAnimation(points, basicColor, AnimationBehavior.getInstance());
    }

    public function new() {
    }
}

