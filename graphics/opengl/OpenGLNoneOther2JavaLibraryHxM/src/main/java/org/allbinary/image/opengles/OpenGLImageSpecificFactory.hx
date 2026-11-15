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
package org.allbinary.image.opengles;

import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class OpenGLImageSpecificFactory {
    private static final instance : OpenGLImageSpecificFactory = new OpenGLImageSpecificFactory();
    public var updating : Bool = false;
    public static function getInstance() : OpenGLImageSpecificFactory {
        return OpenGLImageSpecificFactory.instance;
    }

    public function new() {
    }
}

