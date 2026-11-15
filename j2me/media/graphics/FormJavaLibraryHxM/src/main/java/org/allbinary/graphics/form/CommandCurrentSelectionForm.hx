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
package org.allbinary.graphics.form;

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.J2MEUtil;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.vector.RectangleAdjustedAnimation;
import org.allbinary.animation.vector.RectangleFilledAdjustedAnimation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.form.item.CommandTextItem;
import org.allbinary.graphics.form.item.ABCustomItem;

class CommandCurrentSelectionForm extends ScrollCurrentSelectionForm implements UpdateMyFontInterface {
    public final selectedAnimationArray : haxe.ds.Vector<Animation> = haxe.ds.Vector.fromArrayCopy([for (index in 0...16) null]);
    public final unSelectedAnimationArray : haxe.ds.Vector<Animation> = haxe.ds.Vector.fromArrayCopy([for (index in 0...16) null]);
    public function new(title : String, items : haxe.ds.Vector<ABCustomItem>, border : Int, moveForSmallScreen : Bool, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, items, ItemPaintableFactory.getInstance(), border, -3, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor);
        this.initAnimations();
        this.addAll(items);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        this.updateAll(graphics, this.getAllitems());
        super.updateMeasurement(graphics);
    }

    private function initAnimations() : Void {
        final nullAnimation : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        {
            var index : Int = this.selectedAnimationArray.length;
            while (--index >= 0) {
            this.selectedAnimationArray[index] = nullAnimation;
            }
        }
        {
            var index : Int = this.unSelectedAnimationArray.length;
            while (--index >= 0) {
            this.unSelectedAnimationArray[index] = nullAnimation;
            }
        }
    }

    private function addAll(items : haxe.ds.Vector<ABCustomItem>) : Void {
        {
            var index : Int = items.length;
            while (--index >= 0) {
            this.addAt(index, items[index]);
            }
        }
    }

    private function addAt(index : Int, item : ABCustomItem) : Void {
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        final buttonColor : BasicColor = basicColorFactory.TRANSPARENT_GREY;
        final selectedButtonColor : BasicColor = basicColorFactory.TRANSPARENT_RED;
        var width : Int = item.getMinimumWidth();
        var height : Int = item.getMinimumHeight();
        var adjustedBorder : Int = 3;
        final offset : Int = -(this.halfBorder + adjustedBorder);
        final rectWidth : Int = width + this.border - adjustedBorder;
        final rectHeight : Int = height + this.border - adjustedBorder;
        if (J2MEUtil.isJ2ME() || J2MEUtil.isHTML()) {
            this.selectedAnimationArray[index] = new RectangleAdjustedAnimation(rectWidth, rectHeight, offset, offset, selectedButtonColor);
        } else {
            this.selectedAnimationArray[index] = new RectangleFilledAdjustedAnimation(rectWidth, rectHeight, offset, offset, selectedButtonColor);
        }
        adjustedBorder = 4;
        if (J2MEUtil.isJ2ME() || J2MEUtil.isHTML()) {
            this.unSelectedAnimationArray[index] = new RectangleAdjustedAnimation(rectWidth, rectHeight, offset, offset, buttonColor);
        } else {
            this.unSelectedAnimationArray[index] = new RectangleFilledAdjustedAnimation(rectWidth, rectHeight, offset, offset, buttonColor);
        }
    }

    private function updateAll(graphics : Graphics, items : haxe.ds.Vector<ABCustomItem>) : Void {
        {
            var index : Int = items.length;
            while (--index >= 0) {
            items[index].preMeasurement(graphics);
            this.updateAt(index, items[index]);
            }
        }
    }

    private function updateAt(index : Int, item : ABCustomItem) : Void {
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        final buttonColor : BasicColor = basicColorFactory.TRANSPARENT_GREY;
        final selectedButtonColor : BasicColor = basicColorFactory.TRANSPARENT_RED;
        final width : Int = item.getMinimumWidth();
        final height : Int = item.getMinimumHeight();
        var adjustedBorder : Int = 3;
        final offset : Int = -(this.halfBorder + adjustedBorder);
        final rectWidth : Int = width + this.border - adjustedBorder;
        final rectHeight : Int = height + this.border - adjustedBorder;
        if (J2MEUtil.isJ2ME() || J2MEUtil.isHTML()) {
            final rectangleAdjustedAnimation : RectangleAdjustedAnimation = (cast this.selectedAnimationArray[index] : RectangleAdjustedAnimation);
            rectangleAdjustedAnimation.setWidth(rectWidth);
            rectangleAdjustedAnimation.setHeight(rectHeight);
            rectangleAdjustedAnimation.setOffsetX(offset);
            rectangleAdjustedAnimation.setOffsetY(offset);
            rectangleAdjustedAnimation.setBasicColorP(selectedButtonColor);
        } else {
            final rectangleAdjustedAnimation : RectangleFilledAdjustedAnimation = (cast this.selectedAnimationArray[index] : RectangleFilledAdjustedAnimation);
            rectangleAdjustedAnimation.setWidth(rectWidth);
            rectangleAdjustedAnimation.setHeight(rectHeight);
            rectangleAdjustedAnimation.setOffsetX(offset);
            rectangleAdjustedAnimation.setOffsetY(offset);
            rectangleAdjustedAnimation.setBasicColorP(selectedButtonColor);
        }
        adjustedBorder = 4;
        if (J2MEUtil.isJ2ME() || J2MEUtil.isHTML()) {
            final rectangleAdjustedAnimation : RectangleAdjustedAnimation = (cast this.unSelectedAnimationArray[index] : RectangleAdjustedAnimation);
            rectangleAdjustedAnimation.setWidth(rectWidth);
            rectangleAdjustedAnimation.setHeight(rectHeight);
            rectangleAdjustedAnimation.setOffsetX(offset);
            rectangleAdjustedAnimation.setOffsetY(offset);
            rectangleAdjustedAnimation.setBasicColorP(buttonColor);
        } else {
            final rectangleAdjustedAnimation : RectangleFilledAdjustedAnimation = (cast this.unSelectedAnimationArray[index] : RectangleFilledAdjustedAnimation);
            rectangleAdjustedAnimation.setWidth(rectWidth);
            rectangleAdjustedAnimation.setHeight(rectHeight);
            rectangleAdjustedAnimation.setOffsetX(offset);
            rectangleAdjustedAnimation.setOffsetY(offset);
            rectangleAdjustedAnimation.setBasicColorP(buttonColor);
        }
    }

    public function getSelectedCommand() : Command {
        final index : Int = super.getSelectedIndex();
        final commandTextItem : CommandTextItem = (cast this.get(index) : CommandTextItem);
        return commandTextItem.getCommand();
    }

    public override function append(item : ABCustomItem) : Int {
        var result : Int = super.append(item);
        this.addAt(result, item);
        return result;
    }

    public override function delete(itemNum : Int) : Void {
        super.delete(itemNum);
    }

    public override function deleteAll() : Void {
        this.initAnimations();
        super.deleteAll();
    }

    public override function insert(itemNum : Int, item : ABCustomItem) : Void {
        super.insert(itemNum, item);
    }

    public override function set(itemNum : Int, item : ABCustomItem) : Void {
        super.set(itemNum, item);
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        super.paint(graphics);
    }

    // throws Exception
    public override function paintItem(graphics : Graphics, index : Int, item : ABCustomItem, x : Int, y : Int) : Int {
        this.selectedAnimationArray[index].paintXY(graphics, x, y);
        return super.paintItem(graphics, index, item, x, y);
    }

    // throws Exception
    public override function paintUnselectedItem(graphics : Graphics, index : Int, item : ABCustomItem, x : Int, y : Int) : Int {
        this.unSelectedAnimationArray[index].paintXY(graphics, x, y);
        return super.paintUnselectedItem(graphics, index, item, x, y);
    }

}

