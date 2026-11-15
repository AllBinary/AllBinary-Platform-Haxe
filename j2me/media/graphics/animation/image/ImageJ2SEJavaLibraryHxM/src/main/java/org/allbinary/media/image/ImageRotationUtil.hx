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
package org.allbinary.media.image;

//import java.awt.image.BufferedImage;
import javax.microedition.lcdui.Image;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.microemu.device.j2se.J2SEImmutableImage;
import org.microemu.device.j2se.J2SEMutableImage;

class ImageRotationUtil {
    private static final instance : ImageRotationUtil = new ImageRotationUtil();
    public static function getInstance() : ImageRotationUtil {
        return ImageRotationUtil.instance;
    }

    private final imageJ2SERotationUtil : ImageJ2SERotationUtil = ImageJ2SERotationUtil.getInstance();
    public function new() {
    }

    public function rotateImage(originalImage : Image, image : Image, totalAngle : Int) : Void {
        if (image.isMutable()) {
            final j2seImage : J2SEMutableImage = (cast image : J2SEMutableImage);
            final newBufferedImage : BufferedImage = (cast j2seImage.getImage() : BufferedImage);
            var originalAwtImage : jre.awt.Image = null;
            if (originalImage.isMutable()) {
                var originalJ2SEImage : J2SEMutableImage = (cast originalImage : J2SEMutableImage);
                originalAwtImage = (cast originalJ2SEImage.getImage() : jre.awt.Image);
            } else {
                final originalJ2SEImage : J2SEImmutableImage = (cast originalImage : J2SEImmutableImage);
                originalAwtImage = (cast originalJ2SEImage.getImage() : jre.awt.Image);
            }
            this.imageJ2SERotationUtil.rotateImage(originalAwtImage, newBufferedImage, totalAngle);
        } else {
            PreLogUtil.putOE("Not Mutable", this, "getRotatedImage", new jre.lang.JavaException());
        }
    }

    // throws Exception
    public function createRotatedImage(originalImage : Image, rotationInDegrees : Int) : Image {
        final image : Image = ImageCreationUtil.getInstance().createImageWH(originalImage.getWidth(), originalImage.getHeight());
        if (image.isMutable()) {
            var originalAwtImage : jre.awt.Image = null;
            if (originalImage.isMutable()) {
                var originalJ2SEImage : J2SEMutableImage = (cast originalImage : J2SEMutableImage);
                originalAwtImage = (cast originalJ2SEImage.getImage() : jre.awt.Image);
            } else {
                var originalJ2SEImage : J2SEImmutableImage = (cast originalImage : J2SEImmutableImage);
                originalAwtImage = (cast originalJ2SEImage.getImage() : jre.awt.Image);
            }
            var j2seImage : J2SEMutableImage = (cast image : J2SEMutableImage);
            var newBufferedImage : BufferedImage = (cast j2seImage.getImage() : BufferedImage);
            var bufferedImage : BufferedImage = this.imageJ2SERotationUtil.createRotatedImage(originalAwtImage, newBufferedImage, rotationInDegrees);
            return image;
        } else {
            throw new jre.lang.JavaException("Not Mutable");
        }
    }

}

