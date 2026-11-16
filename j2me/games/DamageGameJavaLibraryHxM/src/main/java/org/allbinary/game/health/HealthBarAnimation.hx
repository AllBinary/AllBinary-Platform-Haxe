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

import org.allbinary.animation.Animation;
import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayer;

class HealthBarAnimation extends Animation {
    private final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    public var x2 : Int = 0;
    public var thickness : Int = 0;
    private var location : Int;
    public var allbinaryLayer : AllBinaryLayer;
    public function new(layerInterface : AllBinaryLayer, location : Int) {
        super();
        this.allbinaryLayer = layerInterface;
        this.location = location;
        final basicHudFactory : BasicHudFactory = BasicHudFactory.getInstance();
        if (this.location != basicHudFactory.TOPLEFT && this.location != basicHudFactory.BOTTOMLEFT) {
            throw new jre.lang.JavaException("Location Not Valid");
        }
        if (layerInterface.getWidth() > 40) {
            this.thickness = 3;
        } else if (layerInterface.getWidth() > 20) {
            this.thickness = 2;
        } else {
            this.thickness = 1;
        }
    }

    public function onHealthChange(newX2 : Int) : Void {
        this.x2 = newX2;
        var quarter : Int = (this.allbinaryLayer.getWidth() >> 2);
        if (this.x2 > quarter * 3) {
            this.basicColor = this.basicColorFactory.GREEN;
            this.colorP = jre.lang.JavaObject.intValue(this.basicColor);
        } else if (this.x2 > quarter * 2) {
            this.basicColor = this.basicColorFactory.YELLOW;
            this.colorP = jre.lang.JavaObject.intValue(this.basicColor);
        } else if (this.x2 > quarter) {
            this.basicColor = this.basicColorFactory.ORANGE;
            this.colorP = jre.lang.JavaObject.intValue(this.basicColor);
        } else {
            this.basicColor = this.basicColorFactory.RED;
            this.colorP = jre.lang.JavaObject.intValue(this.basicColor);
        }
    }

    public function getY() : Int {
        final basicHudFactory : BasicHudFactory = BasicHudFactory.getInstance();
        if (this.location == basicHudFactory.TOPLEFT) {
            return this.allbinaryLayer.getViewPosition().getY() - 4;
        } else if (this.location == basicHudFactory.BOTTOMLEFT) {
            return this.allbinaryLayer.getViewPosition().getY2() + 4;
        }
        return -1;
    }

}

