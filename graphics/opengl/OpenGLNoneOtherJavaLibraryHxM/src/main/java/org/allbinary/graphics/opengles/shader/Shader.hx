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

import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class Shader {
    public var shaderName : String = StringUtil.getInstance().EMPTY_STRING;
    public var shaderStringList : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    public var shaderAsString : String = StringUtil.getInstance().EMPTY_STRING;
    public var shaderHandle : Int = 0;
    public function new() {
    }
}

