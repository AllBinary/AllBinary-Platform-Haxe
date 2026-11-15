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
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class TimedVectorAnimation extends VectorAnimation {
    private var timeElapsedHelper : TimeDelayHelper = new TimeDelayHelper(200);
    public function new(currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, basicColor : BasicColor, animationBehavior : AnimationBehavior) {
        super(currentPoints, basicColor, animationBehavior);
    }

    public override function nextFrame() : Void {
        if (this.timeElapsedHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
            super.nextFrame();
        }
    }

}

