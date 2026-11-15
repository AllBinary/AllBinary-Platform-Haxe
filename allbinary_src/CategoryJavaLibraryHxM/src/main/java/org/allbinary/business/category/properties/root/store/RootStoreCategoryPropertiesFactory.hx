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
import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface;
import org.allbinary.business.category.properties.CategoryPropertiesInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Node;

class RootStoreCategoryPropertiesFactory implements CategoryPropertiesFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var categoryPropertiesInterface : CategoryPropertiesInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        this.categoryPropertiesInterface = (cast new RootStoreCategoryProperties(transformInfoInterface) : CategoryPropertiesInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, abPath : AbPath) {
        this.categoryPropertiesInterface = (cast new RootStoreCategoryProperties(transformInfoInterface, abPath) : CategoryPropertiesInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, node : Node) {
        this.categoryPropertiesInterface = (cast new RootStoreCategoryProperties(transformInfoInterface, node) : CategoryPropertiesInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, categoryPropertiesHashMap : HashMap) {
        this.categoryPropertiesInterface = (cast new RootStoreCategoryProperties(transformInfoInterface, categoryPropertiesHashMap) : CategoryPropertiesInterface);
    }

    public function getInstance() : CategoryPropertiesInterface {
        try {
            return (cast this.categoryPropertiesInterface : CategoryPropertiesInterface);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

