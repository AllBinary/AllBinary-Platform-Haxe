// Generated Code Do Not Modify
package org.allbinary.graphics.form.item;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;

class CustomCustomItem extends ABCustomItem implements UpdateMyFontInterface {
    public final updateMyFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    public var myFontProcessor : MyFontProcessor = this.updateMyFontProcessor;
    public function new(label : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(label, backgroundBasicColor, foregroundBasicColor);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
    }

}

