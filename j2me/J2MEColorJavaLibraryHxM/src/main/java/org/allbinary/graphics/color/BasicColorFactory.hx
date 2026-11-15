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
package org.allbinary.graphics.color;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.string.StringUtil;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsProperty;

class BasicColorFactory {
    private static final instance : BasicColorFactory = new BasicColorFactory();
    public static function getInstance() : BasicColorFactory {
        return BasicColorFactory.instance;
    }

    public function createInstance(value : Int) : BasicColor {
        return new BasicColor(BasicColorUtil.getInstance().ALPHA, value, StringUtil.getInstance().EMPTY_STRING);
    }

    public function createInstanceA(alphaValue : Int, value : Int) : BasicColor {
        return new BasicColor(alphaValue, value, StringUtil.getInstance().EMPTY_STRING);
    }

    public function createInstanceAN(alphaValue : Int, value : Int, name : String) : BasicColor {
        return new BasicColor(alphaValue, value, name);
    }

    public function createInstanceARGB(alphaValue : Int, r : Int, g : Int, b : Int, name : String) : BasicColor {
        final ALPHA_MASK : Int = 0xFF000000;
        return new BasicColor(alphaValue, ((alphaValue << 24) & ALPHA_MASK) + ((r << 16) & 0x00FF0000) + ((g << 8) & 0x0000FF00) + (b & 0x000000FF), StringUtil.getInstance().EMPTY_STRING);
    }

    public final NULL_COLOR : BasicColor;
    public final TAN : BasicColor;
    public final SKIN_PINK : BasicColor;
    public final RED : BasicColor;
    public final LIGHT_RED : BasicColor;
    public final DARK_GREEN : BasicColor;
    public final GREEN : BasicColor;
    public final LIGHT_GREEN : BasicColor;
    public final PURPLE : BasicColor;
    public final BLUE : BasicColor;
    public final LIGHT_BLUE : BasicColor;
    public final VERY_LIGHT_BLUE : BasicColor;
    public final PUCE : BasicColor;
    public final AQUA : BasicColor;
    public final YELLOW : BasicColor;
    public final PINK : BasicColor;
    public final BLACK : BasicColor;
    public final GREY : BasicColor;
    public final LIGHT_GREY : BasicColor;
    public final DARK_GREY : BasicColor;
    public final ORANGE : BasicColor;
    public final BROWN : BasicColor;
    public final WHITE : BasicColor;
    public final TRANSPARENT_COLOR : BasicColor;
    public final TRANSPARENT_GREY : BasicColor;
    public final TRANSPARENT_BLACK : BasicColor;
    public final TRANSPARENT_RED : BasicColor;
    public final CLEAR_COLOR : BasicColor;
    public final BORDER_COLOR : BasicColor;
    public function new() {
        this.NULL_COLOR = this.createInstanceARGB(255, 255, 255, 255, "null color");
        this.TAN = this.createInstance(0xE9D8B5);
        this.SKIN_PINK = this.createInstance(0xFDCECE);
        this.RED = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFF0000, "red");
        this.LIGHT_RED = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFFA0A0, "light red");
        this.DARK_GREEN = this.createInstance(0x00FF00);
        this.GREEN = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x00DD00, "green");
        this.LIGHT_GREEN = this.createInstance(0x007700);
        this.PURPLE = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x400040, "purple");
        this.BLUE = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x0000FF, "blue");
        this.LIGHT_BLUE = this.createInstance(0x00aaff);
        this.VERY_LIGHT_BLUE = this.createInstance(0x000033);
        this.PUCE = this.createInstance(0xFF00AA);
        this.AQUA = this.createInstance(0x00FFFF);
        this.YELLOW = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFFFF00, "yellow");
        this.PINK = this.createInstance(0xFF00FF);
        this.BLACK = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x000000, "black");
        this.GREY = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xAAAAAA, "grey");
        this.LIGHT_GREY = this.createInstance(0xC0C0C0);
        this.DARK_GREY = this.createInstance(0x404040);
        this.ORANGE = this.createInstance(0xe07718);
        this.BROWN = this.createInstance(0x956B00);
        this.WHITE = this.createInstance(0xFFFFFF);
        this.TRANSPARENT_COLOR = this.createInstanceAN(0x00000000, 0x000000, StringUtil.getInstance().EMPTY_STRING);
        this.TRANSPARENT_GREY = this.createInstanceAN(0x52000000, 0xECECEC, StringUtil.getInstance().EMPTY_STRING);
        this.TRANSPARENT_BLACK = this.createInstanceAN(0x52000000, 0x000000, StringUtil.getInstance().EMPTY_STRING);
        this.TRANSPARENT_RED = this.createInstanceAN(0x52000000, 0xFF0000, StringUtil.getInstance().EMPTY_STRING);
        this.CLEAR_COLOR = this.BLACK;
        this.BORDER_COLOR = this.WHITE;
    }
}

