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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.category.properties.CategoryPropertiesInterface;
import org.allbinary.business.category.properties.CategoryPropertiesView;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.anyType.InterfaceUtil;
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CategoryView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var categoryInterface : CategoryInterface;
    public function new(categoryInterface : CategoryInterface) {
        this.categoryInterface = categoryInterface;
    }

    public function getCategoryInterface() : CategoryInterface {
        return this.categoryInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(CategoryData.getInstance().NAME);
        var childCategoryVector : BasicArrayList = this.categoryInterface.getChildNodes();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF("Number Of Children: " + childCategoryVector.size(), this, "toXmlNode");
        }
        var size : Int = childCategoryVector.size();
        for (i in 0...size) {
            var anyType : Any = childCategoryVector.get(i);
            var categoryPropertiesInterface : CategoryPropertiesInterface = null;
            if (InterfaceUtil.isImplemented("CategoryPropertiesInterface", anyType)) {
                categoryPropertiesInterface = (cast anyType : CategoryPropertiesInterface);
            } else if (InterfaceUtil.isImplemented("CategoryInterface", anyType)) {
                var categoryInterface : CategoryInterface = (cast anyType : CategoryInterface);
                categoryPropertiesInterface = categoryInterface.getProperties();
            } else {
                var isImpl : String = InterfaceUtil.viewAll(Type.getClass(anyType), CommonSeps.getInstance().NEW_LINE);
                throw new haxe.Exception("CategoryView found unknown object.\n" + "Show Testing:" + isImpl);
            }
            var childCategoryNode : Node = new CategoryPropertiesView(categoryPropertiesInterface).toXmlNode(document);
            node.appendChild(childCategoryNode);
        }
        return node;
    }

}

