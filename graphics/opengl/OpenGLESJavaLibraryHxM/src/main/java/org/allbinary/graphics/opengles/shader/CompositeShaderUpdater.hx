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
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;

class CompositeShaderUpdater extends ShaderUpdater {
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    public final shaderStrings : ShaderStrings = ShaderStrings.getInstance();
    private static final instanceC : CompositeShaderUpdater = new CompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), StringUtil.getInstance().getArrayInstance(), StringUtil.getInstance().getArrayInstance(), NullUtil.getInstance().NULL_INT_ARRAY);
    public static function getInstance() : CompositeShaderUpdater {
        return CompositeShaderUpdater.instanceC;
    }

    public final uniformBlockHandleArray : haxe.ds.Vector<Int>;
    public final uniformBlockArray : haxe.ds.Vector<String>;
    public final uniformHandleArray : haxe.ds.Vector<Int>;
    public final uniformArray : haxe.ds.Vector<String>;
    public final attributeHandleArray : haxe.ds.Vector<Int>;
    public final attributeArray : haxe.ds.Vector<String>;
    public function new(uniformBlockArray : haxe.ds.Vector<String>, uniformArray : haxe.ds.Vector<String>, attributeArray : haxe.ds.Vector<String>, attributeHandleArray : haxe.ds.Vector<Int>) {
        super();
        this.uniformBlockArray = uniformBlockArray;
        this.uniformBlockHandleArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.uniformBlockArray.length) 0]);
        this.uniformArray = uniformArray;
        this.uniformHandleArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.uniformArray.length) 0]);
        this.attributeArray = attributeArray;
        this.attributeHandleArray = attributeHandleArray;
    }

    public function onSurfaceCreated(gl : GL10, eglConfig : EGLConfig, programHandle : Int) : Void {
    }

    public function onSurfaceDestroyed(gl : GL10) : Void {
    }

}

