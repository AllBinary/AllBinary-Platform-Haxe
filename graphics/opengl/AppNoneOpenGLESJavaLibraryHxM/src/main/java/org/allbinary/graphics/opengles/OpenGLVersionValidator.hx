/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.graphics.opengles;

import org.allbinary.graphics.opengles.shader.ShaderComposite;

class OpenGLVersionValidator {
    private static final instance : OpenGLVersionValidator = new OpenGLVersionValidator();
    public static function getInstance() : OpenGLVersionValidator {
        return OpenGLVersionValidator.instance;
    }

    public function isGL31OrHigher() : Bool {
        return false;
    }

    public function isAvailable(glVersionRequired : String) : Bool {
        return false;
    }

    public function setShaderComposite(shaderComposite : ShaderComposite, anyType : Any) : Void {
    }

    public var EGL_CONTEXT_CLIENT_VERSION_VALUE : Int = -1;
    public function new() {
    }
}

