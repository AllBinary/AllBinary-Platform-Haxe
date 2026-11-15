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

//import java.io.InputStream;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.TsUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.gd.resource.GDResources;
import org.allbinary.logic.ABSystemWrapper;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.system.Memory;

class ImageCache extends ImageCacheBase {
    public static final NULL_IMAGE_CACHE : ImageCache = new ImageCache();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final systemWrapper : ABSystemWrapper = ABSystemWrapper.getInstance();
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
        this.logUtil.putF(new StringMaker().append("unable to find key: ").append(StringUtil.getInstance().toString(key)).toString(), this, this.commonStrings.RUN);
        throw new haxe.Exception();
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
            if (foundIndex == -1) {
                foundIndex = this.nextIndex;
                this.widths[this.nextIndex] = width;
                this.heights[this.nextIndex] = height;
                this.nextIndex++;
            }
            this.listOfList[foundIndex].add(image);
        }
        return image;
    }

    // throws Exception
    public override function getWithKey(key : Any) : Image {
        final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
        final resourceId : Null<Int> = resourceUtil.getResourceId((cast key : String));
        var image : Image = this.getImage(resourceId);
        if (image == NullImage.NULL_IMAGE) {
            final inputStream : InputStream = resourceUtil.getResourceAsStream((cast key : String));
            try {
                this.logUtil.putF(Memory.getInfo(), this, this.commonStrings.GET);
                image = this.createImageFromInputStream(key, inputStream);
            } catch (e : haxe.Exception) {
                this.logUtil.put("Exception: Trying Again After GC", this, this.commonStrings.GET, e);
                this.logUtil.putF(new StringMaker().append("InputStream: ").append(StringUtil.getInstance().toString(inputStream)).toString(), this, this.commonStrings.GET);
                this.tsUtil.gc();
                this.tsUtil.gc();
                this.logUtil.putF(Memory.getInfo(), this, this.commonStrings.GET);
                Sys.sleep(haxe.Int64.toInt(100) / 1000);
                image = this.createImageFromInputStream(key, inputStream);
            }
            inputStream.close();
            this.hashtable.put(resourceId, image);
        }
        return image;
    }

    public function runTask() : Void {
    }

    public function isLazy() : Bool {
        return false;
    }

}

