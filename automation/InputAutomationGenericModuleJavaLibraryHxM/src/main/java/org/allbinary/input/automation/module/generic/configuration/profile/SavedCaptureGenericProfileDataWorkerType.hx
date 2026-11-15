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
package org.allbinary.input.automation.module.generic.configuration.profile;

import org.allbinary.input.media.image.InputImageType;

class SavedCaptureGenericProfileDataWorkerType extends GenericProfileDataWorkerType {
    public static var SAVED_CAPTURE : SavedCaptureGenericProfileDataWorkerType = new SavedCaptureGenericProfileDataWorkerType("Saved " + InputImageType.CAPTURE.getName(), "c:\\share\\captures\\2\\", 100);
    private var path : String = null;
    private var lastFrame : Int = 0;
    public function new(name : String, path : String, lastFrame : Int) {
        super(name);
        this.setPath(path);
        this.setLastFrame(lastFrame);
    }

    public function getPath() : String {
        return this.path;
    }

    public function setPath(path : String) : Void {
        this.path = path;
    }

    public function getLastFrame() : Int {
        return this.lastFrame;
    }

    public function setLastFrame(lastFrame : Int) : Void {
        this.lastFrame = lastFrame;
    }

}

