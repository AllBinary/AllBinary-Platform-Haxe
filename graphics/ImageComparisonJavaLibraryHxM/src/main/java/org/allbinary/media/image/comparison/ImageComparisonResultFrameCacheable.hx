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
package org.allbinary.media.image.comparison;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.CacheableInterface;

class ImageComparisonResultFrameCacheable implements CacheableInterface {
    private var frame : Null<haxe.Int64>;
    private var imageComparisonResult : ImageComparisonResult = null;
    public function new(imageComparisonResult : ImageComparisonResult, frame : Null<haxe.Int64>) {
        this.setImageComparisonResult(imageComparisonResult);
        this.frame = frame;
    }

    public function getKey() : Any {
        return this.frame;
    }

    public function getFrame() : Null<haxe.Int64> {
        return this.frame;
    }

    public function setFrame(frame : Null<haxe.Int64>) : Void {
        this.frame = frame;
    }

    public function getImageComparisonResult() : ImageComparisonResult {
        return this.imageComparisonResult;
    }

    public function setImageComparisonResult(imageComparisonResult : ImageComparisonResult) : Void {
        this.imageComparisonResult = imageComparisonResult;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Type.getClassName(Type.getClass(this)));
        stringBuffer.append(" Frame: ");
        stringBuffer.appendlong(this.getFrame());
        return stringBuffer.toString();
    }

}

