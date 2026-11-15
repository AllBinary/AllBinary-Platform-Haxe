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

import org.allbinary.business.category.CategoryInterface;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class StoreThemeCategoriesView implements DomNodeInterface {
    private var categoryInterface : StoreThemeCategoryInterface;
    public function new(categoryInterface : StoreThemeCategoryInterface) {
        this.categoryInterface = categoryInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = new StoreThemeCategoryView(this.categoryInterface).toXmlNode(document);
        var childArray : haxe.ds.Vector<Any> = this.categoryInterface.getChildNodes().toArray();
        var size : Int = childArray.length;
        for (i in 0...size) {
            var childCategoryInterface : CategoryInterface = (cast childArray[i] : CategoryInterface);
            var childCategoryNode : Node = new StoreThemeCategoriesView((cast childCategoryInterface : StoreThemeCategoryInterface)).toXmlNode(document);
            node.appendChild(childCategoryNode);
        }
        return node;
    }

}

