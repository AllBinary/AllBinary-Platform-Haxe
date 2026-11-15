/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.animation.caption;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.color.BasicColor;

class CaptionAnimationHelperBase extends Animation {
    public static final INSTANCE : CaptionAnimationHelperBase = new CaptionAnimationHelperBase();
    public function isShowing() : Bool {
        return false;
    }

    public function tick() : Void {
    }

    public function update(message : String, basicColor : BasicColor) : Void {
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
    }

    public function new() {
        super();
    }
}

