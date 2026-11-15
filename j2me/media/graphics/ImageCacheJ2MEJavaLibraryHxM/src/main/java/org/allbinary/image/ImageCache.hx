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
package org.allbinary.image;

import jre.io.InputStream;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.NullImage;
import org.allbinary.J2MEUtil;
import org.allbinary.TsUtil;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.gd.resource.GDResources;
import org.allbinary.logic.ABSystemWrapper;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.system.Memory;

class ImageCache extends ImageCacheBase {
    public static final NULL_IMAGE_CACHE : ImageCache = new ImageCache();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final tsUtil : TsUtil = TsUtil.getInstance();
    public function new() {
        super();
    }

    public function addListener(renderer : Any) : Void {
    }

    public function getIndex(key : Any) : Int {
        final gdResources : GDResources = GDResources.getInstance();
        final resourceStringArray : haxe.ds.Vector<String> = gdResources.resourceStringArray;
        final size : Int = resourceStringArray.length;
        for (index in 0...size) {
            if (resourceStringArray[index] == key) {
                return index;
            }
        }
        this.logUtil.putF(Std.string(new StringMaker().append("unable to find key: ").append(StringUtil.getInstance().toString(key))), this, this.commonStrings.RUN);
        throw new jre.lang.JavaException();
    }

    // throws Exception
    public override function get(caller : String, width : Int, height : Int) : Image {
        var foundIndex : Int = this.getIndexWH(width, height);
        var image : Image = this.getFromAvailable(foundIndex, width, height);
        if (image == NullImage.NULL_IMAGE) {
            this.volume += width * height;
            if (this.volume > 32000) {
                this.tsUtil.gc();
                this.volume = 0;
            }
            image = this.createImage(caller, width, height);
            final widths : haxe.ds.Vector<Int> = this.widths;
            if (this.nextIndex > widths.length - 1) {
                if (foundIndex == -1) {
                    foundIndex = this.nextIndex;
                    widths[this.nextIndex] = width;
                    this.heights[this.nextIndex] = height;
                    this.nextIndex++;
                }
                this.listOfList[foundIndex].add(image);
            }
        }
        return image;
    }

    // throws Exception
    public override function getWithKey(key : Any) : Image {
        var image : Image = this.getImage(key);
        if (image == NullImage.NULL_IMAGE) {
            final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
            final resourceInputStream : InputStream = resourceUtil.getResourceAsStream((cast key : String));
            if (resourceInputStream == null) {
                throw new jre.lang.JavaException(Std.string(new StringMaker().append("Image resource is not available for key: ").append(StringUtil.getInstance().toString(key))));
            }
            try {
                image = this.createImageFromInputStream(key, resourceInputStream);
            } catch (e : haxe.Exception) {
                this.logUtil.put("Exception: Trying Again After GC", this, this.commonStrings.GET, e);
                this.logUtil.putF(Std.string(new StringMaker().append("InputStream: ").append(StringUtil.getInstance().toString(resourceInputStream))), this, this.commonStrings.GET);
                this.tsUtil.gc();
                this.tsUtil.gc();
                this.logUtil.putF(Memory.getInfo(), this, this.commonStrings.GET);
                Sys.sleep(haxe.Int64.toInt(100) / 1000);
                image = this.createImageFromInputStream(key, resourceInputStream);
            }
            if (J2MEUtil.isHTML()) {
            } else {
                resourceInputStream.close();
            }
            this.hashtable.put(key, image);
        }
        return image;
    }

    // throws Exception
    public function loadImageForAnimation() : Void {
    }

    public function progressEnded() : Void {
    }

    public function runTask() : Void {
    }

    public function isLazy() : Bool {
        return false;
    }

}

