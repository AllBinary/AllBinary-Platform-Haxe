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

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.category.hierarchy.CategoryHierarchy;
import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface;
import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface;
import org.allbinary.business.category.properties.CategoryPropertiesInterface;
import org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class Category implements CategoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var categoryHierarchyInterface : CategoryHierarchyInterface;
    private var categoryPropertiesInterface : CategoryPropertiesInterface;
    private final childCategoryVector : BasicArrayList = new BasicArrayListD();
    private final typeVector : BasicArrayList = new BasicArrayListD();
    private final PROPERTIES : Null<Int> = 1;
    private final CATEGORY : Null<Int> = 0;
    public function new(categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, "Category(CategoryPropertiesFactoryInterface)");
        }
        this.categoryPropertiesInterface = categoryPropertiesFactoryInterface.getInstance();
        this.categoryHierarchyInterface = (cast new CategoryHierarchy(this, this) : CategoryHierarchyInterface);
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface, level : Int) {
        this.categoryPropertiesInterface = categoryPropertiesFactoryInterface.getInstance();
        this.categoryHierarchyInterface = (cast new CategoryHierarchy(this, this, level) : CategoryHierarchyInterface);
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface) {
        this.categoryPropertiesInterface = (cast categoryPropertiesFactoryInterface.getInstance() : CategoryPropertiesInterface);
        this.categoryHierarchyInterface = (cast new CategoryHierarchy(rootCategoryInterface, parentCategoryInterface) : CategoryHierarchyInterface);
        this.log();
    }

    // throws Exception
    public function getKey() : Any {
        return this.categoryPropertiesInterface.getKey();
    }

    private static final NOT_ROOT : String = "This is not the root so it has no file path.";
    // throws Exception
    public function getRootFilePath() : AbPath {
        var rootAbPath : AbPath = new AbPath(NOT_ROOT, StringUtil.getInstance().EMPTY_STRING);
        var categoryInterface : CategoryInterface = this.categoryHierarchyInterface.getRoot();
        if (categoryInterface.getProperties().isRoot()) {
            var rootCategoryPropertiesInterface : RootCategoryPropertiesInterface = (cast categoryInterface.getProperties() : RootCategoryPropertiesInterface);
            rootAbPath = rootCategoryPropertiesInterface.getRootFilePath();
        }
        return rootAbPath;
    }

    // throws Exception
    public function getFilePath() : AbPath {
        return new AbPath(this.getRootFilePath().toString() + this.getProperties().getPath(this.getHierarchy()).toString(), this.getProperties().getFileName());
    }

    // throws Exception
    public function getWebAppPath() : AbPath {
        var categoryInterface : CategoryInterface = this.categoryHierarchyInterface.getRoot();
        return categoryInterface.getProperties().getWebAppPath();
    }

    // throws Exception
    public function getPath() : AbPath {
        return this.categoryPropertiesInterface.getPath(this.categoryHierarchyInterface);
    }

    // synchronized
    public function addChildProperty(categoryPropertiesInterface : CategoryPropertiesInterface) : Bool {
        this.typeVector.add(this.PROPERTIES);
        return this.childCategoryVector.add(categoryPropertiesInterface);
    }

    // synchronized
    public function addChild(categoryInterface : CategoryInterface) : Bool {
        this.removeDuplicateChild(categoryInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF("adding", this, "addChild");
        }
        var childCategoryHierarchyInterface : CategoryHierarchyInterface = categoryInterface.getHierarchy();
        childCategoryHierarchyInterface.setParent(this);
        childCategoryHierarchyInterface.setRoot(this.getHierarchy().getRoot());
        categoryInterface.setHierarchy(childCategoryHierarchyInterface);
        this.typeVector.add(this.CATEGORY);
        return this.childCategoryVector.add(categoryInterface);
    }

    public function getChildNodes() : BasicArrayList {
        return this.childCategoryVector;
    }

    // synchronized
    public function removeChild(categoryInterface : CategoryInterface) : Bool {
        final removalVector : BasicArrayList = new BasicArrayListD();
        var bool_return : Bool = false;
        final size : Int = this.childCategoryVector.size();
        for (index in 0...size) {
            if (this.CATEGORY == this.typeVector.get(index)) {
                var anyType : Any = this.childCategoryVector.get(index);
                var currentCategoryInterface : CategoryInterface = (cast anyType : CategoryInterface);
                if (currentCategoryInterface.getProperties().getValue().compareTo(categoryInterface.getProperties().getValue()) == 0) {
                    removalVector.add(currentCategoryInterface);
                    bool_return = true;
                }
            }
        }
        this.removal(removalVector);
        return bool_return;
    }

    private function removal(removalVector : BasicArrayList) : Void {
        final removalSize : Int = removalVector.size();
        for (index in 0...removalSize) {
            var anyType : Any = removalVector.get(index);
            var objectIndex : Int = this.childCategoryVector.indexOf(anyType);
            this.typeVector.remove(objectIndex);
            this.childCategoryVector.remove(objectIndex);
        }
    }

    // synchronized
    private function removeDuplicateChild(categoryInterface : CategoryInterface) : Bool {
        final removalVector : BasicArrayList = new BasicArrayListD();
        var bool_return : Bool = false;
        final size : Int = this.childCategoryVector.size();
        for (index in 0...size) {
            var anyType : Any = this.childCategoryVector.get(index);
            if (this.PROPERTIES == this.typeVector.get(index)) {
                var categoryPropertiesInterface : CategoryPropertiesInterface = (cast anyType : CategoryPropertiesInterface);
                if (categoryInterface.getProperties().getValue().compareTo(categoryPropertiesInterface.getValue()) == 0) {
                    removalVector.add(categoryPropertiesInterface);
                    bool_return = true;
                    break;
                }
            } else if (this.CATEGORY == this.typeVector.get(index)) {
                var existingCategoryInterface : CategoryInterface = (cast anyType : CategoryInterface);
                var categoryPropertiesInterface : CategoryPropertiesInterface = existingCategoryInterface.getProperties();
                if (categoryInterface.getProperties().getValue().compareTo(categoryPropertiesInterface.getValue()) == 0) {
                    removalVector.add(existingCategoryInterface);
                    bool_return = true;
                    break;
                }
            }
        }
        this.removal(removalVector);
        return bool_return;
    }

    // throws Exception
    public function isLeaf() : Bool {
        if (this.childCategoryVector == null) {
            throw new haxe.Exception("Category Error");
        }
        if (this.childCategoryVector.size() == 0) {
            return true;
        } else {
            return false;
        }
    }

    public function getProperties() : CategoryPropertiesInterface {
        return this.categoryPropertiesInterface;
    }

    public function setProperties(categoryPropertiesInterface : CategoryPropertiesInterface) : Void {
        this.categoryPropertiesInterface = categoryPropertiesInterface;
    }

    public function getHierarchy() : CategoryHierarchyInterface {
        return this.categoryHierarchyInterface;
    }

    public function setHierarchy(categoryHierarchyInterface : CategoryHierarchyInterface) : Void {
        this.categoryHierarchyInterface = categoryHierarchyInterface;
    }

    // throws Exception
    // synchronized
    public function isValid() : Null<Bool> {
        if (!this.categoryPropertiesInterface.isValid()) {
            return false;
        }
        final size : Int = this.childCategoryVector.size();
        for (index in 0...size) {
            var anyType : Any = this.childCategoryVector.get(index);
            if (this.PROPERTIES == this.typeVector.get(index)) {
                var categoryPropertiesInterface : CategoryPropertiesInterface = (cast anyType : CategoryPropertiesInterface);
                if (!categoryPropertiesInterface.isValid()) {
                    return false;
                }
            } else if (this.CATEGORY == this.typeVector.get(index)) {
                var categoryInterface : CategoryInterface = (cast anyType : CategoryInterface);
                if (!categoryInterface.isValid()) {
                    return false;
                }
            }
        }
        return true;
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

    // throws Exception
    public function toHashMap() : HashMap {
        var categoryHashMap : HashMap = this.categoryPropertiesInterface.toHashMap();
        return categoryHashMap;
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        var categoryVector : BasicArrayList = this.categoryPropertiesInterface.toVector();
        categoryVector.add(this.childCategoryVector);
        return categoryVector;
    }

    // throws Exception
    public function log() : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Category Name: ");
            stringBuffer.append(this.categoryPropertiesInterface.getValue());
            stringBuffer.append("\nPath = ");
            stringBuffer.append(this.getPath().toString());
            stringBuffer.append("\nFile Path: ");
            stringBuffer.append(this.getFilePath().toString());
            this.logUtil.putF(stringBuffer.toString(), this, "log()");
        }
    }

}

