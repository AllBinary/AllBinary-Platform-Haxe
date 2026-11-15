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
package org.allbinary.image.opengles;

//import java.io.InputStream;
//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.device.NullGL10;
import org.allbinary.graphics.opengles.renderer.AllBinaryRendererBase3;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.image.PreResourceImageUtil;
import org.allbinary.thread.SynchObject;

//ImageCacheOpenGLESJavaLibrary
class OpenGLImageCache extends ImageCache {
    private final imageCache : ImageCache = ImageCacheFactory.getInstance();
    private final preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
    private var gl : GL10 = NullGL10.NULL_GL10;
    private final lock : SynchObject = new SynchObject();
    private final list : BasicArrayList = new BasicArrayListD();
    private var renderer : AllBinaryRendererBase3 = new AllBinaryRendererBase3();
    public function new() {
        super();
    }

    public override function addListener(renderer : Any) : Void {
        this.renderer = (cast renderer : AllBinaryRendererBase3);
    }

    // throws Exception
    public function update(gl : GL10) : Void {
        this.gl = gl;
        // synchronized (this.lock)
        {
            {
                var index : Int = this.list.size() - 1;
                while (index >= 0) {
                var openGLESImage : OpenGLESImage = ((cast this.list.objectArray[index] : OpenGLESImage));
                if (openGLESImage != OpenGLESImage.NULL_OPENGL_IMAGE) {
                    openGLESImage.set(gl);
                }
                    index--;
                }
            }
        }
    }

    // throws Exception
    public override function createImage(caller : String, width : Int, height : Int) : Image {
        var textureSize : Int = width;
        if (height > width) {
            textureSize = height;
        }
        while ((textureSize % 4) != 0) {
            textureSize++;
        }
        width = textureSize;
        height = textureSize;
        final image2 : Image = this.imageCache.get(caller, width, height);
        final image : Image = this.preResourceImageUtil.encapsulate(image2);
        // synchronized (this.lock)
        {
            if (image != NullImage.NULL_IMAGE) {
                this.list.add(image);
            }
        }
        return image;
    }

    // throws Exception
    public override function createImageFromInputStream(key : Any, inputStream : InputStream) : Image {
        final cachedImage : Image = this.imageCache.getWithKey(key);
        final image : Image = this.preResourceImageUtil.encapsulate(cachedImage);
        // synchronized (this.lock)
        {
            if (image != NullImage.NULL_IMAGE) {
                this.list.add(image);
            }
        }
        return image;
    }

    public function getGlP() : GL10 {
        return this.gl;
    }

    public override function init(image : Image) : Void {
        try {
            // synchronized (this.lock)
            {
                if (this.list.contains(image)) {
                    throw new haxe.Exception();
                }
                this.list.add(image);
            }
            this.renderer.add(image);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
        }
    }

}

