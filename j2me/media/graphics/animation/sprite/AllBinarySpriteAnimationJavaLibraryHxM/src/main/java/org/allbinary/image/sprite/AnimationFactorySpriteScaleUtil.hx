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
package org.allbinary.image.sprite;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.game.Sprite;
import org.allbinary.game.layer.SpriteFactory;
import org.allbinary.graphics.opengles.OpenGLUtil;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.image.opengles.OpenGLESImageExclusionUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.J2SEMath;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.image.ImageScaleUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

class AnimationFactorySpriteScaleUtil {
    private static final instance : AnimationFactorySpriteScaleUtil = new AnimationFactorySpriteScaleUtil();
    public static function getInstance() : AnimationFactorySpriteScaleUtil {
        return AnimationFactorySpriteScaleUtil.instance;
    }

    private final imageCache : ImageCache = ImageCacheFactory.getInstance();
    private final imageScaleUtil : ImageScaleUtil = ImageScaleUtil.getInstance();
    private final openGLUtil : OpenGLUtil = OpenGLUtil.getInstance();
    private final j2seMath : J2SEMath = J2SEMath.getInstance();
    private final openGLESImageExclusionUtil : OpenGLESImageExclusionUtil = OpenGLESImageExclusionUtil.getInstance();
    // throws Exception
    public function createImage(image : Image, width : Int, height : Int, scaleWidth : Int, scaleHeight : Int) : Sprite {
        final spriteFactory : SpriteFactory = SpriteFactory.getInstance();
        var sprite : Sprite = null;
        var scaledImage : Image = null;
        if (scaleWidth != 0 && scaleHeight != 0) {
            var scaleX : Float = (scaleWidth) / (width);
            var scaleY : Float = (scaleHeight) / (height);
            if ((scaleX == 1.0 && scaleY == 1.0) || (scaleX == 0.0 || scaleY == 0.0)) {
                scaledImage = this.openGLUtil.addImage(image);
                sprite = spriteFactory.createSprite(scaledImage, width, height);
            } else {
                if (this.openGLESImageExclusionUtil.isCustomScaling(image)) {
                    final width2 : Int = this.j2seMath.round((scaleWidth) - 0.5);
                    final height2 : Int = this.j2seMath.round((scaleHeight) - 0.5);
                    final multiplesOf16Width : Int = Std.int(width2 / 16);
                    final by16Width : Int = multiplesOf16Width * 16;
                    scaleX = (by16Width) / width;
                    final multiplesOf16Height : Int = Std.int(height2 / 16);
                    final by16Height : Int = multiplesOf16Height * 16;
                    scaleY = (by16Height) / height;
                    if (scaleWidth < width) {
                        scaleX = scaleX * 2.35;
                    }
                    if (scaleHeight < height) {
                        scaleY = scaleY * 2.35;
                    }
                }
                scaledImage = this.imageScaleUtil.createImage2(this.imageCache, image, scaleX, 1.0, scaleY, 1.0, true);
                sprite = spriteFactory.createSprite(scaledImage, Std.int((width * scaleX)), Std.int((height * scaleY)));
            }
        } else {
            scaledImage = this.openGLUtil.addImage(image);
            sprite = spriteFactory.createSprite(scaledImage, width, height);
        }
        return sprite;
    }

    public function new() {
    }
}

