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
package org.allbinary.media.image.comparison.pixel;

import org.allbinary.graphics.GPoint;
import org.allbinary.TsUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.CacheableInterface;
import org.allbinary.media.image.comparison.color.ColorDelta;
import org.allbinary.string.CommonSeps;

class PixelDelta implements CacheableInterface {
    private var point : GPoint = null;
    private var colorDelta : ColorDelta = null;
    private var key : Any;
    public function new(point : GPoint, colorDelta : ColorDelta) {
        this.setPoint(point);
        this.setColorDelta(colorDelta);
        this.key = PixelDelta.getKey(this.getPoint(), this.getColorDelta());
    }

    public function getKey() : Any {
        return this.key;
    }

    public static function getKey(point : GPoint, colorDelta : ColorDelta) : Any {
        return new StringMaker().appendint(Std.int(TsUtil.getInstance().hashCode(point))).append(CommonSeps.getInstance().UNDERSCORE).append(colorDelta.getKey().toString()).toString();
    }

    public function getPoint() : GPoint {
        return this.point;
    }

    public function setPoint(point : GPoint) : Void {
        this.point = point;
    }

    public function getColorDelta() : ColorDelta {
        return this.colorDelta;
    }

    public function setColorDelta(colorDelta : ColorDelta) : Void {
        this.colorDelta = colorDelta;
    }

    public function toString() : String {
        return new StringMaker().append("PixelDelta: Point: ").append(this.point.toString()).append(CommonSeps.getInstance().SPACE).append(this.colorDelta.toString()).toString();
    }

}

