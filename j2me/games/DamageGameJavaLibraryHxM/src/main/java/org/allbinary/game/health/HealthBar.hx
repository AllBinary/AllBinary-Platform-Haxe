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
package org.allbinary.game.health;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.layer.AllBinaryLayer;

class HealthBar extends Paintable implements HealthListenerInterface {
    private final animationInterface : HealthBarAnimation;
    private final healthInterface : HealthInterface;
    public final allbinaryLayer : AllBinaryLayer;
    public function new(layerInterface : AllBinaryLayer, healthInterface : Health, animationInterface : HealthBarAnimation, direction : Int) {
        super();
        this.allbinaryLayer = layerInterface;
        this.animationInterface = animationInterface;
        this.healthInterface = healthInterface;
        this.healthInterface.addListener(this);
        this.onHealthChange();
    }

    public override function onHealthChange() : Void {
        this.animationInterface.onHealthChange(this.healthInterface.getHealth() * this.allbinaryLayer.getWidth() / this.healthInterface.getMaxHealth());
    }

    public override function paint(graphics : Graphics) : Void {
        this.animationInterface.paintXY(graphics, 0, 0);
    }

    public override function paintThreed(graphics : Graphics) : Void {
        this.animationInterface.paintThreedXYZ(graphics, 0, 0, 0);
    }

}

