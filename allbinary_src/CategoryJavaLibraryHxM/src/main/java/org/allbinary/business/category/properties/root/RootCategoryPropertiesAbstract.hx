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
package org.allbinary.business.category.properties.root;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class RootCategoryPropertiesAbstract implements RootCategoryPropertiesInterface {
    private final category : String = CategoryData.getInstance().ROOTCATEGORY;
    private final fileName : String = this.category + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION;
    public function new() {
    }

    public function getKey() : Any {
        return (cast this.getValue() : Any);
    }

    public function getValue() : String {
        return this.category;
    }

    // throws Exception
    public function setValue(value : String) : Void {
        throw new haxe.Exception("No Value Allowed");
    }

    // throws Exception
    public function setRootFilePath(value : AbPath) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function setRootFilePath(value : String) : Void {
        throw new haxe.Exception("No Value Allowed");
    }

    // throws Exception
    public function getRootFilePath() : AbPath {
        throw new haxe.Exception("No Value Allowed");
    }

    // throws Exception
    public function isRealRoot() : Bool {
        throw new haxe.Exception("No A Real Root");
    }

    // throws Exception
    public function isRoot() : Bool {
        throw new haxe.Exception("Root but not implemented");
    }

    // throws Exception
    public function getWebAppPath(categoryHierarchyInterface : CategoryHierarchyInterface) : String {
        throw new haxe.Exception("Not Root");
    }

    public function getPath(categoryHierarchyInterface : CategoryHierarchyInterface) : AbPath {
        return AbPath.createAbPath();
    }

    public function getFileName() : String {
        return this.fileName;
    }

    public function isValid() : Null<Bool> {
        return true;
    }

    public function toHashMap() : HashMap {
        var categoryHashMap : HashMap = StdUtil.getInstance().createHashMap();
        categoryHashMap.put(CategoryData.getInstance().NAME, this.category);
        return categoryHashMap;
    }

    public function toVector() : BasicArrayList {
        var categoryVector : BasicArrayList = new BasicArrayListD();
        categoryVector.add(this.category);
        return categoryVector;
    }

    // throws Exception
    public function toValidationInfoDoc() : Document {
        return null;
    }

    // throws Exception
    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public function validationInfo() : String {
        return null;
    }

}

