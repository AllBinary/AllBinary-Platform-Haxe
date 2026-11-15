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
package org.allbinary.business.category.store;

import org.allbinary.business.category.Category;
import org.allbinary.business.category.CategoryAbstractFactory;
import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.business.category.CategoryUtil;
import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface;
import org.allbinary.business.category.properties.root.store.RootStoreCategoryPropertiesFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Node;

class StoreCategoryFactory extends CategoryAbstractFactory implements CategoryFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var transformInfoInterface : TransformInfoInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF(this.commonStrings.START, this, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)");
        }
        this.transformInfoInterface = transformInfoInterface;
    }

    public function getRootInstance() : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new RootStoreCategoryPropertiesFactory(this.transformInfoInterface) : CategoryPropertiesFactoryInterface);
            return (cast new Category(categoryPropertiesFactoryInterface) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(String, int)", e);
            }
            return null;
        }
    }

    public function getRootInstance(categoryPath : AbPath) : CategoryInterface {
        try {
            var level : Int = CategoryUtil.getPathLevel(categoryPath);
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new RootStoreCategoryPropertiesFactory(this.transformInfoInterface, categoryPath) : CategoryPropertiesFactoryInterface);
            return (cast new Category(categoryPropertiesFactoryInterface, level) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(String, int)", e);
            }
            return null;
        }
    }

    public function getRootInstanceFromNode(node : Node) : CategoryInterface {
        try {
            var categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface = (cast new RootStoreCategoryPropertiesFactory(this.transformInfoInterface, node) : CategoryPropertiesFactoryInterface);
            var categoryPath : AbPath = new AbPath(CategoryUtil.getNameFromNode(node), StringUtil.getInstance().EMPTY_STRING);
            var level : Int = CategoryUtil.getPathLevel(categoryPath);
            return (cast new Category(categoryPropertiesFactoryInterface, level) : CategoryInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstance(String, int)", e);
            }
            return null;
        }
    }

}

