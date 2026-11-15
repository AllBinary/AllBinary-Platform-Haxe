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
package org.allbinary.media.image;

//import javax.microedition.lcdui.Image;
import org.allbinary.image.GameFeatureImageCacheFactory;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.HashtableUtil;
import org.microemu.device.playn.PlaynImage;

class ImageCompleteUtil {
    private static final instance : ImageCompleteUtil = new ImageCompleteUtil();
    public static function getInstance() : ImageCompleteUtil {
        return ImageCompleteUtil.instance;
    }

    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(18000);
    private final allTimeDelayHelper : TimeDelayHelper = new TimeDelayHelper(120000);
    // throws Exception
    public function waitForImage(image : Image, name : String) : Void {
        this.timeDelayHelper.setStartTime();
        this.waitForATime(image, name, this.timeDelayHelper);
    }

    // throws Exception
    public function isReady(image : Image, name : String, timeDelayHelper : TimeDelayHelper) : Bool {
        var playnImage : PlaynImage = (cast image : PlaynImage);
        if (!playnImage.getImage().isReady() && playnImage.getImage().width() + playnImage.getImage().height() == 0) {
            if (timeDelayHelper.isTime()) {
                throw new haxe.Exception("isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " + name);
            }
            return false;
        }
        return true;
    }

    // throws Exception
    private function waitForATime(image : Image, name : String, timeDelayHelper : TimeDelayHelper) : Void {
        var playnImage : PlaynImage = (cast image : PlaynImage);
        while (!playnImage.getImage().isReady() && playnImage.getImage().width() + playnImage.getImage().height() == 0) {
            if (timeDelayHelper.isTime()) {
                throw new haxe.Exception("waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " + name);
            }
        }
    }

    // throws Exception
    public function waitForAll() : Void {
        this.allTimeDelayHelper.setStartTime();
        var hashtable : Hashtable = GameFeatureImageCacheFactory.getInstance().getHashtable();
        var objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(hashtable);
        var size : Int = objectArray.length;
        PreLogUtil.put("Total: " + size, this, "waitForAll");
        for (index in 0...size) {
            this.waitForATime((cast hashtable.get(objectArray[index]) : Image), (cast objectArray[index] : String), this.allTimeDelayHelper);
        }
    }

    public function new() {
    }
}

