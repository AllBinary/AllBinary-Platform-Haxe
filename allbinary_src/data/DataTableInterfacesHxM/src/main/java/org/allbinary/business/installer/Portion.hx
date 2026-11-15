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
package org.allbinary.business.installer;

import jre.util.HashMap;

class Portion {
    private final current : Null<Int>;
    private final total : Null<Int>;
    public function new(hashMap : HashMap<Dynamic, Dynamic>) {
        this.current = (cast hashMap.get("current") : Null<Int>);
        this.total = (cast hashMap.get("total") : Null<Int>);
    }

    public function getCurrent() : Null<Int> {
        return this.current;
    }

    public function getTotal() : Null<Int> {
        return this.total;
    }

}

