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
package org.allbinary.game.identification;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class GroupCommonFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GroupCommonFactory {
        if (GroupCommonFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            GroupCommonFactory.instance = new GroupCommonFactory();
        }
        return (cast GroupCommonFactory.instance : GroupCommonFactory);
    }

    public final ID : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(10);
    public final GROUP_NAME_LABEL : String = "Group Name: ";
    public final ID_LABEL : String = " Id: ";
    public final ADDING_LABEL : String = "Adding: ";
    public final TO_LABEL : String = " to: ";
    public function new() {
    }
}

