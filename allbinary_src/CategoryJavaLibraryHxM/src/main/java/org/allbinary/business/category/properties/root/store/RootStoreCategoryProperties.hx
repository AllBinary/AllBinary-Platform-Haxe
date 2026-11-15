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
package org.allbinary.business.category.properties.root.store;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryUtil;
import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface;
import org.allbinary.business.category.properties.CategoryPropertiesInterface;
import org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class RootStoreCategoryProperties implements RootCategoryPropertiesInterface implements CategoryPropertiesInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final pathData : AbPathData = AbPathData.getInstance();
    private var fileAbPath : AbPath = null;
    private var abPath : AbPath;
    private var category : String;
    private var isRealRoot : Bool;
    public var webAppAbPath : AbPath = null;
    public var transformInfoInterface : TransformInfoInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        this.transformInfoInterface = transformInfoInterface;
        this.abPath = AbPath.createAbPath();
        this.category = CategoryData.getInstance().ROOTCATEGORY;
        this.isRealRoot = true;
        this.initPath();
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, categoryAbPath : AbPath) {
        this.transformInfoInterface = transformInfoInterface;
        this.abPath = categoryAbPath;
        this.category = this.pathData.getNameFromPath(categoryAbPath.toString());
        if (StringValidationUtil.getInstance().isEmpty(this.category)) {
            this.isRealRoot = true;
            this.category = CategoryData.getInstance().ROOTCATEGORY;
        }
        this.initPath();
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, node : Node) {
        this.transformInfoInterface = transformInfoInterface;
        final categoryPath : String = CategoryUtil.getNameFromNode(node);
        this.abPath = new AbPath(categoryPath, StringUtil.getInstance().EMPTY_STRING);
        this.category = this.pathData.getNameFromPath(categoryPath);
        if (StringValidationUtil.getInstance().isEmpty(this.category)) {
            this.isRealRoot = true;
            this.category = CategoryData.getInstance().ROOTCATEGORY;
        }
        this.initPath();
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, categoryPropertiesHashMap : HashMap) {
        this.transformInfoInterface = transformInfoInterface;
        final categoryPath : String = (cast categoryPropertiesHashMap.get(CategoryData.getInstance().NAME) : String);
        this.abPath = new AbPath(categoryPath, StringUtil.getInstance().EMPTY_STRING);
        this.category = this.pathData.getNameFromPath(categoryPath);
        if (StringValidationUtil.getInstance().isEmpty(this.category)) {
            this.isRealRoot = true;
            this.category = CategoryData.getInstance().ROOTCATEGORY;
        }
        this.initPath();
        this.log();
    }

    // throws Exception
    public function initPath() : Void {
        final transformInfoHttpStoreInterface : TransformInfoHttpInterface = (cast this.transformInfoInterface : TransformInfoHttpInterface);
        final storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(transformInfoHttpStoreInterface.getStoreName());
        final postPath : String = storeFrontInterface.getCurrentHostNamePath() + storeFrontInterface.getCategoryPath();
        final httpServletRequest : HttpServletRequest = (cast transformInfoHttpStoreInterface.getPageContext().getRequest() : HttpServletRequest);
        this.webAppAbPath = new AbPath(httpServletRequest.getContextPath() + postPath, StringUtil.getInstance().EMPTY_STRING);
        this.setRootFilePath(new AbPath(URLGLOBALS.getMainPath() + postPath, StringUtil.getInstance().EMPTY_STRING));
    }

    public function isRealRoot() : Bool {
        return this.isRealRoot;
    }

    public function isRoot() : Bool {
        return true;
    }

    public function getKey() : Any {
        return (cast this.getValue() : Any);
    }

    public function setPath(path : AbPath) : Void {
        this.abPath = path;
    }

    public function setRootFilePath(value : AbPath) : Void {
        this.fileAbPath = value;
    }

    public function getRootFilePath() : AbPath {
        return this.fileAbPath;
    }

    public function getValue() : String {
        return this.category;
    }

    // throws Exception
    public function getWebAppPath() : AbPath {
        return this.webAppAbPath;
    }

    public function getPath(categoryHierarchyInterface : CategoryHierarchyInterface) : AbPath {
        return this.abPath;
    }

    public function getFileName() : String {
        return this.getValue() + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION;
    }

    public function setValue(value : String) : Void {
        this.category = value;
    }

    public function isValid() : Null<Bool> {
        return true;
    }

    public function toHashMap() : HashMap {
        final categoryHashMap : HashMap = StdUtil.getInstance().createHashMap();
        categoryHashMap.put(CategoryData.getInstance().NAME, this.getValue());
        return categoryHashMap;
    }

    public function toVector() : BasicArrayList {
        var categoryVector : BasicArrayList = new BasicArrayListD();
        categoryVector.add(this.getValue());
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

    public function log() : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF(new StringMaker().append("filePath = ").append(this.fileAbPath.toString()).append("\npath = ").append(this.abPath.toString()).append("\ncategory = ").append(this.category).toString(), this, "log()");
        }
    }

}

