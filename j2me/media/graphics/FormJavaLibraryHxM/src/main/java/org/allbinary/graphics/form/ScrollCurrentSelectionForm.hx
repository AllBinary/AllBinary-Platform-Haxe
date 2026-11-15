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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.canvas.Processor;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.form.item.ABCustomItem;

class ScrollCurrentSelectionForm extends ScrollSelectionForm implements UpdateMyFontInterface {
    private final moveForSmallScreen : Bool;
    // Java inner class: Haxe does not nest classes so move this to its own module
    class TempHorizontalFormProcessor extends Processor {
        private final scrollCurrentSelectionForm : ScrollCurrentSelectionForm;
        public function new(scrollCurrentSelectionForm : ScrollCurrentSelectionForm) {
            super();
            this.scrollCurrentSelectionForm = scrollCurrentSelectionForm;
        }

        // throws Exception
        public override function process() : Void {
            this.scrollCurrentSelectionForm.processTempHorizontalForm();
            this.scrollCurrentSelectionForm.processor = Processor.getInstance();
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class HorizontalFormProcessor extends Processor {
        private final scrollCurrentSelectionForm : ScrollCurrentSelectionForm;
        public function new(scrollCurrentSelectionForm : ScrollCurrentSelectionForm) {
            super();
            this.scrollCurrentSelectionForm = scrollCurrentSelectionForm;
        }

        // throws Exception
        public override function process() : Void {
            this.scrollCurrentSelectionForm.processHorizontalForm();
            this.scrollCurrentSelectionForm.processor = Processor.getInstance();
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class VerticalFormProcessor extends Processor {
        private final scrollCurrentSelectionForm : ScrollCurrentSelectionForm;
        public function new(scrollCurrentSelectionForm : ScrollCurrentSelectionForm) {
            super();
            this.scrollCurrentSelectionForm = scrollCurrentSelectionForm;
        }

        // throws Exception
        public override function process() : Void {
            this.scrollCurrentSelectionForm.processVerticalForm();
            this.scrollCurrentSelectionForm.processor = Processor.getInstance();
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class TempHorizontalItemIndexDx extends ItemIndexDx {
        private final scrollCurrentSelectionForm : ScrollCurrentSelectionForm;
        public function new(scrollCurrentSelectionForm : ScrollCurrentSelectionForm) {
            super();
            this.scrollCurrentSelectionForm = scrollCurrentSelectionForm;
        }

        // throws Exception
        public override function getDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollCurrentSelectionForm.getXTempHorizontalForm(index, item, dx, dy);
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class HorizontalItemIndexDx extends ItemIndexDx {
        private final scrollCurrentSelectionForm : ScrollCurrentSelectionForm;
        public function new(scrollCurrentSelectionForm : ScrollCurrentSelectionForm) {
            super();
            this.scrollCurrentSelectionForm = scrollCurrentSelectionForm;
        }

        // throws Exception
        public override function getDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollCurrentSelectionForm.getXHorizontalForm(index, item, dx, dy);
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class VerticalItemIndexDx extends ItemIndexDx {
        private final scrollCurrentSelectionForm : ScrollCurrentSelectionForm;
        public function new(scrollCurrentSelectionForm : ScrollCurrentSelectionForm) {
            super();
            this.scrollCurrentSelectionForm = scrollCurrentSelectionForm;
        }

        // throws Exception
        public override function getDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollCurrentSelectionForm.getXVerticalForm(index, item, dx, dy);
        }

    }
    public final updateMyFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    public var myFontProcessor : MyFontProcessor = this.updateMyFontProcessor;
    private var processor : Processor = Processor.getInstance();
    private var preItemIndexDx : ItemIndexDx = ItemIndexDx.getInstance();
    private var dx : Int = 0;
    private var dy : Int = 0;
    private var maxWidth : Int = 0;
    public function new(title : String, items : haxe.ds.Vector<ABCustomItem>, formPaintableFactory : ItemPaintableFactory, border : Int, adjustedExtraBorder : Int, moveForSmallScreen : Bool, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, items, formPaintableFactory, border, adjustedExtraBorder, backgroundBasicColor, foregroundBasicColor);
        this.moveForSmallScreen = moveForSmallScreen;
    }

    // throws Exception
    public override function init(rectangle : Rectangle, formType : FormType) : Void {
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

    public override function updateMeasurement(graphics : Graphics) : Void {
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    private function processTempHorizontalForm() : Void {
        this.dx = this.x - 30 + (this.rectangle.getWidth() >> 1);
        this.dy = this.y;
    }

    private function processHorizontalForm() : Void {
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

    private function processVerticalForm() : Void {
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
        this.dx = ((this.rectangle.getWidth() - this.maxWidth) / 2);
        if (this.size() > 0) {
            this.dy = this.y + ((this.rectangle.getHeight() - totalHeight) / 2);
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

    private function getXTempHorizontalForm(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return this.getDiffX(item);
    }

    private function getXHorizontalForm(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return 0;
    }

    private function getXVerticalForm(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
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
                    throw new haxe.Exception(formTypeFactory.UNK);
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.PAINT, e);
        }
    }

}

