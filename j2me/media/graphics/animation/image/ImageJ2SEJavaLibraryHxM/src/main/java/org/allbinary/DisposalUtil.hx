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
import org.eclipse.swt.graphics.Resource;

class DisposalUtil {
    private static final instance : DisposalUtil = new DisposalUtil();
    public static function getInstance() : DisposalUtil {
        return DisposalUtil.instance;
    }

    public function disposeImage(image : Image) : Void {
    }

    public function disposeResource(resource : Resource) : Void {
        if (!resource.isDisposed()) {
            resource.dispose();
        }
    }

    public function new() {
    }
}

