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

//import javax.microedition.lcdui.Image;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.image.opengles.OpenGLESImage;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.eclipse.swt.graphics.GC;
import org.microemu.device.swt.SwtImmutableImage;
import org.microemu.device.swt.SwtMutableImage;

class ImageRotationUtil {
    private static final instance : ImageRotationUtil = new ImageRotationUtil();
    public static function getInstance() : ImageRotationUtil {
        return ImageRotationUtil.instance;
    }

    private final imageSwtRotationUtil : ImageSwtRotationUtil = ImageSwtRotationUtil.getInstance();
    public function new() {
    }

    private final features : Features = Features.getInstance();
    public function rotateImage(originalImage : Image, image : Image, totalAngle : Int) : Void {
        var originalImage2 : Image = originalImage;
        if (this.features.isFeature(OpenGLFeatureFactory.getInstance().OPENGL)) {
            if (image.getType() >= OpenGLESImage.TYPE) {
                final openGLESImage : OpenGLESImage = ((cast image : OpenGLESImage));
                openGLESImage.openGLESImageProperties.angle = totalAngle;
                return;
            } else {
                PreLogUtil.put("OpenGL but image is: " + image + " type: " + image.getType(), this, "rotateImage");
            }
        }
        final originalSwtImage : org.eclipse.swt.graphics.Image = ((cast originalImage2.getImage() : org.eclipse.swt.graphics.Image));
        var gc : GC = null;
        var copySwtImage : org.eclipse.swt.graphics.Image = null;
        if (image.isMutable()) {
            final swtImage : SwtMutableImage = (cast image : SwtMutableImage);
            copySwtImage = (cast swtImage.getImage() : org.eclipse.swt.graphics.Image);
            gc = swtImage.getGc();
            this.imageSwtRotationUtil.rotateImage(originalSwtImage, copySwtImage, gc, totalAngle);
        } else {
            PreLogUtil.put("No rotation for: " + image.toString(), this, "rotateImage");
        }
    }

    // throws Exception
    public function createRotatedImage(originalImage : Image, rotationInDegrees : Int) : Image {
        return originalImage;
    }

}

