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

//import javax.microedition.lcdui.Canvas;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.RectangleCollisionUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class ScrollSelectionForm extends PaintableForm {
    private static function createForm(title : String, items : haxe.ds.Vector<ABCustomItem>, formPaintableFactory : ItemPaintableFactory, border : Int, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) : PaintableForm {
        try {
            if (formPaintableFactory == ItemPaintableFactory.getInstance()) {
                return new ScrollSelectionForm(title, items, formPaintableFactory, border, -3, backgroundBasicColor, foregroundBasicColor);
            } else {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                final logUtil : LogUtil = LogUtil.getInstance();
                logUtil.putF(commonStrings.EXCEPTION, logUtil, commonStrings.EXCEPTION);
                return PaintableForm.getNullPaintableForm();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            final logUtil : LogUtil = LogUtil.getInstance();
            logUtil.put(commonStrings.EXCEPTION, logUtil, commonStrings.EXCEPTION, e);
            return PaintableForm.getNullPaintableForm();
        }
    }

    private static var NULL_SCROLL_SELECTION_FORM : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullScrollSelectionForm() : ScrollSelectionForm {
        if (ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM == NullUtil.getInstance().NULL_OBJECT) {
            ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM = ScrollSelectionForm.createForm(StringUtil.getInstance().EMPTY_STRING, haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]), ItemPaintableFactory.getInstance(), 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
        }
        return (cast ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM : ScrollSelectionForm);
    }

    private static var NULL_SCROLL_SELECTION_HORIZONTAL_FORM : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullScrollSelectionFormHorizontal() : ScrollSelectionForm {
        if (ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM == NullUtil.getInstance().NULL_OBJECT) {
            ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM = ScrollSelectionForm.createForm(StringUtil.getInstance().EMPTY_STRING, haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]), ItemPaintableFactory.getInstance(), 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
        }
        return (cast ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM : ScrollSelectionForm);
    }

    private static final INSIDE_FORM : String = " inside form";
    private static final IS_IN_FORM : String = "isInForm";
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ScrollSelectionFormHorizontalPaintable extends ItemIndexPaintable {
        private final scrollSelectionForm : ScrollSelectionForm;
        public function new(scrollSelectionForm : ScrollSelectionForm) {
            super();
            this.scrollSelectionForm = scrollSelectionForm;
        }

        // throws Exception
        public override function paint(graphics : Graphics, index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollSelectionForm.paintItemHorizontal(graphics, index, item, dx, dy);
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ScrollSelectionFormVerticalPaintable extends ItemIndexPaintable {
        private final scrollSelectionForm : ScrollSelectionForm;
        public function new(scrollSelectionForm : ScrollSelectionForm) {
            super();
            this.scrollSelectionForm = scrollSelectionForm;
        }

        // throws Exception
        public override function paint(graphics : Graphics, index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollSelectionForm.paintItemVertical(graphics, index, item, dx, dy);
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ScrollSelectionFormTempHorizontalPaintable extends ItemIndexPaintable {
        private final scrollSelectionForm : ScrollSelectionForm;
        public function new(scrollSelectionForm : ScrollSelectionForm) {
            super();
            this.scrollSelectionForm = scrollSelectionForm;
        }

        // throws Exception
        public override function paint(graphics : Graphics, index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollSelectionForm.paintItemTempHorizontal(graphics, index, item, dx, dy);
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ScrollSelectionFormHorizontalDx extends ItemIndexDx {
        private final scrollSelectionForm : ScrollSelectionForm;
        public function new(multipleScrollSelectionForm : ScrollSelectionForm) {
            super();
            this.scrollSelectionForm = multipleScrollSelectionForm;
        }

        // throws Exception
        public override function getDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollSelectionForm.getSelectedIndexForPointHorizontalDx(index, item, dx, dy);
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ScrollSelectionFormVericalDx extends ItemIndexDx {
        private final scrollSelectionForm : ScrollSelectionForm;
        public function new(multipleScrollSelectionForm : ScrollSelectionForm) {
            super();
            this.scrollSelectionForm = multipleScrollSelectionForm;
        }

        // throws Exception
        public override function getDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollSelectionForm.getSelectedIndexForPointVerticalDx(index, item, dx, dy);
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ScrollSelectionFormTempHorizontalDx extends ItemIndexDx {
        private final scrollSelectionForm : ScrollSelectionForm;
        public function new(multipleScrollSelectionForm : ScrollSelectionForm) {
            super();
            this.scrollSelectionForm = multipleScrollSelectionForm;
        }

        // throws Exception
        public override function getDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
            return this.scrollSelectionForm.getSelectedIndexForPointTempHorizontalDx(index, item, dx, dy);
        }

    }
    private final rectangleCollisionUtil : RectangleCollisionUtil = RectangleCollisionUtil.getInstance();
    public final border : Int;
    public final halfBorder : Int;
    private var buttonBasicColor : BasicColor;
    public var scrollSelectionFormFormTypeItemIndexPaintable : ItemIndexPaintable = ItemIndexPaintable.getInstance();
    private var formTypeItemIndexDx : ItemIndexDx = ItemIndexDx.getInstance();
    public var paintable : ItemPaintable = ItemPaintableFactory.getInstance();
    private final adjustedExtraBorder : Int;
    public function new(title : String, items : haxe.ds.Vector<ABCustomItem>, formPaintableFactory : ItemPaintableFactory, border : Int, adjustedExtraBorder : Int, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, items, backgroundBasicColor, foregroundBasicColor);
        this.adjustedExtraBorder = adjustedExtraBorder;
        this.buttonBasicColor = foregroundBasicColor;
        this.border = border;
        this.halfBorder = (border >> 1);
        this.paintable = formPaintableFactory.getInstanceItemPaintable(this);
    }

    // throws Exception
    public override function init(rectangle : Rectangle, formType : FormType) : Void {
        super.init(rectangle, formType);
        final formTypeFactory : FormTypeFactory = FormTypeFactory.getInstance();
        if (formType == formTypeFactory.HORIZONTAL_FORM) {
            this.scrollSelectionFormFormTypeItemIndexPaintable = new ScrollSelectionFormHorizontalPaintable(this);
            this.formTypeItemIndexDx = new ScrollSelectionFormHorizontalDx(this);
        } else if (formType == formTypeFactory.VERTICAL_CENTER_FORM) {
            this.scrollSelectionFormFormTypeItemIndexPaintable = new ScrollSelectionFormVerticalPaintable(this);
            this.formTypeItemIndexDx = new ScrollSelectionFormVericalDx(this);
        } else if (formType == formTypeFactory.TEMP_HORIZONTAL_FORM) {
            this.scrollSelectionFormFormTypeItemIndexPaintable = new ScrollSelectionFormTempHorizontalPaintable(this);
            this.formTypeItemIndexDx = new ScrollSelectionFormTempHorizontalDx(this);
        } else if (formType == formTypeFactory.NULL_FORM_TYPE) {
        } else {
            throw new haxe.Exception(formTypeFactory.UNK);
        }
    }

    public function paintItemHorizontal(graphics : Graphics, index : Int, item : ABCustomItem, x : Int, y : Int) : Int {
        final width : Int = item.getMinimumWidth();
        return x + width + this.border;
    }

    public function paintItemVertical(graphics : Graphics, index : Int, item : ABCustomItem, x : Int, y : Int) : Int {
        final height : Int = item.getMinimumHeight();
        return y + height + this.border;
    }

    public function paintItemTempHorizontal(graphics : Graphics, index : Int, item : ABCustomItem, x : Int, y : Int) : Int {
        return 0;
    }

    public function getSelectedIndexForPointHorizontalDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return dx - this.halfBorder;
    }

    public function getSelectedIndexForPointVerticalDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return dx + this.getDiffX(item);
    }

    public function getSelectedIndexForPointTempHorizontalDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return dx + this.getDiffX(item);
    }

    public override function append(item : ABCustomItem) : Int {
        return super.append(item);
    }

    // throws Exception
    public function getSelectedItem(point : GPoint) : ABCustomItem {
        var index : Int = this.getSelectedIndexForPoint(point);
        if (index != -1) {
            return this.get(index);
        } else {
            return ABCustomItem.getNullInstance();
        }
    }

    // throws Exception
    public function getItemIndex(item : ABCustomItem) : Int {
        var nextItem : ABCustomItem = null;
        final size : Int = this.size();
        for (index in 0...size) {
            nextItem = (cast this.get(index) : ABCustomItem);
            if (nextItem == item) {
                return index;
            }
        }
        return -1;
    }

    public function getStartIndex() : Int {
        return 0;
    }

    private static final GET_SELECTED_INDEX : String = "getSelectedIndexForPoint";
    // throws Exception
    public function getSelectedIndexForPoint(point : GPoint) : Int {
        final start : Int = this.getStartIndex();
        final size : Int = this.size();
        var dx : Int = this.getDx();
        var dy : Int = this.getDy();
        final formTypeFactory : FormTypeFactory = FormTypeFactory.getInstance();
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(commonLabels.START_LABEL);
        stringBuffer.appendint(start);
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(commonLabels.TOTAL_LABEL);
        stringBuffer.appendint(size);
        this.logUtil.putF(stringBuffer.toString(), this, ScrollSelectionForm.GET_SELECTED_INDEX);
        var item : ABCustomItem = null;
        var width : Int = 0;
        var height : Int = 0;
        var diffX : Int = 0;
        for (index in start...size) {
            item = this.get(index);
            width = item.getMinimumWidth();
            height = item.getMinimumHeight();
            diffX = this.formTypeItemIndexDx.getDx(index, item, dx, dy);
            if (this.rectangleCollisionUtil.isInside(diffX, dy - this.halfBorder, diffX + width + this.border, dy + height + this.halfBorder + 1, point.getX(), point.getY())) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(commonLabels.ITEM_LABEL);
                stringBuffer.append(item.getLabel());
                stringBuffer.append(CommonSeps.getInstance().SPACE);
                stringBuffer.append(commonLabels.INDEX_LABEL);
                stringBuffer.appendint(index);
                this.logUtil.putF(stringBuffer.toString(), this, ScrollSelectionForm.GET_SELECTED_INDEX);
                return index;
            }
            if (this.formType == formTypeFactory.HORIZONTAL_FORM) {
                dx = dx + width + this.border;
                if (dx > this.rectangle.getMaxX()) {
                    break;
                }
            } else if (this.formType == formTypeFactory.VERTICAL_CENTER_FORM) {
                dy = dy + height + this.border;
                if (dy > this.rectangle.getMaxY()) {
                    break;
                }
            } else if (this.formType == formTypeFactory.NULL_FORM_TYPE) {
            } else {
                throw new haxe.Exception(formTypeFactory.UNK);
            }
        }
        return -1;
    }

    // throws Exception
    public function processInputKey(gameKeyCode : Int) : Int {
        final formTypeFactory : FormTypeFactory = FormTypeFactory.getInstance();
        if (this.size() == 0) {
            return -1;
        }
        var index : Int = this.getSelectedIndex();
        if (this.formType == formTypeFactory.HORIZONTAL_FORM || this.formType == formTypeFactory.TEMP_HORIZONTAL_FORM) {
            if (gameKeyCode == Canvas.RIGHT) {
                index++;
            } else if (gameKeyCode == Canvas.LEFT) {
                index--;
            }
        } else if (this.formType == formTypeFactory.VERTICAL_CENTER_FORM) {
            if (gameKeyCode == Canvas.DOWN) {
                index++;
            } else if (gameKeyCode == Canvas.UP) {
                index--;
            }
        } else if (this.formType == formTypeFactory.NULL_FORM_TYPE) {
        } else {
            throw new haxe.Exception(formTypeFactory.UNK);
        }
        final max : Int = this.size() - 1;
        if (index < 0) {
            this.setSelectedIndex(0);
        } else if (index > max) {
            this.setSelectedIndex(max);
        } else {
            this.setSelectedIndex(index);
        }
        return -1;
    }

    public function isInForm(point : GPoint) : Bool {
        if (this.rectangleCollisionUtil.isInside(this.x, this.y - this.halfBorder, this.rectangle.getMaxX() + this.border, this.rectangle.getMaxY() + this.border, point.getX(), point.getY())) {
            this.logUtil.putF(new StringMaker().append(StringUtil.getInstance().toString(point)).append(ScrollSelectionForm.INSIDE_FORM).toString(), this, ScrollSelectionForm.IS_IN_FORM);
            return true;
        }
        return false;
    }

    // throws Exception
    public function paintItem(graphics : Graphics, index : Int, item : ABCustomItem, x : Int, y : Int) : Int {
        item.paintXY(graphics, x, y);
        final width : Int = item.getMinimumWidth();
        final height : Int = item.getMinimumHeight();
        graphics.setColor(Std.int(this.getButtonBasicColor()));
        final adjustedBorder : Int = 3;
        graphics.drawRect(x - this.halfBorder - adjustedBorder, y - this.halfBorder - adjustedBorder, width + this.border + this.adjustedExtraBorder, height + this.border + this.adjustedExtraBorder);
        return this.scrollSelectionFormFormTypeItemIndexPaintable.paint(graphics, index, item, x, y);
    }

    // throws Exception
    public function paintUnselectedItem(graphics : Graphics, index : Int, item : ABCustomItem, x : Int, y : Int) : Int {
        graphics.setColor(Std.int(this.getButtonBasicColor()));
        item.paintUnselected(graphics, x, y);
        return this.scrollSelectionFormFormTypeItemIndexPaintable.paint(graphics, index, item, x, y);
    }

    public function getDiffX(item : ABCustomItem) : Int {
        return 0;
    }

    public function getDx() : Int {
        return this.x;
    }

    public function getDy() : Int {
        return this.y;
    }

    public function setButtonBasicColor(buttonBasicColor : BasicColor) : Void {
        this.buttonBasicColor = buttonBasicColor;
    }

    private function getButtonBasicColor() : BasicColor {
        return this.buttonBasicColor;
    }

}

