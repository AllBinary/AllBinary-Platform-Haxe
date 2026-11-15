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
import org.allbinary.business.category.properties.CategoryPropertiesFactory;
import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Node;

class CategoryAbstractFactory implements CategoryFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    public function getRootInstance() : CategoryInterface {
        throw new haxe.Exception();
    }

    public function getRootInstance(categoryAbPath : AbPath) : CategoryInterface {
        throw new haxe.Exception();
    }

    public function getRootInstanceFromNode(node : Node) : CategoryInterface {
        throw new haxe.Exception();
    }

    public function getInstance(categoryName : String) : CategoryInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                this.logUtil.putF(this.commonStrings.START, this, "getInstance(String)");
            }
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(categoryName) : CategoryPropertiesFactoryInterface);
            return (cast new Category(categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(String, int)", e);
            }
            return null;
        }
    }

    public function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryName : String) : CategoryInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                this.logUtil.putF(this.commonStrings.START, this, "getInstance(CategoryInterface, CategoryInterface, String)");
            }
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(categoryName) : CategoryPropertiesFactoryInterface);
            return (cast new Category(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(CategoryInterface, CategoryInterface , String, int)", e);
            }
            return null;
        }
    }

    public function getInstance(node : Node) : CategoryInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                this.logUtil.putF(this.commonStrings.START, this, "getInstance(Node)");
            }
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(node) : CategoryPropertiesFactoryInterface);
            return (cast new Category(categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(Node, int)", e);
            }
            return null;
        }
    }

    public function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, node : Node) : CategoryInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                this.logUtil.putF(this.commonStrings.START, this, "getInstance(CategoryInterface, CategoryInterface, Node)");
            }
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(node) : CategoryPropertiesFactoryInterface);
            return (cast new Category(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(CategoryInterface, CategoryInterface, Node, int)", e);
            }
            return null;
        }
    }

    public function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPropertiesHashMap : HashMap) : CategoryInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                this.logUtil.putF(this.commonStrings.START, this, "getInstance(CategoryInterface, CategoryInterface, HashMap)");
            }
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new CategoryPropertiesFactory(categoryPropertiesHashMap) : CategoryPropertiesFactoryInterface);
            return (cast new Category(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(CategoryInterface, CategoryInterface, HashMap)", e);
            }
            return null;
        }
    }

}

