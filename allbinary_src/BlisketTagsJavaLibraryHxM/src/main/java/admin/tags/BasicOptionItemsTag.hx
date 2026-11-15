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

//import java.util.HashMap;
import admin.taghelpers.BasicOptionItemsHelperFactory;
import admin.taghelpers.BasicOptionItemsRequestHelperFactory;

class BasicOptionItemsTag extends TableTag {
    private var propertiesHashMap : HashMap = null;
    public function new() {
        super();
        this.setTagHelperFactory(new BasicOptionItemsHelperFactory());
        this.setTagRequestHelperFactory(new BasicOptionItemsRequestHelperFactory());
    }

}

