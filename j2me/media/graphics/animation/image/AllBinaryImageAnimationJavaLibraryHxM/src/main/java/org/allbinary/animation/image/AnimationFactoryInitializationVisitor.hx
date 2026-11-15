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
package org.allbinary.animation.image;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;

class AnimationFactoryInitializationVisitor {
    public var width : Int = 0;
    public var height : Int = 0;
    public var dx : Int = 0;
    public var dy : Int = 0;
    public var originalDx : Int = 0;
    public var originalDy : Int = 0;
    public function visit() : Void {
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(PositionStrings.getInstance().DX_LABEL).appendfloat(this.dx);
        stringBuffer.append(PositionStrings.getInstance().DY_LABEL).appendfloat(this.dy);
        stringBuffer.append(commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(this.width);
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(this.height);
        return stringBuffer.toString();
    }

    public function new() {
    }
}

