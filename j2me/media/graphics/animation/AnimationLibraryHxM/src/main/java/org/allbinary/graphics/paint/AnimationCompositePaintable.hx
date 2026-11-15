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
package org.allbinary.graphics.paint;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;

class AnimationCompositePaintable extends InitUpdatePaintable {
    private final animationInterface : Animation;
    public function new(animationInterface : Animation) {
        super();
        this.animationInterface = animationInterface;
    }

    public override function paint(graphics : Graphics) : Void {
        this.animationInterface.paintXY(graphics, 0, 0);
    }

    public override function paintThreed(graphics : Graphics) : Void {
        this.animationInterface.paintThreedXYZ(graphics, 0, 0, 0);
    }

}

