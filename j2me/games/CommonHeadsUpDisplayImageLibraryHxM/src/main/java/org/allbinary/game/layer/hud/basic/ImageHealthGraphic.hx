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
package org.allbinary.game.layer.hud.basic;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationInterface;
import org.allbinary.game.health.HealthInterface;
import org.allbinary.graphics.Anchor;
import org.allbinary.image.ImageCacheFactory;

class ImageHealthGraphic extends HealthGraphic {
    private var image : haxe.ds.Vector<Image>;
    public function new(animationInterface : AnimationInterface, healthInterface : HealthInterface, location : Int, direction : Int) {
        super(animationInterface, healthInterface, location, direction);
        this.image = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.healthInterface.getMaxHealth()) null]);
        var imageCacheFactory : ImageCacheFactory = ImageCacheFactory.getInstance();
        for (numOfHealth in 0...max + 1) {
            this.image[numOfHealth] = imageCacheFactory.get(this, numOfHealth + 1 * 10, 10);
        }
        for (numOfHealth in 0...max + 1) {
            for (index in 0...numOfHealth) {
                this.animationInterface.paint(this.image[numOfHealth].getGraphics(), numOfHealth * 10, 0);
            }
        }
    }

    public function paint(graphics : Graphics) : Void {
        graphics.drawImage(this.image[max], x, y, Anchor.TOP_LEFT);
    }

}

