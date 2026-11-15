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

import javax.microedition.lcdui.Image;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.image.AnimationFactoryImageScaleUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.ScaleProperties;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;

class BaseImageAnimationFactory implements AnimationInterfaceFactoryInterface {
    // throws Exception
    public static function createFactoryBase(image : Image, sequenceArray : haxe.ds.Vector<Int>, width : Int, height : Int, animationBehaviorFactory : AnimationBehaviorFactory) : BaseImageAnimationFactory {
        return new BaseImageAnimationFactory(image, sequenceArray, width, height, 0, 0, animationBehaviorFactory);
    }

    public final animationFactoryImageScaleUtil : AnimationFactoryImageScaleUtil = AnimationFactoryImageScaleUtil.getInstance();
    private final image : Image;
    public final animationBehaviorFactory : AnimationBehaviorFactory;
    private final sequenceArray : haxe.ds.Vector<Int>;
    public final animationFactoryInitializationVisitor : AnimationFactoryInitializationVisitor;
    public var scaleProperties : ScaleProperties = ScaleProperties.instance;
    public function new(image : Image, sequenceArray : haxe.ds.Vector<Int>, width : Int, height : Int, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.animationFactoryInitializationVisitor = new AnimationFactoryInitializationVisitor();
        this.image = image;
        this.animationFactoryInitializationVisitor.width = width;
        this.animationFactoryInitializationVisitor.height = height;
        this.animationBehaviorFactory = animationBehaviorFactory;
        this.sequenceArray = sequenceArray;
        this.animationFactoryInitializationVisitor.dx = dx;
        this.animationFactoryInitializationVisitor.dy = dy;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        return NullAnimationFactory.getFactoryInstance().getInstance(instanceId);
    }

    public function getImage() : Image {
        return this.image;
    }

    public function getSequenceArray() : haxe.ds.Vector<Int> {
        return this.sequenceArray;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
        this.scaleProperties = scaleProperties;
        if (this.scaleProperties.shouldScale) {
            this.scaleProperties.scaleWidth = Std.int((this.animationFactoryInitializationVisitor.width * this.scaleProperties.scaleX));
            this.scaleProperties.scaleHeight = Std.int((this.animationFactoryInitializationVisitor.height * this.scaleProperties.scaleY));
        } else {
        }
    }

    public function getAnimationFactoryInitializationVisitorP() : AnimationFactoryInitializationVisitor {
        return this.animationFactoryInitializationVisitor;
    }

    public function getScalePropertiesP() : ScaleProperties {
        return this.scaleProperties;
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(Std.int(this.image.getHeight()));
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(Std.string(this.animationFactoryInitializationVisitor));
        return Std.string(stringBuffer);
    }

}

