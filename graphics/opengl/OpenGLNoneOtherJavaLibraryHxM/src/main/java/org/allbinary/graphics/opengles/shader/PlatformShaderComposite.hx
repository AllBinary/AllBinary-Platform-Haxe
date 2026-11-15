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

import org.allbinary.graphics.opengles.NullOpenGLProcessorFactory;
import org.allbinary.graphics.opengles.OpenGLProcessor;

class PlatformShaderComposite extends ShaderComposite {
    public function new(requiresOpenGLVersion : String, shaderArray : haxe.ds.Vector<Shader>, compositeShaderUpdater : CompositeShaderUpdater, shaderInitializer : ShaderInitializer, modelViewProjection : ModelViewProjection, colorOpenGLProcessor : OpenGLProcessor, vertexOpenGLProcessor : OpenGLProcessor) {
        super(requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor, NullOpenGLProcessorFactory.getInstance());
    }

}

