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
package org.allbinary.graphics.opengles.shader;

//import javax.microedition.khronos.egl.EGLConfig;
//import javax.microedition.khronos.opengles.GL10;
import org.allbinary.graphics.opengles.renderer.RendererStrings;
import org.allbinary.string.CommonStrings;

class ShaderUpdater {
    private static final instance : ShaderUpdater = new ShaderUpdater();
    public static function getInstance() : ShaderUpdater {
        return ShaderUpdater.instance;
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final rendererStrings : RendererStrings = RendererStrings.getInstance();
    public function onSurfaceCreated(gl : GL10, eglConfig : EGLConfig) : Void {
    }

    public function new() {
    }
}

