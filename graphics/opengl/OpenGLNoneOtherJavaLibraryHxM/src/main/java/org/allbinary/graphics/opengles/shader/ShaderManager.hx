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
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class ShaderManager {
    private static final instance : ShaderManager = new ShaderManager(-1, -1);
    public static function getInstance() : ShaderManager {
        return ShaderManager.instance;
    }

    public final LOAD_SHADER : String = "loadShader";
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final GL_VERTEX_SHADER : Int;
    public final GL_FRAGMENT_SHADER : Int;
    public function new(GL_VERTEX_SHADER : Int, GL_FRAGMENT_SHADER : Int) {
        this.GL_VERTEX_SHADER = GL_VERTEX_SHADER;
        this.GL_FRAGMENT_SHADER = GL_FRAGMENT_SHADER;
    }

    public function load(gl : GL10, resource : String, shaderAsStringArray : haxe.ds.Vector<String>, shaderType : Int) : Int {
        return -1;
    }

    public function loadShader(gl : GL10, resource : String, stringList : BasicArrayList, shaderType : Int) : Int {
        return -1;
    }

}

