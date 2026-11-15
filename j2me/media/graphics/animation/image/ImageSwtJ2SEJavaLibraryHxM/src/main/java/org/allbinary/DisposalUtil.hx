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
package org.allbinary;

//import javax.microedition.lcdui.Image;
import org.allbinary.string.CommonStrings;
import org.eclipse.swt.graphics.Resource;
import org.microemu.device.swt.SwtMutableImage;

class DisposalUtil {
    private static final instance : DisposalUtil = new DisposalUtil();
    public static function getInstance() : DisposalUtil {
        return DisposalUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function disposeImage(image : Image) : Void {
        if (image == null) {
            return;
        }
        if (image.isMutable()) {
            final mutableImage : SwtMutableImage = (cast image : SwtMutableImage);
            this.disposeResource((cast mutableImage.getImage() : Resource));
        } else {
        }
    }

    public function disposeResource(resource : Resource) : Void {
        if (!resource.isDisposed()) {
            trace(this.commonStrings.CLOSE);
            resource.dispose();
        }
    }

    public function new() {
    }
}

