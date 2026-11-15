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
package org.allbinary.business.category.store.theme;

//import java.util.Comparator;

class ThemeComparator implements Comparator {
    public function new() {
    }

    public function compare(anyType : Any, object2 : Any) : Int {
        var string : String = (cast anyType : String);
        var string2 : String = (cast object2 : String);
        return Reflect.compare(string, string2);
    }

}

