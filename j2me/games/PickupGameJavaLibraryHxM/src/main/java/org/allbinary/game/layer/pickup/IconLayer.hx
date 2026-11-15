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
package org.allbinary.game.layer.pickup;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.view.ViewPosition;

class IconLayer extends AllBinaryLayer {
    public static final NULL_ICON_LAYER : IconLayer = new IconLayer(NullAnimationFactory.getFactoryInstance().getInstance(0), 0, 0);
    private var animationInterface : Animation;
    public function new(animationInterface : Animation, width : Int, height : Int) {
        super(StringUtil.getInstance().EMPTY_STRING, new Rectangle(PointFactory.getInstance().ZERO_ZERO, width, height), ViewPosition.getInstanceD());
        this.animationInterface = animationInterface;
    }

    public override function paint(graphics : Graphics) : Void {
        this.animationInterface.paintXY(graphics, this.x, this.y);
    }

    public override function paintThreed(graphics : Graphics) : Void {
        this.animationInterface.paintThreedXYZ(graphics, this.x, this.y, this.z);
    }

    public function getAnimationInterface() : Animation {
        return this.animationInterface;
    }

}

