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

//import javax.microedition.khronos.opengles.GL10;
import org.allbinary.graphics.opengles.NullOpenGLProcessorFactory;
import org.allbinary.graphics.opengles.OpenGLCapabilities;
import org.allbinary.graphics.opengles.OpenGLProcessor;

class NullShaderComposite extends ShaderComposite {
    private static final instance : NullShaderComposite = /* anonymous class body:
        public function init(gl : GL10) : Void {
        }

*/ new NullShaderComposite(OpenGLCapabilities.getInstance().VERSION_2_0, haxe.ds.Vector.fromArrayCopy([new Shader(), new Shader()]), CompositeShaderUpdater.getInstance(), ShaderInitializer.getInstance(), ModelViewProjection.getInstance(), null, null, NullOpenGLProcessorFactory.getInstance());
    public static function getInstance() : ShaderComposite {
        return NullShaderComposite.instance;
    }

    public function new(requiresOpenGLVersion : String, shaderArray : haxe.ds.Vector<Shader>, compositeShaderUpdater : CompositeShaderUpdater, shaderInitializer : ShaderInitializer, modelViewProjection : ModelViewProjection, colorOpenGLProcessor : OpenGLProcessor, vertexOpenGLProcessor : OpenGLProcessor, disableProgramShaderOpenGLProcessor : OpenGLProcessor) {
        super(requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor, disableProgramShaderOpenGLProcessor);
        this.useProgramShaderOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    }

}

