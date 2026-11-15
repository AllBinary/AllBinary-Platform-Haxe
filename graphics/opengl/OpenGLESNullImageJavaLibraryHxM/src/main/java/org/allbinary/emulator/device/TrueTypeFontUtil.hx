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
package org.allbinary.emulator.device;

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.image.opengles.OpenGLESImage;

class TrueTypeFontUtil extends TrueTypeFontUtilBase {
    private static final instance : TrueTypeFontUtil = new TrueTypeFontUtil();
    public static function getInstance() : TrueTypeFontUtil {
        return TrueTypeFontUtil.instance;
    }

    public var fontImage : OpenGLESImage = OpenGLESImage.NULL_OPENGL_IMAGE;
    public function new() {
        super(1);
    }

    public override function getAsTextureSize(textureSize : Int) : Int {
        throw new haxe.Exception();
    }

    public override function getCellSize(cellSize : Int) : Int {
        throw new haxe.Exception();
    }

    public function getFontBitmap(filename : String, fontSize : Int, cellSize : Int, basicColor : BasicColor) : Image {
        throw new haxe.Exception();
    }

    public function saveFontAtlasAsFile() : Void {
    }

    public function getFontBitmapGL(gl : GL10, filename : String, cellSize : Int, basicColor : BasicColor) : Image {
        throw new haxe.Exception();
    }

    public function getFontWidths(filename : String, fontSize : Int) : haxe.ds.Vector<Int> {
        throw new haxe.Exception();
    }

}

