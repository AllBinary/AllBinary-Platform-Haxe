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
package admin.tags;

import admin.taghelpers.CustomItemsHelperFactory;
import admin.taghelpers.CustomItemsRequestHelperFactory;

class CustomItemsTag extends TableTag {
    public function new() {
        super();
        this.setTagHelperFactory(new CustomItemsHelperFactory());
        this.setTagRequestHelperFactory(new CustomItemsRequestHelperFactory());
    }

}

