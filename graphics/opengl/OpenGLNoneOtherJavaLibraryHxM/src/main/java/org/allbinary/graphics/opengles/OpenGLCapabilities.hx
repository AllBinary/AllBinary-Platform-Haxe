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
package org.allbinary.graphics.opengles;

import org.allbinary.logic.string.StringUtil;

class OpenGLCapabilities {
    private static final instance : OpenGLCapabilities = new OpenGLCapabilities();
    public static function getInstance() : OpenGLCapabilities {
        return OpenGLCapabilities.instance;
    }

    public final VERSION_1_0 : String = "1.0";
    public final VERSION_1_1 : String = "1.1";
    public final VERSION_2_0 : String = "2.0";
    public final VERSION_3_0 : String = "3.0";
    public final VERSION_3_1 : String = "3.1";
    public final VERSION_3_2 : String = "3.2";
    public final VERSION_HIGHER_THAN_EXISTS : String = "999.999";
    private var glVersion : String = StringUtil.getInstance().EMPTY_STRING;
    public var shaderVersion : Int = 0;
    public var glInstanceVersion : String = StringUtil.getInstance().EMPTY_STRING;
    public var maxTextureSize : Int = 64;
    public function new() {
    }

    public function initCapabilities(gl : Any) : Void {
    }

    public function isGlExtensionDrawTexture() : Bool {
        return false;
    }

    public function getGlVersion() : String {
        return this.glVersion;
    }

    public function isVertexBufferObjectSupport() : Bool {
        return false;
    }

    public function isTextureSizeValid(widthAndHeight : Int) : Bool {
        return true;
    }

}

