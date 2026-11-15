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
package org.allbinary.animation.image;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.image.GameFeatureImageCacheFactory;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.graphics.displayable.ScreenRelationalUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.media.image.ImageScaleUtil;
import org.microemu.android.device.AndroidImageInterface;

class AllBinaryScreenRelationalImageAnimationInterfaceFactory extends BaseImageAnimationFactory {
    private var lastImage : Image = NullImage.NULL_IMAGE;
    public function new(image : Image, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(image, PrimitiveIntUtil.getArrayInstance(), 0, 0, 0, 0, animationBehaviorFactory);
        if (this.lastImage != NullImage.NULL_IMAGE) {
            final androidImageInterface : AndroidImageInterface = (cast this.lastImage : AndroidImageInterface);
            androidImageInterface.getBitmap().recycle();
        }
        var scale : Float = ScreenRelationalUtil.getInstance().getScaleImage(image);
        this.lastImage = ImageScaleUtil.getInstance().createImage(GameFeatureImageCacheFactory.getInstance(), this.getImage(), scale, scale, false);
    }

    // throws Exception
    public override function getInstance(instanceId : Int) : Animation {
        return new ImageAnimation(this.lastImage, this.animationBehaviorFactory.getOrCreateInstance());
    }

}

