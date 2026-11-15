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
package org.allbinary.device;


class OpenGLESGraphicsCompositeFactory {
    private static final instance : OpenGLESGraphicsCompositeFactory = new OpenGLESGraphicsCompositeFactory();
    public static function getInstance() : OpenGLESGraphicsCompositeFactory {
        return OpenGLESGraphicsCompositeFactory.instance;
    }

    private var openGLESGraphicsFactory : OpenGLESGraphicsFactory = new OpenGLESGraphicsFactory();
    public function set(openGLESGraphicsFactory : OpenGLESGraphicsFactory) : Void {
        this.openGLESGraphicsFactory = openGLESGraphicsFactory;
    }

    public function get() : OpenGLESGraphicsFactory {
        return this.openGLESGraphicsFactory;
    }

    public function new() {
    }
}

