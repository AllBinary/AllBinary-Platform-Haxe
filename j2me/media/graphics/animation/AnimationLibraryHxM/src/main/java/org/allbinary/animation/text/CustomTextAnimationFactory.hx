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
package org.allbinary.animation.text;

import javax.microedition.lcdui.Font;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.ScaleProperties;

class CustomTextAnimationFactory implements AnimationInterfaceFactoryInterface {
    public static function createDXY(text : String, fontSize : Int, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) : CustomTextAnimationFactory {
        final customTextAnimationFactory : CustomTextAnimationFactory = new CustomTextAnimationFactory(text, fontSize, animationBehaviorFactory);
        customTextAnimationFactory.dx = dx;
        customTextAnimationFactory.dy = dy;
        return customTextAnimationFactory;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final animationBehaviorFactory : AnimationBehaviorFactory;
    public var basicColor : BasicColor = BasicColorFactory.getInstance().BLACK;
    private var text : String;
    private var initScaleHeight : Int;
    public var dx : Int = 0;
    public var dy : Int = 0;
    public var font : Font;
    public var scaleProperties : ScaleProperties;
    public function new(text : String, fontSize : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.scaleProperties = new ScaleProperties();
        this.text = text;
        this.scaleProperties.scaleHeight = fontSize - (Std.int(fontSize / 4));
        this.initScaleHeight = this.scaleProperties.scaleHeight;
        this.animationBehaviorFactory = animationBehaviorFactory;
        this.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, this.initScaleHeight);
    }

    // throws Exception
    public function getInstanceFor(instanceId : Int) : Animation {
        var customTextAnimation : CustomTextAnimation = null;
        if (this.dx != 0 || this.dy != 0) {
            customTextAnimation = new AdjustCustomTextAnimation(this.text, this.scaleProperties.scaleHeight, this.dx, this.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            customTextAnimation = new CustomTextAnimation(this.text, this.scaleProperties.scaleHeight, this.animationBehaviorFactory.getOrCreateInstance());
        }
        customTextAnimation.setBasicColorP(this.basicColor);
        return customTextAnimation;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

    public function getWidth() : Int {
        return this.font.stringWidth(this.text);
    }

    public function getHeight() : Int {
        return this.font.getHeight();
    }

}

