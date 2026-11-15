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
package org.allbinary.media.image;

//import javax.microedition.lcdui.Image;
import org.allbinary.image.GameFeatureImageCacheFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.HashtableUtil;
import org.microemu.device.playn.PlaynImage;

class ImageWaitCompleteUtil extends ImageCompleteUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(18000);
    private final allTimeDelayHelper : TimeDelayHelper = new TimeDelayHelper(120000);
    public function new() {
        super();
    }

    // throws Exception
    public override function waitForImage(image : Image, name : String) : Void {
        this.timeDelayHelper.setStartTimeTNT();
        this.waitForATime(image, name, this.timeDelayHelper);
    }

    // throws Exception
    public function handleTimeout(name : String) : Void {
        if (this.timeDelayHelper.isTimeTNT()) {
            throw new haxe.Exception("isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " + name);
        }
    }

    // throws Exception
    private function waitForATime(image : Image, name : String, timeDelayHelper : TimeDelayHelper) : Void {
        final playnImage : PlaynImage = (cast image : PlaynImage);
        final playnCoreImage : playn.core.Image = (cast playnImage.getImage() : playn.core.Image);
        while (!playnCoreImage.isReady() || playnCoreImage.width() + playnCoreImage.height() <= 0) {
            if (timeDelayHelper.isTimeTNT()) {
                throw new haxe.Exception("waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " + name);
            }
        }
        if (!image.isReady()) {
            image.init(image.getImage());
        }
    }

    // throws Exception
    public function waitForAll() : Void {
        this.allTimeDelayHelper.setStartTimeTNT();
        final hashtable : ABHashtable<Any, Any> = GameFeatureImageCacheFactory.getInstance().getHashtableP();
        final objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(hashtable);
        final size : Int = objectArray.length;
        PreLogUtil.put("Image Total: " + size, this, "waitForAll");
        for (index in 0...size) {
            this.waitForATime((cast hashtable.get(objectArray[index]) : Image), (cast objectArray[index] : String), this.allTimeDelayHelper);
        }
    }

}

