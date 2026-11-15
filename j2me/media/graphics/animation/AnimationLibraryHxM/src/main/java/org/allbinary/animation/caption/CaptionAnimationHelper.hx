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
package org.allbinary.animation.caption;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.text.TextAnimation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class CaptionAnimationHelper extends CaptionAnimationHelperBase {
    private final timeHelper : TimeDelayHelper = new TimeDelayHelper(620);
    private final textAnimation : TextAnimation = new TextAnimation(StringUtil.getInstance().EMPTY_STRING, AnimationBehavior.getInstance());
    private final captionAnimation : Animation;
    private var animation : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
    public function new(captionAnimation : Animation, captionDx : Int, captionDy : Int, dx : Int, dy : Int) {
        super();
        this.captionAnimation = new CaptionAnimation(captionAnimation, this.textAnimation, captionDx, captionDy, dx, dy);
    }

    public override function isShowing() : Bool {
        if (this.animation == this.captionAnimation) {
            return true;
        } else {
            return false;
        }
    }

    public override function tick() : Void {
        if (this.timeHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
            this.animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        }
    }

    public override function update(message : String, basicColor : BasicColor) : Void {
        this.textAnimation.setBasicColorP(basicColor);
        this.textAnimation.setText(message);
        this.animation = this.captionAnimation;
        this.timeHelper.setStartTimeTNT();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.animation.paintXY(graphics, x, y);
    }

}

