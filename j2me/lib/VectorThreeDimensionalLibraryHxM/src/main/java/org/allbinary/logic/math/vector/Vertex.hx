/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.logic.math.vector;

import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonSeps;

class Vertex {
    public var x : BasicDecimal = new BasicDecimal(0);
    public var y : BasicDecimal = new BasicDecimal(0);
    public var z : BasicDecimal = new BasicDecimal(0);
    public function new() {
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        var positionStrings : PositionStrings = PositionStrings.getInstance();
        stringBuffer.append(positionStrings.X_LABEL);
        stringBuffer.append(Std.string(this.x));
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(positionStrings.Y_LABEL);
        stringBuffer.append(Std.string(this.y));
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(positionStrings.Z_LABEL);
        stringBuffer.append(Std.string(this.z));
        return Std.string(stringBuffer);
    }

}

