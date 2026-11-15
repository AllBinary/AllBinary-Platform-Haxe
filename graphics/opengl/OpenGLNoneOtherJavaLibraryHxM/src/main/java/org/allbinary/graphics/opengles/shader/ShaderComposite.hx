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
import org.allbinary.graphics.opengles.OpenGLProcessor;
import org.allbinary.logic.string.StringUtil;

class ShaderComposite {
    public final disableProgramShaderOpenGLProcessor : OpenGLProcessor;
    public final requiresOpenGLVersion : String;
    public final shaderArray : haxe.ds.Vector<Shader>;
    public final shaderInitializer : ShaderInitializer;
    public final compositeShaderUpdater : CompositeShaderUpdater;
    public final modelViewProjection : ModelViewProjection;
    public final colorOpenGLProcessor : OpenGLProcessor;
    public final vertexOpenGLProcessor : OpenGLProcessor;
    public var useProgramShaderOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var shaderMatrixOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var colorEnableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var normalEnableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var vertexEnableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var textureEnableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var colorDisableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var normalDisableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var vertexDisableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var textureDisableVertexAttribArrayOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var uniformLightPositionOpenGLProcessor : OpenGLObject3dProcessor = NullOpenGLTextureProcessor.getInstance();
    public var uniformLightColorOpenGLProcessor : OpenGLObject3dProcessor = NullOpenGLTextureProcessor.getInstance();
    public var uniformCameraPositionOpenGLProcessor : OpenGLObject3dProcessor = NullOpenGLTextureProcessor.getInstance();
    public var uniformTextureUnitOpenGLProcessor : OpenGLObject3dProcessor = NullOpenGLTextureProcessor.getInstance();
    public var programHandle : Int = 0;
    public function new(requiresOpenGLVersion : String, shaderArray : haxe.ds.Vector<Shader>, compositeShaderUpdater : CompositeShaderUpdater, shaderInitializer : ShaderInitializer, modelViewProjection : ModelViewProjection, colorOpenGLProcessor : OpenGLProcessor, vertexOpenGLProcessor : OpenGLProcessor, disableProgramShaderOpenGLProcessor : OpenGLProcessor) {
        this.requiresOpenGLVersion = requiresOpenGLVersion;
        this.shaderArray = shaderArray;
        this.shaderInitializer = shaderInitializer;
        this.compositeShaderUpdater = compositeShaderUpdater;
        this.modelViewProjection = modelViewProjection;
        this.colorOpenGLProcessor = colorOpenGLProcessor;
        this.vertexOpenGLProcessor = vertexOpenGLProcessor;
        this.disableProgramShaderOpenGLProcessor = disableProgramShaderOpenGLProcessor;
    }

    public function init(gl : GL10) : Void {
        this.programHandle = this.shaderInitializer.init(gl, this.shaderArray, StringUtil.getInstance().getArrayInstance());
    }

}

