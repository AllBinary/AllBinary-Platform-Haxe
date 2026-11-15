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

import javax.microedition.lcdui.Graphics;
import org.allbinary.AndroidUtil;
import org.allbinary.graphics.color.BasicColor;

class AdjustedCircleAnimation extends CircleAnimation {
    public static function createAnimation(width : Int, height : Int, xAdjustment : Int, yAdjustment : Int, basicColor : BasicColor) : AdjustedCircleAnimation {
        final adjustedCircleAnimation : AdjustedCircleAnimation = new AdjustedCircleAnimation(width, height, basicColor);
        adjustedCircleAnimation.initXY(xAdjustment, yAdjustment);
        return adjustedCircleAnimation;
    }

    public static function createW(width : Int, height : Int, innerWidth : Int, basicColor : BasicColor) : AdjustedCircleAnimation {
        final adjustedCircleAnimation : AdjustedCircleAnimation = new AdjustedCircleAnimation(width, height, basicColor);
        adjustedCircleAnimation.init(innerWidth);
        return adjustedCircleAnimation;
    }

    private var xAdjustment : Int = 0;
    private var yAdjustment : Int = 0;
    public function new(width : Int, height : Int, basicColor : BasicColor) {
        super(width, height, basicColor);
    }

    private function initXY(xAdjustment : Int, yAdjustment : Int) : Void {
        this.xAdjustment = xAdjustment;
        this.yAdjustment = yAdjustment;
    }

    private function init(innerWidth : Int) : Void {
        if (AndroidUtil.isAndroid()) {
            var widthPortion : Int = (Std.int(((Std.int(innerWidth / 3)) * 10) / 7));
            this.xAdjustment = -((this.width >> 1) - widthPortion);
            this.yAdjustment = this.xAdjustment;
        } else {
            this.xAdjustment = -((this.width >> 1) - innerWidth);
            this.yAdjustment = this.xAdjustment;
        }
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
        graphics.drawArc(x + this.xAdjustment, y + this.yAdjustment, this.width, this.height, 0, this.TOTAL_ANGLE);
    }

}

