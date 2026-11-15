/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.image;

//import java.io.InputStream;
//import javax.microedition.lcdui.Image;

//ImageCacheBaseJavaLibrary - J2ME
class ImageFactory {
    private static final instance : ImageFactory = new ImageFactory();
    public static function getInstance() : ImageFactory {
        return ImageFactory.instance;
    }

    // throws Exception
    public function createImageUrl(url : String) : Image {
        return Image.createImage(url);
    }

    // throws Exception
    public function createImage(caller : String, width : Int, height : Int) : Image {
        return Image.createImage(width, height);
    }

    // throws Exception
    public function createImageFromInputStream(key : Any, inputStream : InputStream) : Image {
        final image : Image = Image.createImage(inputStream);
        return image;
    }

    // throws Exception
    public function createImageFromInputStream(inputStream : InputStream) : Image {
        return Image.createImage(inputStream);
    }

    public function new() {
    }
}

