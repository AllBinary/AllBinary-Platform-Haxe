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
package org.allbinary.game.ag.layer.hud.basic.life;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.game.ag.life.Life;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.paint.PaintableInterface;

class LivesHudWidget extends BasicHud implements PaintableInterface {
    private final lifeInterface : Life;
    private final xArray : haxe.ds.Vector<Int>;
    private final animationInterface : Animation;
    public function new(animationInterface : Animation, lifeInterface : Life, location : Int, direction : Int) {
        super(location, direction, 2, BasicColorFactory.getInstance().WHITE);
        this.lifeInterface = lifeInterface;
        final size : Int = jre.lang.JavaNumber.toInt(this.getLifeInterface().getMaxlives());
        this.xArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) 0]);
        this.animationInterface = animationInterface;
        this.updateMaxWidth = this.lifeInterface.getMaxlives() * 16;
        this.updateMaxHeight = 16;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        super.updateMeasurement(graphics);
        var maxLives : Int = jre.lang.JavaNumber.toInt(this.getLifeInterface().getMaxlives());
        for (index in 0...maxLives) {
            this.xArray[index] = this.getX() + (index * 16);
        }
    }

    public override function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        super.onDisplayChangeEvent(displayChangeEvent);
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public override function setX(x : Int) : Void {
        super.setX(x);
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        {
            var index : Int = jre.lang.JavaNumber.toInt(this.getLifeInterface().get());
            while (--index >= 0) {
            this.animationInterface.paintXY(graphics, this.xArray[index], this.getY());
            }
        }
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

    public function getLifeInterface() : Life {
        return this.lifeInterface;
    }

}

