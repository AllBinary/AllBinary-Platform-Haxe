/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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


class IndexedAnimationBehaviorFactory extends AnimationBehaviorFactory {
    public var frameDelayTime : haxe.Int64;
    public var loopTotal : Int;
    public function new(loopTotal : Int, frameDelayTime : haxe.Int64) {
        super();
        this.loopTotal = loopTotal;
        this.frameDelayTime = frameDelayTime;
    }

    public override function getOrCreateInstance() : AnimationBehavior {
        return new IndexedAnimationBehavior(this.loopTotal, this.frameDelayTime);
    }

}

