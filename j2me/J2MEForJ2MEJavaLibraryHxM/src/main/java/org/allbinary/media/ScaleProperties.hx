/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.media;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;

class ScaleProperties {
    public static final instance : ScaleProperties = new ScaleProperties();
    public var scaleX : Float = 1.0;
    public var scaleY : Float = 1.0;
    public var scaleWidth : Int = 0;
    public var scaleHeight : Int = 0;
    public var shouldScale : Bool = false;
    public function toString() : String {
        return Std.string(new StringMaker().append(CommonLabels.getInstance().COLON_SEP).appendboolean(this.shouldScale).append("scaleX: ").appendfloat(this.scaleX).append("scaleY: ").appendfloat(this.scaleY).append("scaleWidth: ").appendint(this.scaleWidth).append("scaleHeight: ").appendint(this.scaleHeight));
    }

    public function new() {
    }
}

