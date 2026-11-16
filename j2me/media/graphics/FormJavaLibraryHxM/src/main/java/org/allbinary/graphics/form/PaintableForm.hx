// Generated Code Do Not Modify
package org.allbinary.graphics.form;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;

class PaintableForm extends ABCustomForm {
    private static var NULL_PAINTABLE_FORM : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullPaintableForm() : PaintableForm {
        if (PaintableForm.NULL_PAINTABLE_FORM == NullUtil.getInstance().NULL_OBJECT) {
            PaintableForm.NULL_PAINTABLE_FORM = new PaintableForm(StringUtil.getInstance().EMPTY_STRING, haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]), BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
        }
        return (cast PaintableForm.NULL_PAINTABLE_FORM : PaintableForm);
    }

    public final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
    public var rectangle : Rectangle = RectangleFactory.SINGLETON;
    public var x : Int = 0;
    public var y : Int = 0;
    public var formType : FormType = FormTypeFactory.getInstance().NULL_FORM_TYPE;
    public function new(title : String, items : haxe.ds.Vector<ABCustomItem>, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, items, backgroundBasicColor, foregroundBasicColor);
        this.setSelectedIndex(0);
    }

    public function init(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            this.init_Rectangle_FormType(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: init");
    }

    // throws Exception
    public function init_Rectangle_FormType(rectangle : Rectangle, formType : FormType) : Void {
        this.rectangle = rectangle;
        final point : GPoint = this.rectangle.getPoint();
        this.x = point.getX();
        this.y = point.getY();
        this.formType = formType;
    }

    public override function getWidth() : Int {
        return this.rectangle.getWidth();
    }

}

