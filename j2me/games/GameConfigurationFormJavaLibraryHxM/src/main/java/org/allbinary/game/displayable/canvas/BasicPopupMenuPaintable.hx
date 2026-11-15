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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.AndroidUtil;
import org.allbinary.J2MEUtil;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.vector.RectangleFilledAnimation;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.layer.SWTUtil;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.graphics.draw.DrawVerticalStringUtil;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.threed.SWTJOGLProcessor;

class BasicPopupMenuPaintable extends Paintable implements UpdateMyFontInterface {
    private static final NAME : String = "MENU";
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    private final drawStringUtil : DrawVerticalStringUtil = DrawVerticalStringUtil.getInstance();
    private final label : String;
    private final foregroundBasicColor : BasicColor;
    private var myFontProcessor : MyFontProcessor;
    private var rectangle : Rectangle;
    private var BORDER : Int = 0;
    private var heightOffset : Int = 0;
    private var offset : Int = 0;
    private var animationInterface : Animation = null;
    public function new(rectangle : Rectangle, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super();
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        this.foregroundBasicColor = foregroundBasicColor;
        this.label = BasicPopupMenuPaintable.NAME;
        this.rectangle = rectangle;
        if (J2MEUtil.isJ2ME() || J2MEUtil.isHTML()) {
            this.animationInterface = NullAnimationFactory.getFactoryInstance().getInstance(0);
        } else {
            this.animationInterface = new RectangleFilledAnimation(this.rectangle.getWidth(), this.rectangle.getHeight(), BasicColorFactory.getInstance().TRANSPARENT_GREY);
        }
        this.init(rectangle);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        final features : Features = Features.getInstance();
        final isOpenGL : Bool = features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL);
        this.drawStringUtil.updateMeasurement(graphics, this.label);
        var BORDER : Int = 0;
        if (J2MEUtil.isHTML() || isOpenGL) {
            BORDER = MyFontProcessor.defaultCharWidth(font) / 2;
        } else if (AndroidUtil.isAndroid() || J2MEUtil.isJ2SE() || SWTUtil.isSWT) {
            BORDER = MyFontProcessor.defaultCharWidth(font);
        } else {
            BORDER = MyFontProcessor.defaultCharWidth(font) * 2;
        }
        this.BORDER = BORDER;
        this.heightOffset = this.rectangle.getHeight() - (font.getHeight() * BasicPopupMenuPaintable.NAME.length());
        if (OpenGLFeatureUtil.getInstance().isAnyThreed()) {
            this.heightOffset -= font.getHeight() + 2;
            if (AndroidUtil.isAndroid()) {
                this.heightOffset = font.getHeight();
            } else {
                this.heightOffset -= font.getHeight() + 2;
            }
        }
        this.offset = (this.heightOffset >> 1) + ((SWTJOGLProcessor.getInstance().isJOGL() ? 4 : 0));
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    // throws Exception
    public function init(rectangle : Rectangle) : Void {
        this.rectangle = rectangle;
        final width : Int = this.rectangle.getWidth();
        final height : Int = this.rectangle.getHeight();
        if (J2MEUtil.isJ2ME() || J2MEUtil.isHTML()) {
        } else {
            final rectangleFilledAnimation : RectangleFilledAnimation = (cast this.animationInterface : RectangleFilledAnimation);
            rectangleFilledAnimation.setWidth(width);
            rectangleFilledAnimation.setHeight(height);
        }
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final point : GPoint = this.rectangle.getPoint();
        final x : Int = point.getX();
        final y : Int = point.getY();
        final width : Int = this.rectangle.getWidth();
        final height : Int = this.rectangle.getHeight();
        this.animationInterface.paintXY(graphics, x, y);
        this.basicSetColorUtil.setBasicColorP(graphics, this.foregroundBasicColor);
        this.drawStringUtil.paintVerticle(graphics, this.label, x + this.BORDER, y + this.offset, 0);
        graphics.drawRect(x, y, width, height);
    }

}

