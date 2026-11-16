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

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;

class CompositeShaderUpdater extends ShaderUpdater {
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    private static final instanceC : CompositeShaderUpdater = new CompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), StringUtil.getInstance().getArrayInstance(), StringUtil.getInstance().getArrayInstance(), NullUtil.getInstance().NULL_INT_ARRAY);
    public static function getInstance() : CompositeShaderUpdater {
        return CompositeShaderUpdater.instanceC;
    }

    public function new(uniformBlockArray : haxe.ds.Vector<String>, uniformArray : haxe.ds.Vector<String>, attributeArray : haxe.ds.Vector<String>, attributeHandleArray : haxe.ds.Vector<Int>) {
        super();
    }

    public override function onSurfaceCreated(gl : GL10, eglConfig : EGLConfig, programHandle : Int) : Void {
    }

    public function onSurfaceDestroyed(gl : GL10) : Void {
    }

}

