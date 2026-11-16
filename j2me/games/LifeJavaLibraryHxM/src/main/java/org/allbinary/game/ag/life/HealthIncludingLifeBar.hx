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
package org.allbinary.game.ag.life;

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.health.Health;
import org.allbinary.game.health.HealthBarAnimation;
import org.allbinary.game.health.HealthBarTwodAnimation;
import org.allbinary.game.health.HealthInterface;
import org.allbinary.game.health.HealthListenerInterface;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.layer.AllBinaryLayer;

class HealthIncludingLifeBar extends Paintable implements HealthListenerInterface {
    // throws Exception
    public static function createHealthIncludingLifeBar(layerInterface : AllBinaryLayer, life : Life, healthInterface : Health, location : Int, direction : Int) : HealthIncludingLifeBar {
        return new HealthIncludingLifeBar(layerInterface, life, healthInterface, new HealthBarTwodAnimation(layerInterface, location), direction);
    }

    private final animationInterface : HealthBarAnimation;
    private final life : Life;
    private final healthInterface : HealthInterface;
    public final allbinaryLayer : AllBinaryLayer;
    public function new(layerInterface : AllBinaryLayer, life : Life, healthInterface : Health, animationInterface : HealthBarAnimation, direction : Int) {
        super();
        this.allbinaryLayer = layerInterface;
        this.animationInterface = animationInterface;
        this.life = life;
        this.healthInterface = healthInterface;
        this.healthInterface.addListener(this);
        this.onHealthChange();
    }

    public function onHealthChange() : Void {
        this.animationInterface.onHealthChange(jre.lang.JavaNumber.divide(((this.healthInterface.getHealth() + (this.healthInterface.getMaxHealth() * this.life.get())) * this.allbinaryLayer.getWidth()), (this.healthInterface.getMaxHealth() + (this.healthInterface.getMaxHealth() * this.life.getStartLives()))));
    }

    public override function paint(graphics : Graphics) : Void {
        this.animationInterface.paintXY(graphics, 0, 0);
    }

    public override function paintThreed(graphics : Graphics) : Void {
        this.animationInterface.paintThreedXYZ(graphics, 0, 0, 0);
    }

}

