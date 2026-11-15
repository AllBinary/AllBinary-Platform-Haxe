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
package org.allbinary.business.category.hierarchy;

//import java.util.HashMap;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.logic.string.StringUtil;

class CategoryHierarchy implements CategoryHierarchyInterface {
    private var rootCategoryInterface : CategoryInterface = null;
    private var parentCategoryInterface : CategoryInterface = null;
    private var level : Int;
    public function new(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface) {
        this.level = 0;
        this.setRoot(rootCategoryInterface);
        this.setParent(parentCategoryInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, level : Int) {
        this.level = level;
        this.setRoot(rootCategoryInterface);
        this.setParent(parentCategoryInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPropertiesHashMap : HashMap) {
        var levelString : String = StringUtil.getInstance().getNonNull((cast categoryPropertiesHashMap.get(CategoryData.getInstance().LEVEL) : String));
        this.level = Std.int(Std.string(levelString));
        this.setRoot(rootCategoryInterface);
        this.setParent(parentCategoryInterface);
    }

    public function getLevel() : Int {
        return this.level;
    }

    public function getLevelString() : String {
        return Std.string(this.level);
    }

    public function setLevel(level : Int) : Void {
        this.level = level;
    }

    public function setParent(categoryInterface : CategoryInterface) : Void {
        this.parentCategoryInterface = categoryInterface;
    }

    public function setRoot(categoryInterface : CategoryInterface) : Void {
        this.rootCategoryInterface = categoryInterface;
    }

    public function getRoot() : CategoryInterface {
        return this.rootCategoryInterface;
    }

    public function getParent() : CategoryInterface {
        return this.parentCategoryInterface;
    }

}

