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
package org.allbinary.business.category.properties;

//import java.util.HashMap;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.business.category.CategoryUtil;
import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlData;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CategoryProperties implements CategoryPropertiesInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final MAXDEPTH : Int = 100;
    private var category : String;
    public function new(name : String) {
        this.category = name;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        this.category = CategoryUtil.getNameFromNode(node);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(categoryPropertiesHashMap : HashMap) {
        this.category = (cast categoryPropertiesHashMap.get(CategoryData.getInstance().NAME) : String);
    }

    public function isRealRoot() : Bool {
        return false;
    }

    public function isRoot() : Bool {
        return false;
    }

    public function getKey() : Any {
        return (cast this.getValue() : Any);
    }

    public function getValue() : String {
        return this.category;
    }

    // throws Exception
    public function getPath(categoryHierarchyInterface : CategoryHierarchyInterface) : AbPath {
        final abPathData : AbPathData = AbPathData.getInstance();
        final pathStringBuffer : StringMaker = new StringMaker();
        final list : BasicArrayList = new BasicArrayListD();
        var nextParentCategoryInterface : CategoryInterface = categoryHierarchyInterface.getParent();
        if (this != nextParentCategoryInterface.getProperties()) {
            var depthIndex : Int = 0;
            while (nextParentCategoryInterface != null) {
                if (nextParentCategoryInterface.getProperties().isRealRoot()) {
                    break;
                }
                if (nextParentCategoryInterface.getProperties().isRoot()) {
                    list.addAt(0, Std.string(nextParentCategoryInterface.getPath()));
                } else {
                    pathStringBuffer.delete(0, pathStringBuffer.length());
                    list.addAt(0, Std.string(pathStringBuffer.append(abPathData.SEPARATOR).append(nextParentCategoryInterface.getProperties().getValue())));
                }
                if (nextParentCategoryInterface == nextParentCategoryInterface.getHierarchy().getParent()) {
                    break;
                }
                nextParentCategoryInterface = nextParentCategoryInterface.getHierarchy().getParent();
                depthIndex++;
                if (depthIndex > CategoryProperties.MAXDEPTH) {
                    throw new haxe.Exception("Probably Major Error");
                }
            }
        }
        pathStringBuffer.delete(0, pathStringBuffer.length());
        pathStringBuffer.append(abPathData.SEPARATOR).append(this.getValue());
        final size : Int = list.size();
        for (index in 0...size) {
            pathStringBuffer.append((cast list.get(index) : String));
        }
        pathStringBuffer.append(abPathData.SEPARATOR);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF("path = " + Std.string(pathStringBuffer), this, "getPath");
        }
        return new AbPath(Std.string(pathStringBuffer), StringUtil.getInstance().EMPTY_STRING);
    }

    public function getFileName() : String {
        return this.getValue() + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION;
    }

    // throws Exception
    public function getWebAppPath() : AbPath {
        throw new haxe.Exception("Not Root");
    }

    public function setValue(value : String) : Void {
        this.category = value;
    }

    public function isValid() : Null<Bool> {
        var returnBoolean : Null<Bool> = false;
        if (StringValidationUtil.getInstance().isValidRequired(this.category, 1, AbSqlData.MAXSTRING)) {
            returnBoolean = true;
        }
        return returnBoolean;
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

