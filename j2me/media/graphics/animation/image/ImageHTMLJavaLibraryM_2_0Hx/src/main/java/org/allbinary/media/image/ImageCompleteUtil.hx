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
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;
import org.microemu.device.playn.PlaynImage;
import playn.core.CoreImage;

class ImageCompleteUtil {
    private static final instance : ImageCompleteUtil = new ImageCompleteUtil();
    public static function getInstance() : ImageCompleteUtil {
        return ImageCompleteUtil.instance;
    }

    public final ISREADY : String = "isReady";
    // throws Exception
    public function waitForImage(image : Image, name : String) : Void {
    }

    private final COMPLETE : String = "Image loading complete for: ";
    // throws Exception
    public function isReady(image : Image, name : String, timeDelayHelper : TimeDelayHelper) : Bool {
        final playnImage : PlaynImage = (cast image : PlaynImage);
        final playnCoreImage : CoreImage = (cast playnImage.getImage() : CoreImage);
        if (!playnCoreImage.isReady() || playnCoreImage.width() + playnCoreImage.height() <= 0) {
            this.handleTimeout(name);
            return false;
        }
        if (!image.isReady()) {
            image.init(image.getImage());
            if (!image.isReady()) {
                PreLogUtil.put("Waiting for Not Ready Image: " + image.getName(), this, this.ISREADY);
            }
        }
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        PreLogUtil.put(this.COMPLETE + image.getName(), this, commonStrings.SUCCESS);
        return true;
    }

    // throws Exception
    public function handleTimeout(name : String) : Void {
    }

    // throws Exception
    public function waitForAll() : Void {
    }

    public function new() {
    }
}

