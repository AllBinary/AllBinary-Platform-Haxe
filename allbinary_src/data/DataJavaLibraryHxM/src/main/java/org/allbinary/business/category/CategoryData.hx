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
package org.allbinary.business.category;

import org.allbinary.logic.io.file.CommonDataFileStrings;

class CategoryData {
    private static final instance : CategoryData = new CategoryData();
    public static function getInstance() : CategoryData {
        return CategoryData.instance;
    }

    public function new() {
    }

    public final PARENT : String = "CATEGORY_PARENT";
    public final NAME : String = "CATEGORY_NAME";
    public final PATH : String = "CATEGORY_PATH";
    public final LABEL : String = "CATEGORY_LABEL";
    public final VIEW : String = "CATEGORY_VIEW_CATEGORY";
    public final LEVEL : String = "CATEGORY_LEVEL";
    public final REQUEST : String = "request";
    public final ROOTCATEGORY : String = "Category";
    public final UNCRYPTED_EXTENSION : String = CommonDataFileStrings.getInstance().UNCRYPTED_EXTENSION;
    public final ENCRYPTED_EXTENSION : String = CommonDataFileStrings.getInstance().ENCRYPTED_EXTENSION;
}

