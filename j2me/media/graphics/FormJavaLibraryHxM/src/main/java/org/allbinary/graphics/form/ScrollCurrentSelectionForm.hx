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

import javax.microedition.lcdui.Graphics;
import org.allbinary.canvas.Processor;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.form.item.ABCustomItem;

class ScrollCurrentSelectionForm extends ScrollSelectionForm implements UpdateMyFontInterface {
    private final moveForSmallScreen : Bool;
    public final updateMyFontProcessor : MyFontProcessor;
    public var myFontProcessor : MyFontProcessor;
    public var processor : Processor = Processor.getInstance();
    private var preItemIndexDx : ItemIndexDx = ItemIndexDx.getInstance();
    private var dx : Int = 0;
    private var dy : Int = 0;
    private var maxWidth : Int = 0;
    public function new(title : String, items : haxe.ds.Vector<ABCustomItem>, formPaintableFactory : ItemPaintableFactory, border : Int, adjustedExtraBorder : Int, moveForSmallScreen : Bool, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, items, formPaintableFactory, border, adjustedExtraBorder, backgroundBasicColor, foregroundBasicColor);
        this.updateMyFontProcessor = new UpdateMyFontProcessor(this);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.moveForSmallScreen = moveForSmallScreen;
    }

    // throws Exception
    public override function init_Rectangle_FormType(rectangle : Rectangle, formType : FormType) : Void {
        super.init(rectangle, formType);
        final formTypeFactory : FormTypeFactory = FormTypeFactory.getInstance();
        if (formType == formTypeFactory.TEMP_HORIZONTAL_FORM) {
            this.processor = new TempHorizontalFormProcessor(this);
            this.preItemIndexDx = new TempHorizontalItemIndexDx(this);
        } else if (formType == formTypeFactory.HORIZONTAL_FORM) {
            this.processor = new HorizontalFormProcessor(this);
            this.preItemIndexDx = new HorizontalItemIndexDx(this);
        } else if (formType == formTypeFactory.VERTICAL_CENTER_FORM) {
            this.processor = new VerticalFormProcessor(this);
            this.preItemIndexDx = new VerticalItemIndexDx(this);
        } else if (formType == formTypeFactory.NULL_FORM_TYPE) {
        } else {
            this.logUtil.putF(formTypeFactory.UNK, this, this.commonStrings.INIT);
        }
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function processTempHorizontalForm() : Void {
        this.dx = this.x - 30 + (this.rectangle.getWidth() >> 1);
        this.dy = this.y;
    }

    public function processHorizontalForm() : Void {
        final size : Int = this.size();
        var totalWidth : Int = 0;
        var item : ABCustomItem = null;
        for (index in 0...size) {
            item = this.get(index);
            totalWidth += item.getMinimumWidth() + this.border;
        }
        this.dx = this.x + (this.rectangle.getWidth() >> 1) - (totalWidth >> 1);
        this.dy = this.y + (this.rectangle.getHeight() >> 1);
        if (this.moveForSmallScreen) {
            var maxTitleHeight : Int = 175;
            if (this.dy < maxTitleHeight) {
                this.dy = maxTitleHeight;
            }
        }
    }

    public function processVerticalForm() : Void {
        var totalHeight : Int = 0;
        final size : Int = this.size();
        var item2 : ABCustomItem = null;
        for (index in 0...size) {
            item2 = this.get(index);
            if (this.maxWidth < item2.getMinimumWidth()) {
                this.maxWidth = item2.getMinimumWidth();
            }
            totalHeight += item2.getMinimumHeight() + this.border;
        }
        this.dx = jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide((this.rectangle.getWidth() - this.maxWidth), 2)));
        if (this.size() > 0) {
            this.dy = jre.lang.JavaNumber.toInt(this.y + (jre.lang.JavaNumber.divide((this.rectangle.getHeight() - totalHeight), 2)));
            if (this.moveForSmallScreen) {
                var maxTitleHeight : Int = 175;
                if (this.dy < maxTitleHeight) {
                    this.dy = maxTitleHeight;
                }
            }
        } else {
            this.dy = this.y;
        }
    }

    public function getXTempHorizontalForm(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return this.getDiffX(item);
    }

    public function getXHorizontalForm(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return 0;
    }

    public function getXVerticalForm(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return this.getDiffX(item) + this.halfBorder;
    }

    public override function getDiffX(item : ABCustomItem) : Int {
        return ((this.maxWidth - item.getMinimumWidth()) >> 1);
    }

    public override function getDx() : Int {
        return this.dx;
    }

    public override function getDy() : Int {
        return this.dy;
    }

    public override function paint(graphics : Graphics) : Void {
        try {
            this.processor.process();
            var delta : Int = 0;
            var deltaX : Int = this.getDx();
            var deltaY : Int = this.getDy();
            final size : Int = this.size();
            final formTypeFactory : FormTypeFactory = FormTypeFactory.getInstance();
            var item : ABCustomItem = null;
            for (index in 0...size) {
                item = this.get(index);
                var diffX : Int = this.preItemIndexDx.getDx(index, item, this.dx, this.dy);
                if (index == this.getSelectedIndex()) {
                    delta = this.paintItem(graphics, index, item, deltaX + diffX, deltaY);
                    this.paintable.paint(graphics, index, deltaX + diffX, deltaY);
                } else {
                    delta = this.paintUnselectedItem(graphics, index, item, deltaX + diffX, deltaY);
                    this.paintable.paint(graphics, index, deltaX + diffX, deltaY);
                }
                if (this.formType == formTypeFactory.TEMP_HORIZONTAL_FORM) {
                } else if (this.formType == formTypeFactory.HORIZONTAL_FORM) {
                    deltaX = delta;
                } else if (this.formType == formTypeFactory.VERTICAL_CENTER_FORM) {
                    deltaY = delta;
                } else {
                    throw new jre.lang.JavaException(formTypeFactory.UNK);
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.PAINT, e);
        }
    }

}

