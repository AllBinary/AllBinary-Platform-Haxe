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

import jsinterop.annotations.JsType;
import org.allbinary.logic.string.StringUtil;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsProperty;

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

    public final NULL_COLOR : BasicColor = this.createInstanceARGB(255, 255, 255, 255, "null color");
    public final TAN : BasicColor = this.createInstance(0xE9D8B5);
    public final SKIN_PINK : BasicColor = this.createInstance(0xFDCECE);
    public final RED : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFF0000, "red");
    public final LIGHT_RED : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFFA0A0, "light red");
    public final DARK_GREEN : BasicColor = this.createInstance(0x00FF00);
    public final GREEN : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x00DD00, "green");
    public final LIGHT_GREEN : BasicColor = this.createInstance(0x007700);
    public final PURPLE : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x400040, "purple");
    public final BLUE : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x0000FF, "blue");
    public final LIGHT_BLUE : BasicColor = this.createInstance(0x00aaff);
    public final VERY_LIGHT_BLUE : BasicColor = this.createInstance(0x000033);
    public final PUCE : BasicColor = this.createInstance(0xFF00AA);
    public final AQUA : BasicColor = this.createInstance(0x00FFFF);
    public final YELLOW : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFFFF00, "yellow");
    public final PINK : BasicColor = this.createInstance(0xFF00FF);
    public final BLACK : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x000000, "black");
    public final GREY : BasicColor = this.createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xAAAAAA, "grey");
    public final LIGHT_GREY : BasicColor = this.createInstance(0xC0C0C0);
    public final DARK_GREY : BasicColor = this.createInstance(0x404040);
    public final ORANGE : BasicColor = this.createInstance(0xe07718);
    public final BROWN : BasicColor = this.createInstance(0x956B00);
    public final WHITE : BasicColor = this.createInstance(0xFFFFFF);
    public final TRANSPARENT_COLOR : BasicColor = this.createInstanceAN(0x00000000, 0x000000, StringUtil.getInstance().EMPTY_STRING);
    public final TRANSPARENT_GREY : BasicColor = this.createInstanceAN(0x52000000, 0xECECEC, StringUtil.getInstance().EMPTY_STRING);
    public final TRANSPARENT_BLACK : BasicColor = this.createInstanceAN(0x52000000, 0x000000, StringUtil.getInstance().EMPTY_STRING);
    public final TRANSPARENT_RED : BasicColor = this.createInstanceAN(0x52000000, 0xFF0000, StringUtil.getInstance().EMPTY_STRING);
    public final CLEAR_COLOR : BasicColor = this.BLACK;
    public final BORDER_COLOR : BasicColor = this.WHITE;
    public function new() {
    }
}

