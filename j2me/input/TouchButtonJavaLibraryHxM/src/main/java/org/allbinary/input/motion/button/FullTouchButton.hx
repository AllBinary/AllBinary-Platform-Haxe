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
package org.allbinary.input.motion.button;

import org.allbinary.animation.Animation;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.graphics.CellPosition;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;

class FullTouchButton extends TouchButton {
    // throws Exception
    public static function createButton(touchButtonInput : TouchButtonInput, touchButtonResource : TouchButtonResource, rawRectangle : Rectangle, cellPosition : CellPosition, xBorder : Int, yBorder : Int) : FullTouchButton {
        return new FullTouchButton(touchButtonInput, FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(touchButtonResource.RESOURCE).getInstanceFor(0), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(touchButtonResource.HINT).getInstanceFor(0), rawRectangle, cellPosition, xBorder, yBorder);
    }

    public function new(touchButtonInput : TouchButtonInput, animationInterface : Animation, hintAnimationInterface : Animation, rawRectangle : Rectangle, cellPosition : CellPosition, xBorder : Int, yBorder : Int) {
        super(touchButtonInput, animationInterface, hintAnimationInterface, rawRectangle, cellPosition, xBorder, yBorder);
    }

    public override function updateRectangle() : Void {
        try {
            final pointFactory : PointFactory = PointFactory.getInstance();
            final x : Int = this.rawRectangle.getWidth() * this.cellPositionP.getColumn();
            final y : Int = this.rawRectangle.getHeight() * this.cellPositionP.getRow();
            this.rectangleP = new Rectangle(pointFactory.createXY(x, y), this.rawRectangle.getWidth() + (2 * this.xBorder), this.rawRectangle.getHeight() + (2 * this.yBorder));
            final point : GPoint = this.rectangleP.getPoint();
            this.animationX = point.getX() + this.xBorder;
            this.animationY = point.getY() + this.yBorder;
            this.hintAnimationY = this.animationY - this.rectangleP.getHeight() >> 1;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "updateRectangle", e);
        }
    }

}

