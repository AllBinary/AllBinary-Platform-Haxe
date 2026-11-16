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
package org.allbinary.game.ag.layer.hud.basic.health;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.game.health.Health;
import org.allbinary.game.health.HealthListenerInterface;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.NoTimeDelayHelper;
import org.allbinary.time.TimeDelayHelper;

class HealthHudWidget extends BasicHud implements PaintableInterface implements HealthListenerInterface {
    private var healthScale : Int;
    public var animationInterface : Animation;
    public var healthInterface : Health;
    public var max : Int = 0;
    private var xArray : haxe.ds.Vector<Int>;
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    public function new(animationInterface : Animation, healthInterface : Health, location : Int, direction : Int) {
        super(location, direction, 2, BasicColorFactory.getInstance().WHITE);
        this.animationInterface = animationInterface;
        this.healthInterface = healthInterface;
        this.healthInterface.addListener(this);
        this.healthScale = (jre.lang.JavaNumber.divide(this.healthInterface.getMaxHealth(), 6)) + 1;
        this.onHealthChange();
        this.updateMaxWidth = healthInterface.getMaxHealth() * 16;
        this.updateMaxHeight = 16;
        this.xArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...30) 0]);
        this.update();
    }

    private function update() : Void {
        if (this.xArray != null) {
            for (index in 0...this.xArray.length) {
                this.xArray[index] = this.getX() + (index * 16);
            }
        }
    }

    public override function setX(x : Int) : Void {
        super.setX(x);
        this.update();
    }

    private var timeDelayHelper : TimeDelayHelper = NoTimeDelayHelper.SINGLETON;
    private final slowBeatTimeDelayHelper : TimeDelayHelper = new TimeDelayHelper(1280);
    private final mediumBeatTimeDelayHelper : TimeDelayHelper = new TimeDelayHelper(640);
    private final fastBeatTimeDelayHelper : TimeDelayHelper = new TimeDelayHelper(320);
    public function onHealthChange() : Void {
        this.max = (jre.lang.JavaNumber.divide(this.healthInterface.getHealth(), this.healthScale));
        this.timeDelayHelper = NoTimeDelayHelper.SINGLETON;
        if (this.max <= 1 && this.healthInterface.isAlive()) {
            this.max = 1;
            if (this.healthScale - this.healthInterface.getHealth() > Std.int((this.healthScale * 2) / 3)) {
                this.timeDelayHelper = this.slowBeatTimeDelayHelper;
            } else if (this.healthScale - this.healthInterface.getHealth() > Std.int(this.healthScale / 3)) {
                this.timeDelayHelper = this.mediumBeatTimeDelayHelper;
            } else {
                this.timeDelayHelper = this.fastBeatTimeDelayHelper;
            }
        }
    }

    public function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        for (index in 0...this.max) {
            if (this.timeDelayHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
                this.animationInterface.paintXY(graphics, this.xArray[index], this.getY());
            }
        }
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

}

