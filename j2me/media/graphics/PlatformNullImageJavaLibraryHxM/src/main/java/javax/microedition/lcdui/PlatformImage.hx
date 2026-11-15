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
package javax.microedition.lcdui;

import org.allbinary.logic.NullUtil;

//PlatformNullImageJavaLibrary
class PlatformImage {
    public function getImage(graphicsSurface2 : Any) : Any {
        return NullImage.NULL_IMAGE;
    }

    public function getSurfaceWidth(graphicsSurface2 : Any, width : Int) : Int {
        return width;
    }

    public function getSurfaceHeight(graphicsSurface2 : Any, height : Int) : Int {
        return height;
    }

    public function getWidth(image : Image, width : Int) : Int {
        return width;
    }

    public function getHeight(image : Image, height : Int) : Int {
        return height;
    }

    public function getGraphics(graphicsSurface : Any, width : Int, height : Int, image : Image) : javax.microedition.lcdui.Graphics {
        throw new haxe.Exception();
    }

    public function drawImage(image : Image, x : Int, y : Int, anchor : Int, g2 : javax.microedition.lcdui.Graphics, g : Any) : Void {
    }

    public function drawRegion(image : Image, x_src : Int, y_src : Int, width : Int, height : Int, transform : Int, x_dst : Int, y_dst : Int, anchor : Int, g : javax.microedition.lcdui.Graphics) : Void {
    }

    public function getRGB(argb : haxe.ds.Vector<Int>, offset : Int, scanlength : Int, x : Int, y : Int, width : Int, height : Int, image : Image) : Void {
    }

    public function setRGB(argb : haxe.ds.Vector<Int>, offset : Int, scanlength : Int, x : Int, y : Int, width : Int, height : Int, image : Image) : Void {
    }

    public function getData(image : Image) : haxe.ds.Vector<Int> {
        return NullUtil.getInstance().NULL_INT_ARRAY;
    }

    public function new() {
    }
}

