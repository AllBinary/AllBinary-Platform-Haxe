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
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.util.BasicArrayList;

class TouchButtonsPaintable extends Paintable {
    public final foregroundBasicColor : BasicColor;
    public final foregroundColor : Int;
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    private final touchButtonFactory : TouchButtonFactory = TouchButtonFactory.getInstance();
    public function new(basicColor : BasicColor) {
        super();
        this.foregroundBasicColor = basicColor;
        this.foregroundColor = Std.int(basicColor);
    }

    public override function paint(graphics : Graphics) : Void {
        final list : BasicArrayList = this.touchButtonFactory.getList();
        this.basicSetColorUtil.setBasicColorP3(graphics, this.foregroundBasicColor, this.foregroundColor);
        var touchButton : TouchButton = null;
        {
            var index : Int = list.size();
            while (--index >= 0) {
            touchButton = (cast list.objectArray[index] : TouchButton);
            touchButton.paint(graphics);
            }
        }
        {
            var index : Int = list.size();
            while (--index >= 0) {
            touchButton = (cast list.objectArray[index] : TouchButton);
            touchButton.paintHint(graphics);
            }
        }
    }

}

