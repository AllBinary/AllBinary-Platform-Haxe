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

import org.allbinary.business.category.CategoryData;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

class CategoryPropertiesView implements DomNodeInterface {
    public var categoryPropertiesInterface : CategoryPropertiesInterface;
    public function new(categoryPropertiesInterface : CategoryPropertiesInterface) {
        this.categoryPropertiesInterface = categoryPropertiesInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var categoryNode : Node = document.createElement(CategoryData.getInstance().NAME);
        var newCategoryNode : Element = (cast categoryNode : Element);
        newCategoryNode.setAttribute(CategoryData.getInstance().LABEL, this.categoryPropertiesInterface.getValue());
        return categoryNode;
    }

}

