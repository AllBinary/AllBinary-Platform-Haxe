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
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class ImageCacheBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final imageFactory : ImageFactory = ImageFactory.getInstance();
    public final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public final SIZE : Int = 128;
    public final widths : haxe.ds.Vector<Int>;
    public final heights : haxe.ds.Vector<Int>;
    public final listOfList : haxe.ds.Vector<BasicArrayList>;
    public final availableListOfList : haxe.ds.Vector<BasicArrayList>;
    public var volume : Int = 0;
    public var nextIndex : Int = 0;
    public function new() {
        this.widths = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.SIZE) 0]);
        this.heights = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.SIZE) 0]);
        this.listOfList = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.SIZE) null]);
        this.availableListOfList = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.SIZE) null]);
        {
            var index : Int = this.listOfList.length - 1;
            while (index >= 0) {
            this.listOfList[index] = new BasicArrayListD();
                index--;
            }
        }
        {
            var index : Int = this.availableListOfList.length - 1;
            while (index >= 0) {
            this.availableListOfList[index] = new BasicArrayListD();
                index--;
            }
        }
    }

    public function getImage(resourceId : Any) : Image {
        final imageCanBeNull : Any = this.hashtable.get(resourceId);
        if (imageCanBeNull == null) {
            return NullImage.NULL_IMAGE;
        }
        return (cast imageCanBeNull : Image);
    }

    public function releaseAll() : Void {
        {
            var index : Int = this.listOfList.length - 1;
            while (index >= 0) {
            this.availableListOfList[index].clear();
            this.availableListOfList[index].addAllList(this.listOfList[index]);
                index--;
            }
        }
        this.logUtil.putF(Std.string(new StringMaker().append("ImageCache: ").append(Std.string(this))), this, "releaseAll");
    }

    public function getIndexWH(width : Int, height : Int) : Int {
        var foundIndex : Int = -1;
        var size : Int = this.widths.length;
        for (index in 0...size) {
            if (this.widths[index] == width && this.heights[index] == height) {
                foundIndex = index;
                return foundIndex;
            }
        }
        return foundIndex;
    }

    public function getFromAvailable(foundIndex : Int, width : Int, height : Int) : Image {
        if (foundIndex != -1) {
            if (this.availableListOfList[foundIndex].size() > 0) {
                var list : BasicArrayList = this.availableListOfList[foundIndex];
                return (cast list.removeAt(list.size() - 1) : Image);
            }
        }
        return NullImage.NULL_IMAGE;
    }

    public function get(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            return this.get_String_int_int(args[0], args[1], args[2]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: get");
    }

    // throws Exception
    public function get_String_int_int(caller : String, width : Int, height : Int) : Image {
        throw new jre.lang.JavaException();
    }

    // throws Exception
    public function getWithKey(key : Any) : Image {
        throw new jre.lang.JavaException();
    }

    public function createImage(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            return this.createImage_String_int_int(args[0], args[1], args[2]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: createImage");
    }

    // throws Exception
    public function createImage_String_int_int(caller : String, width : Int, height : Int) : Image {
        return this.imageFactory.createImage(caller, width, height);
    }

    // throws Exception
    public function createImageFromInputStream(key : Any, inputStream : InputStream) : Image {
        return this.imageFactory.createImageFromInputStream(key, inputStream);
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        {
            var index : Int = this.nextIndex - 1;
            while (index >= 0) {
            final width : Int = this.widths[index];
            final height : Int = this.heights[index];
            final total : Int = this.listOfList[index].size();
            final totalAvailable : Int = this.availableListOfList[index].size();
            stringBuffer.append(" w: ");
            stringBuffer.appendint(width);
            stringBuffer.append(" h: ");
            stringBuffer.appendint(height);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(CommonLabels.getInstance().TOTAL_LABEL);
            stringBuffer.appendint(total);
            stringBuffer.append(" available: ");
            stringBuffer.appendint(totalAvailable);
                index--;
            }
        }
        return Std.string(stringBuffer);
    }

    public function getHashtableP() : ABHashtable<Any, Any> {
        return this.hashtable;
    }

    public function init(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            this.init_Image(args[0]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: init");
    }

    public function init_Image(image : Image) : Void {
    }

    public function initProgress() : Void {
    }

}

