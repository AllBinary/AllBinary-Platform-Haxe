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

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterface;
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
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final touchButtonInput : TouchButtonInput;
    private final animationInterface : Animation;
    public final rawRectangle : Rectangle;
    public final xBorder : Int;
    public final yBorder : Int;
    public var rectangle : Rectangle = RectangleFactory.SINGLETON;
    public final cellPosition : CellPosition;
    public var animationX : Int = 0;
    public var animationY : Int = 0;
    public function new(touchButtonInput : TouchButtonInput, animationInterface : AnimationInterface, rawRectangle : Rectangle, cellPosition : CellPosition, xBorder : Int, yBorder : Int) {
        super();
        this.touchButtonInput = touchButtonInput;
        this.animationInterface = (cast animationInterface : Animation);
        this.rawRectangle = rawRectangle;
        this.cellPosition = cellPosition;
        this.xBorder = xBorder;
        this.yBorder = yBorder;
        this.updateRectangle();
        this.logUtil.putF(Std.string(new StringMaker().append("Created: ").append(Std.string(this))), this, this.commonStrings.CONSTRUCTOR);
    }

    public override function paint(graphics : Graphics) : Void {
        this.animationInterface.paintXY(graphics, animationX, this.animationY);
    }

    public function updateRectangle() : Void {
        try {
            final x : Int = this.rawRectangle.getWidth() * this.cellPosition.getColumn();
            final y : Int = this.rawRectangle.getHeight() * this.cellPosition.getRow();
            final pointFactory : PointFactory = PointFactory.getInstance();
            this.rectangle = new Rectangle(pointFactory.createXY(x + this.xBorder, y + this.yBorder), this.rawRectangle.getWidth(), this.rawRectangle.getHeight());
            final point : GPoint = this.rectangle.getPoint();
            this.animationX = point.getX();
            this.animationY = point.getY();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "updateRectangle", e);
        }
    }

    public function getCellPositionP() : CellPosition {
        return this.cellPosition;
    }

    public function getRectangleP() : Rectangle {
        return this.rectangle;
    }

    public function getTouchButtonInput() : TouchButtonInput {
        return this.touchButtonInput;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final stringUtil : StringUtil = StringUtil.getInstance();
        stringBuffer.append("TouchButton: ");
        stringBuffer.append(stringUtil.toString(this.rectangle));
        stringBuffer.append(" CellPosition: ");
        stringBuffer.append(stringUtil.toString(this.cellPosition));
        stringBuffer.append(" xBorder: ");
        stringBuffer.appendint(this.xBorder);
        stringBuffer.append(" yBorder: ");
        stringBuffer.appendint(this.yBorder);
        return Std.string(stringBuffer);
    }

}

