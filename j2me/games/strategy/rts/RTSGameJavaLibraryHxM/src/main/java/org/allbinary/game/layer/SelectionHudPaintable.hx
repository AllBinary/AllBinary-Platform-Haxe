/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.InitUpdatePaintable;
import org.allbinary.input.motion.button.CommonButtons;
import org.allbinary.input.motion.button.TouchButtonLocationHelper;
import org.allbinary.logic.math.PrimitiveLongUtil;

class SelectionHudPaintable extends InitUpdatePaintable implements UpdateMyFontInterface {
    public final y : Int = CommonButtons.getInstance().STANDARD_BUTTON_SIZE + 17;
    private final primitiveLongUtil : PrimitiveLongUtil;
    public final updateMyFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    public var myFontProcessor : MyFontProcessor = updateMyFontProcessor;
    private var x : Int = 0;
    public var textX : Int = 0;
    public var imageX : Int = 0;
    private var basicColor : BasicColor = BasicColorFactory.getInstance().BLACK;
    private var color : Int = 0;
    private var width : Int = 0;
    private var height : Int = 0;
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    private var animationInterface : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
    private final backgroundColor : Int = Std.int(BasicColorFactory.getInstance().GREY);
    public function new() {
        super();
        this.update();
        this.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final commonButtons : CommonButtons = CommonButtons.getInstance();
        final font : Font = graphics.getFont();
        this.setHeight(commonButtons.STANDARD_BUTTON_SIZE + font.getHeight());
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function update() : Void {
        final commonButtons : CommonButtons = CommonButtons.getInstance();
        final touchButtonLocationHelper : TouchButtonLocationHelper = new TouchButtonLocationHelper();
        final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        this.x = commonButtons.STANDARD_BUTTON_SIZE + touchButtonLocationHelper.getColumnsRemainderHalf();
        this.textX = this.getX() + 4;
        this.width = displayInfoSingleton.getLastWidth() - this.getX() * 2;
        this.imageX = this.getWidth() + touchButtonLocationHelper.getColumnsRemainderHalf() - 10;
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function updateSelectionInfo() : Void {
    }

    public function updateInfo() : Void {
    }

    public function getPrimitiveLongUtil() : PrimitiveLongUtil {
        return this.primitiveLongUtil;
    }

    public function setAnimationInterface(animationInterface : Animation) : Void {
        this.animationInterface = animationInterface;
    }

    public function getAnimationInterface() : Animation {
        return this.animationInterface;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function getName() : String {
        return this.name;
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
        this.setColor(Std.int(basicColor));
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function setColor(color : Int) : Void {
        this.color = color;
    }

    public function getColor() : Int {
        return this.color;
    }

    public function getWidth() : Int {
        return this.width;
    }

    public function setHeight(height : Int) : Void {
        this.height = height;
    }

    public function getHeight() : Int {
        return this.height;
    }

    public function getX() : Int {
        return this.x;
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        graphics.setColor(this.backgroundColor);
        graphics.drawRect(this.getX(), this.y, this.getWidth(), this.getHeight());
        graphics.setColor(this.getColor());
        graphics.drawString(this.getName(), this.textX, this.y, 0);
    }

}

