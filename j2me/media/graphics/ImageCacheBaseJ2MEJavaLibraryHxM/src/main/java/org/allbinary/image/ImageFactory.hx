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

import jre.io.InputStream;
import javax.microedition.lcdui.Image;
import org.allbinary.MIDPUtil;

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
        return MIDPUtil.getInstance().createImageWH(width, height);
    }

    public function createImageFromInputStream(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            return this.createImageFromInputStream_Any_InputStream(args[0], args[1]);
        }
        if (args.length == 1) {
            return this.createImageFromInputStream_InputStream(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: createImageFromInputStream");
    }

    // throws Exception
    public function createImageFromInputStream_Any_InputStream(key : Any, inputStream : InputStream) : Image {
        final image : Image = MIDPUtil.getInstance().createImageFromInputStream(inputStream);
        return image;
    }

    // throws Exception
    public function createImageFromInputStream_InputStream(inputStream : InputStream) : Image {
        return MIDPUtil.getInstance().createImageFromInputStream(inputStream);
    }

    public function new() {
    }
}

