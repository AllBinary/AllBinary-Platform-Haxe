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


class AppRendererShaderUpdaterFactory extends ShaderUpdater {
    private static final instanceC : AppRendererShaderUpdaterFactory = new AppRendererShaderUpdaterFactory();
    public static function getInstance() : AppRendererShaderUpdaterFactory {
        return AppRendererShaderUpdaterFactory.instanceC;
    }

    private final NULL_SHADER_COMPOSITE_ARRAY : haxe.ds.Vector<ShaderComposite> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public final shaderCompositeArray : haxe.ds.Vector<ShaderComposite> = this.NULL_SHADER_COMPOSITE_ARRAY;
    private final shaderOpenGLProcessorArray : haxe.ds.Vector<ShaderOpenGLProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public function getTestShaders() : haxe.ds.Vector<ShaderOpenGLProcessor> {
        return this.shaderOpenGLProcessorArray;
    }

    public function setShaderComposite(object3d : Any) : Void {
    }

    public function new() {
        super();
    }
}

