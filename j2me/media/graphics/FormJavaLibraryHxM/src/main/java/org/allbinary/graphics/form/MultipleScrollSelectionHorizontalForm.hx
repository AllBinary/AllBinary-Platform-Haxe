// Generated Code Do Not Modify
package org.allbinary.graphics.form;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.J2MEUtil;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;

class MultipleScrollSelectionHorizontalForm extends ScrollSelectionForm implements UpdateMyFontInterface {
    // throws Exception
    public static function createForm(title : String, items : haxe.ds.Vector<ABCustomItem>, rectangle : Rectangle, formType : FormType, border : Int, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) : ScrollSelectionForm {
        final scrollSelectionForm : ScrollSelectionForm = new MultipleScrollSelectionHorizontalForm(title, items, ItemPaintableFactory.getInstance(), border, backgroundBasicColor, foregroundBasicColor);
        scrollSelectionForm.init(rectangle, formType);
        return scrollSelectionForm;
    }

    private var rectPaintable : Paintable = NullPaintable.getInstance();
    private var multipleScrollSelectionHorizontalFormTypeItemIndexPaintable : ItemIndexPaintable = ItemIndexPaintable.getInstance();
    private final backgroundColor : Int = Std.int(BasicColorFactory.getInstance().TRANSPARENT_GREY);
    private var myFontProcessor : MyFontProcessor;
    private var logged : Bool = false;
    private var fontHeight : Int = 0;
    public function new(title : String, items : haxe.ds.Vector<ABCustomItem>, formPaintableFactory : ItemPaintableFactory, border : Int, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, items, formPaintableFactory, border, 3, backgroundBasicColor, foregroundBasicColor);
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        if (J2MEUtil.isJ2ME() || J2MEUtil.isHTML()) {
        } else {
            this.rectPaintable = new MultipleScrollSelectionFormRectPaintable(this);
        }
    }

    public function fillRect(graphics : Graphics) : Void {
        graphics.setColor(this.backgroundColor);
        graphics.fillRect(this.x, this.y, this.rectangle.getWidth(), this.rectangle.getHeight());
    }

    // throws Exception
    public override function init(rectangle : Rectangle, formType : FormType) : Void {
        super.init(rectangle, formType);
        final formTypeFactory : FormTypeFactory = FormTypeFactory.getInstance();
        if (formType == formTypeFactory.HORIZONTAL_FORM) {
            this.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = new MultipleScrollSelectionFormHorizontalPaintable(this);
        } else if (formType == formTypeFactory.VERTICAL_CENTER_FORM) {
            this.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = new MultipleScrollSelectionFormVerticalPaintable(this);
        } else if (formType == formTypeFactory.NULL_FORM_TYPE) {
        } else {
            throw new jre.lang.JavaException(formTypeFactory.UNK);
        }
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    // throws Exception
    public function paintHorizontal(graphics : Graphics, index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        var dx2 : Int = this.paintItem(graphics, index, item, dx, dy) + this.border;
        this.paintable.paint(graphics, index, dx, dy);
        dx = dx2;
        return dx;
    }

    // throws Exception
    public function paintVertical(graphics : Graphics, index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        this.paintItem(graphics, index, item, dx, dy);
        this.paintable.paint(graphics, index, dx, dy);
        return dx;
    }

    public override function getStartIndex() : Int {
        return this.getSelectedIndex();
    }

    public override function paint(graphics : Graphics) : Void {
        try {
            this.myFontProcessor.process(graphics);
            final start : Int = this.getStartIndex();
            final size : Int = this.size();
            var dx : Int = this.x;
            final dy : Int = this.y;
            this.rectPaintable.paint(graphics);
            graphics.drawString(this.getTitle(), this.x, this.y - this.fontHeight, 0);
            var item : ABCustomItem = null;
            for (index in start...size) {
                item = this.get(index);
                if (dx >= this.rectangle.getMaxX()) {
                    if (this.logged) {
                    } else {
                        this.logged = true;
                        PreLogUtil.put(Std.string(new StringMaker().append("painting beyond maxx: ").appendint(Std.int(this.rectangle.getMaxX()))), this, this.canvasStrings.PAINT);
                    }
                }
                dx = this.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable.paint(graphics, index, item, dx, dy);
            }
        } catch (e : haxe.Exception) {
            PreLogUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.PAINT);
        }
    }

}

