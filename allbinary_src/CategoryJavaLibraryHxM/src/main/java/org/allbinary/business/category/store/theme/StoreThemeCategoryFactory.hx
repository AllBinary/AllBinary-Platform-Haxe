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

//import java.util.HashMap;
import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.business.category.CategoryUtil;
import org.allbinary.business.category.properties.CategoryPropertiesFactory;
import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface;
import org.allbinary.business.category.properties.root.store.theme.RootStoreThemeCategoryPropertiesFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Node;

class StoreThemeCategoryFactory implements CategoryFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var transformInfoInterface : TransformInfoInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF(this.commonStrings.START, this, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)");
        }
        this.transformInfoInterface = transformInfoInterface;
    }

    public function getRootInstance() : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new RootStoreThemeCategoryPropertiesFactory(this.transformInfoInterface) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, categoryPropertiesFactoryInterface, 0) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getRootInstance()", e);
            }
            return null;
        }
    }

    public function getRootInstance(categoryAbPath : AbPath) : CategoryInterface {
        try {
            var level : Int = CategoryUtil.getPathLevel(categoryAbPath);
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new RootStoreThemeCategoryPropertiesFactory(this.transformInfoInterface, categoryAbPath) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, categoryPropertiesFactoryInterface, level) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getRootInstance(String)", e);
            }
            return null;
        }
    }

    public function getRootInstanceFromNode(node : Node) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new RootStoreThemeCategoryPropertiesFactory(this.transformInfoInterface, node) : CategoryPropertiesFactoryInterface);
            var categoryPath : AbPath = new AbPath(CategoryUtil.getNameFromNode(node), StringUtil.getInstance().EMPTY_STRING);
            var level : Int = CategoryUtil.getPathLevel(categoryPath);
            return (cast new StoreThemeCategory(this.transformInfoInterface, node, categoryPropertiesFactoryInterface, level) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getRootInstance(node)", e);
            }
            return null;
        }
    }

    public function getInstance(categoryPath : String, level : Int) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(categoryPath) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, categoryPropertiesFactoryInterface, level) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(String, int)", e);
            }
            return null;
        }
    }

    public function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPath : String) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(categoryPath) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(CategoryInterface, CategoryInterface , String, int)", e);
            }
            return null;
        }
    }

    public function getInstance(node : Node, level : Int) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(node) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, categoryPropertiesFactoryInterface, level) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(Node, int)", e);
            }
            return null;
        }
    }

    public function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, node : Node) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(node) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(CategoryInterface, CategoryInterface, Node, int)", e);
            }
            return null;
        }
    }

    public function getInstance(categoryPropertiesHashMap : HashMap, level : Int) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(categoryPropertiesHashMap) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, categoryPropertiesFactoryInterface, level) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(HashMap)", e);
            }
            return null;
        }
    }

    public function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPropertiesHashMap : HashMap) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(categoryPropertiesHashMap) : CategoryPropertiesFactoryInterface);
            return (cast new StoreThemeCategory(this.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(CategoryInterface, CategoryInterface, HashMap)", e);
            }
            return null;
        }
    }

}

