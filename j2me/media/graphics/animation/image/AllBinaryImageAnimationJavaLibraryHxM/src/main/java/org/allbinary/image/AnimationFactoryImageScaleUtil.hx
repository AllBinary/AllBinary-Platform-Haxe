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
package org.allbinary.image;

import javax.microedition.lcdui.Image;
import org.allbinary.animation.image.AnimationFactoryInitializationVisitor;
import org.allbinary.animation.image.BaseImageAnimationFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.ScaleProperties;
import org.allbinary.media.image.ImageJ2MEScaleUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

class AnimationFactoryImageScaleUtil {
    private static final instance : AnimationFactoryImageScaleUtil = new AnimationFactoryImageScaleUtil();
    public static function getInstance() : AnimationFactoryImageScaleUtil {
        return AnimationFactoryImageScaleUtil.instance;
    }

    private final imageScaleUtil : ImageJ2MEScaleUtil = ImageJ2MEScaleUtil.getInstance();
    // throws Exception
    public function createImage(image : Image, width : Int, height : Int, scaleWidth : Int, scaleHeight : Int) : Image {
        var scaledImage : Image = null;
        if (scaleWidth != 0 && scaleHeight != 0) {
            final scaleX : Float = (scaleWidth) / (width);
            final scaleY : Float = (scaleHeight) / (height);
            if ((scaleX == 1.0 && scaleY == 1.0) || (scaleX == 0.0 || scaleY == 0.0)) {
                scaledImage = image;
            } else {
                final scaledWidth : Int = Std.int((scaleX * width));
                final scaledHeight : Int = Std.int((scaleY * height));
                scaledImage = this.imageScaleUtil.scale(image, scaledWidth, scaledHeight);
            }
        } else {
            scaledImage = image;
        }
        return scaledImage;
    }

    // throws Exception
    public function processAdjust(baseImageAnimationFactory : BaseImageAnimationFactory) : Void {
        final scaleProperties : ScaleProperties = baseImageAnimationFactory.getScalePropertiesP();
        if (scaleProperties.scaleWidth != 0 && scaleProperties.scaleHeight != 0) {
            final animationFactoryInitializationVisitor : AnimationFactoryInitializationVisitor = baseImageAnimationFactory.getAnimationFactoryInitializationVisitorP();
            final scaleX : Float = (scaleProperties.scaleWidth) / (animationFactoryInitializationVisitor.width);
            final scaleY : Float = (scaleProperties.scaleHeight) / (animationFactoryInitializationVisitor.height);
            if ((scaleX == 1.0 && scaleY == 1.0) || (scaleX == 0.0 || scaleY == 0.0)) {
            } else {
                animationFactoryInitializationVisitor.dx = Std.int((animationFactoryInitializationVisitor.originalDx * scaleX));
                animationFactoryInitializationVisitor.dy = Std.int((animationFactoryInitializationVisitor.originalDy * scaleY));
            }
        } else {
        }
    }

    public function new() {
    }
}

