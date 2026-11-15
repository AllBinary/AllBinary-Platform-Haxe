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
package org.allbinary.media.image.comparison.motion;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.CacheableInterface;

class MotionRectanglesResultsFrameCacheable implements CacheableInterface {
    private var motionRectangles : MotionRectangles = null;
    private var frame : Null<haxe.Int64>;
    public function new(motionRectangles : MotionRectangles, frame : Null<haxe.Int64>) {
        this.frame = frame;
        this.setMotionRectangles(motionRectangles);
    }

    public function getKey() : Any {
        return this.frame;
    }

    public function getMotionRectangles() : MotionRectangles {
        return this.motionRectangles;
    }

    public function setMotionRectangles(motionRectangles : MotionRectangles) : Void {
        this.motionRectangles = motionRectangles;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Type.getClassName(Type.getClass(this)));
        stringBuffer.append(" Frame: ");
        stringBuffer.append(this.getKey().toString());
        return stringBuffer.toString();
    }

}

