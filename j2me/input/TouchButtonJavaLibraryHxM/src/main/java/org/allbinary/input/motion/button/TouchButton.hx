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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.graphics.CellPosition;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class TouchButton extends Paintable {
    // throws Exception
    public static function createButton(touchButtonInput : TouchButtonInput, touchButtonResource : TouchButtonResource, rawRectangle : Rectangle, cellPosition : CellPosition, xBorder : Int, yBorder : Int) : TouchButton {
        return new TouchButton(touchButtonInput, FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(touchButtonResource.RESOURCE).getInstance(0), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(touchButtonResource.HINT).getInstance(0), rawRectangle, cellPosition, xBorder, yBorder);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final touchButtonInput : TouchButtonInput;
    private final animationInterface : Animation;
    private final hintAnimationInterface : Animation;
    public final rawRectangle : Rectangle;
    public final xBorder : Int;
    public final yBorder : Int;
    public var rectangleP : Rectangle = RectangleFactory.SINGLETON;
    public final cellPositionP : CellPosition;
    public var animationX : Int = 0;
    public var animationY : Int = 0;
    public var hintAnimationY : Int = 0;
    public function new(touchButtonInput : TouchButtonInput, animationInterface : Animation, hintAnimationInterface : Animation, rawRectangle : Rectangle, cellPosition : CellPosition, xBorder : Int, yBorder : Int) {
        super();
        this.touchButtonInput = touchButtonInput;
        this.animationInterface = animationInterface;
        this.hintAnimationInterface = hintAnimationInterface;
        this.rawRectangle = rawRectangle;
        this.cellPositionP = cellPosition;
        this.xBorder = xBorder;
        this.yBorder = yBorder;
        this.updateRectangle();
        this.logUtil.putF(new StringMaker().append("Created: ").append(this.toString()).toString(), this, this.commonStrings.CONSTRUCTOR);
    }

    public function paintHint(graphics : Graphics) : Void {
        this.hintAnimationInterface.paintXY(graphics, this.animationX, this.hintAnimationY);
    }

    public override function paint(graphics : Graphics) : Void {
        this.animationInterface.paintXY(graphics, this.animationX, this.animationY);
    }

    public function updateRectangle() : Void {
        try {
            final pointFactory : PointFactory = PointFactory.getInstance();
            final x : Int = this.rawRectangle.getWidth() * this.cellPositionP.getColumn();
            final y : Int = this.rawRectangle.getHeight() * this.cellPositionP.getRow();
            this.rectangleP = new Rectangle(pointFactory.createXY(x + this.xBorder, y + this.yBorder), this.rawRectangle.getWidth(), this.rawRectangle.getHeight());
            final point : GPoint = this.rectangleP.getPoint();
            this.animationX = point.getX();
            this.animationY = point.getY();
            this.hintAnimationY = this.animationY - 32;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "updateRectangle", e);
        }
    }

    public function getCellPosition() : CellPosition {
        return this.cellPositionP;
    }

    public function getRectangle() : Rectangle {
        return this.rectangleP;
    }

    public function getTouchButtonInput() : TouchButtonInput {
        return this.touchButtonInput;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final stringUtil : StringUtil = StringUtil.getInstance();
        stringBuffer.append("TouchButton: ");
        stringBuffer.append(stringUtil.toString(this.getRectangle()));
        stringBuffer.append(" CellPosition: ");
        stringBuffer.append(stringUtil.toString(this.cellPositionP));
        stringBuffer.append(" xBorder: ");
        stringBuffer.appendint(this.xBorder);
        stringBuffer.append(" yBorder: ");
        stringBuffer.appendint(this.yBorder);
        return stringBuffer.toString();
    }

}

