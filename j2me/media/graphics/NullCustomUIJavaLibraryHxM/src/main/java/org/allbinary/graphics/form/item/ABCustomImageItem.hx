// Generated Code Do Not Modify
package org.allbinary.graphics.form.item;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.color.BasicColor;

class ABCustomImageItem extends ABCustomItem {
    public var yOffset : Int = 0;
    public function new(label : String, image : Image, layout : Int, altText : String, basicColor : BasicColor, yOffset : Int) {
        super(label, basicColor, basicColor);
    }

    public function getImage() : Image {
        return NullImage.NULL_IMAGE;
    }

}

