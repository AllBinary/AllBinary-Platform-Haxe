/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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
package org.allbinary;

import jre.io.IOException;
import jre.io.InputStream;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.Item;
import javax.microedition.media.Manager;
import javax.microedition.media.MediaException;
import javax.microedition.media.Player;

//like microemu-playn, so the languages without overloading can be generated. J2ME uses the MIDP overloads.
class MIDPUtil {
    private static final instance : MIDPUtil = new MIDPUtil();
    public static function getInstance() : MIDPUtil {
        return MIDPUtil.instance;
    }

    public function createImageWH(width : Int, height : Int) : Image {
        return Image.createImage(width, height);
    }

    public function createImageFromByteArray(imageData : haxe.ds.Vector<Int>, imageOffset : Int, imageLength : Int) : Image {
        return Image.createImage(imageData, imageOffset, imageLength);
    }

    // throws IOException
    public function createImageFromInputStream(inputStream : InputStream) : Image {
        return Image.createImage(inputStream);
    }

    // throws IOException, MediaException
    public function createPlayerFromInputStream(inputStream : InputStream, type : String) : Player {
        return Manager.createPlayer(inputStream, type);
    }

    public function appendItem(form : Form, item : Item) : Int {
        return form.append(item);
    }

    public function new() {
    }
}

