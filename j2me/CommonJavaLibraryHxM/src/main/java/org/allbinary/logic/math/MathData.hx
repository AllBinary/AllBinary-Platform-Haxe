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
package org.allbinary.logic.math;

import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;

class MathData {
    private static final instance : MathData = new MathData();
    public static function getInstance() : MathData {
        return MathData.instance;
    }

    public final EQUALS : String;
    public final PLUS : String = "+";
    public final GREATER_THAN : String = ">";
    public final MINUS : String;
    public final DIVIDE : String;
    public final MULTIPLY : String;
    public function new() {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        this.EQUALS = commonSeps.EQUALS;
        this.MINUS = commonSeps.DASH;
        this.DIVIDE = commonSeps.FORWARD_SLASH;
        this.MULTIPLY = CommonPhoneStrings.getInstance().STAR;
    }

}

