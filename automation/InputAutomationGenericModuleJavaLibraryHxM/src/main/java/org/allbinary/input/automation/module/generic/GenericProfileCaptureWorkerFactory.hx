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
package org.allbinary.input.automation.module.generic;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType;
import org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType;
import org.allbinary.input.media.image.capture.CaptureWorkerInterface;
import org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker;

class GenericProfileCaptureWorkerFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(genericProfile : GenericProfile) : CaptureWorkerInterface {
        final vector : BasicArrayList = genericProfile.getGenericProfileDataWorkerTypeVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var genericProfileDataWorkerType : GenericProfileDataWorkerType = (cast vector.get(index) : GenericProfileDataWorkerType);
            if (genericProfileDataWorkerType == GenericProfileDataWorkerType.SCREEN_CAPTURE) {
                return new ScreenCaptureImagesWorker();
            } else if (genericProfileDataWorkerType == GenericProfileDataWorkerType.SAVED_CAPTURE) {
                return new SavedCaptureImagesWorker((cast genericProfileDataWorkerType : SavedCaptureGenericProfileDataWorkerType));
            }
        }
        throw new haxe.Exception("No CaptureWorkerInterface specified in GenericProfile");
    }

}

