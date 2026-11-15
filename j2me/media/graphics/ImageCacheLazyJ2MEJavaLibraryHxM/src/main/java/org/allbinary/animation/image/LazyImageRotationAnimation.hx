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
package org.allbinary.animation.image;

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.NullRotationAnimationFactory;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.ScaleProperties;
import org.allbinary.util.CircularIndexUtil;

class LazyImageRotationAnimation extends RotationAnimation {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final layoutIndex : Int;
    public final instanceId : Int;
    public final animationInterfaceFactoryInterface : BaseImageAnimationFactory;
    private final NULL_INDEX_ANIMATION : IndexedAnimation;
    private var animation : IndexedAnimation;
    public var scaleProperties : ScaleProperties = ScaleProperties.instance;
    public function new(layoutIndex : Int, instanceId : Int, scaleProperties : ScaleProperties, animationInterfaceFactoryInterface : BaseImageAnimationFactory, animationBehavior : AnimationBehavior) {
        super(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior);
        this.layoutIndex = layoutIndex;
        this.instanceId = instanceId;
        this.animationInterfaceFactoryInterface = animationInterfaceFactoryInterface;
        final imageCache : ImageCache = ImageCacheFactory.getInstance();
        imageCache.add(this);
        this.scaleProperties = scaleProperties;
        this.NULL_INDEX_ANIMATION = (cast NullRotationAnimationFactory.getFactoryInstance().getInstance(0) : IndexedAnimation);
        // Java inner class: Haxe does not nest classes so move this to its own module
        class ActualRotationAnimation extends RotationAnimation {
            private final lazyImageRotationAnimation : LazyImageRotationAnimation;
            private var index : Int = 0;
            public function new(lazyImageRotationAnimation : LazyImageRotationAnimation) {
                super(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior);
                this.lazyImageRotationAnimation = lazyImageRotationAnimation;
            }

            public override function setFrame(index : Int) : Void {
                this.index = index;
            }

            public override function getFrame() : Int {
                return this.index;
            }

            public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
                try {
                    ImageCacheFactory.getInstance().insertFirst(this);
                    this.lazyImageRotationAnimation.animation = this.lazyImageRotationAnimation.NULL_INDEX_ANIMATION;
                } catch (e : haxe.Exception) {
                    final logUtil : LogUtil = LogUtil.getInstance();
                    logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
                }
            }

            public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
                try {
                    ImageCacheFactory.getInstance().insertFirst(this);
                    this.lazyImageRotationAnimation.animation = this.lazyImageRotationAnimation.NULL_INDEX_ANIMATION;
                } catch (e : haxe.Exception) {
                    final logUtil : LogUtil = LogUtil.getInstance();
                    logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
                }
            }

        }
        this.animation = new ActualRotationAnimation(this);
    }

    private static final SET_REAL_ANIMATION : String = "setRealAnimation";
    public function setRealAnimation() : Void {
        try {
            final animation : IndexedAnimation = this.animation;
            this.animationInterfaceFactoryInterface.setInitialScale(this.scaleProperties);
            this.animation = (cast this.animationInterfaceFactoryInterface.getInstance(this.instanceId) : IndexedAnimation);
            this.animation.setState(animation);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, LazyImageRotationAnimation.SET_REAL_ANIMATION, e);
        }
    }

    public override function setScale(scaleX : Float, scaleY : Float) : Void {
        this.animation.setScale(scaleX, scaleY);
    }

    public override function getAnimationBehavior() : AnimationBehavior {
        return this.animation.getAnimationBehavior();
    }

    // throws Exception
    public override function set(gl : GL) : Void {
        this.animation.set(gl);
    }

    public override function setAlpha(alpha : Int) : Void {
        this.animation.setAlpha(alpha);
    }

    public override function setDx(dx : Int) : Void {
        this.animation.setDx(dx);
    }

    public override function setDy(dy : Int) : Void {
        this.animation.setDy(dy);
    }

    public override function setMaxScale(maxScaleX : Float, maxScaleY : Float) : Void {
        this.animation.setMaxScale(maxScaleX, maxScaleY);
    }

    public override function nextRotation() : Void {
        final rotationAnimation : RotationAnimation = ((cast this.animation : RotationAnimation));
        rotationAnimation.nextRotation();
    }

    public override function previousRotation() : Void {
        final rotationAnimation : RotationAnimation = ((cast this.animation : RotationAnimation));
        rotationAnimation.previousRotation();
    }

    public override function nextRotationX() : Void {
        final rotationAnimation : RotationAnimation = ((cast this.animation : RotationAnimation));
        rotationAnimation.nextRotationX();
    }

    public override function previousRotationX() : Void {
        final rotationAnimation : RotationAnimation = ((cast this.animation : RotationAnimation));
        rotationAnimation.previousRotationX();
    }

    public override function nextRotationZ() : Void {
        final rotationAnimation : RotationAnimation = ((cast this.animation : RotationAnimation));
        rotationAnimation.nextRotationZ();
    }

    public override function previousRotationZ() : Void {
        final rotationAnimation : RotationAnimation = ((cast this.animation : RotationAnimation));
        rotationAnimation.previousRotationZ();
    }

    public override function changeBasicColor(basicColor : BasicColor) : Void {
        this.animation.changeBasicColor(basicColor);
    }

    public override function getBasicColorP() : BasicColor {
        return this.animation.getBasicColorP();
    }

    public override function getChangeBasicColor() : BasicColor {
        return this.animation.getChangeBasicColor();
    }

    public override function getChangeColor() : Int {
        return this.animation.getChangeColor();
    }

    public override function getColor() : Int {
        return this.animation.getColor();
    }

    public override function getDx() : Int {
        return this.animation.getDx();
    }

    public override function getDy() : Int {
        return this.animation.getDy();
    }

    public override function isThreed() : Bool {
        return this.animation.isThreed();
    }

    // throws Exception
    public override function nextFrame() : Void {
        this.animation.nextFrame();
    }

    public override function reset() : Void {
        this.animation.reset();
    }

    public override function setFrame(index : Int) : Void {
        this.animation.setFrame(index);
    }

    public override function getFrame() : Int {
        return this.animation.getFrame();
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.animation.getAnimationSize();
    }

    public override function getSize() : Int {
        return this.animation.getSize();
    }

    public override function previousFrame() : Void {
        this.animation.previousFrame();
    }

    public override function isLastFrame() : Bool {
        return this.animation.isLastFrame();
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
        this.animation.setSequence(sequence);
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return this.animation.getSequence();
    }

    public override function getWidth() : Int {
        return this.animation.getWidth();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        try {
            this.animation.paintXY(graphics, x, y);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
    }

    public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
        try {
            this.animation.paintThreedXYZ(graphics, x, y, z);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final image : Image = this.animationInterfaceFactoryInterface.getImage();
        return new StringMaker().append(super.toString()).append(commonSeps.SPACE).append(image.getName()).append(commonSeps.SPACE).appendint(Std.int(image.getWidth())).append(commonSeps.SPACE).appendint(Std.int(image.getHeight())).toString();
    }

}

