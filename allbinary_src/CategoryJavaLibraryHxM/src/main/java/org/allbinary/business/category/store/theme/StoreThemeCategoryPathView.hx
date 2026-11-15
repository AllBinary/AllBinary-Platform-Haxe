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

import org.allbinary.business.category.CategoryView;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.visual.theme.ThemeInterface;
import org.allbinary.logic.visual.theme.ThemePropertiesView;
import org.allbinary.logic.visual.theme.ThemeValidation;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class StoreThemeCategoryPathView extends CategoryView implements DomNodeInterface {
    public function new(categoryInterface : StoreThemeCategoryInterface) {
        super((cast categoryInterface : StoreThemeCategoryInterface));
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = super.toXmlNode(document);
        var storeThemeCategoryInterface : StoreThemeCategoryInterface = (cast this.getCategoryInterface() : StoreThemeCategoryInterface);
        var themeArray : haxe.ds.Vector<Any> = storeThemeCategoryInterface.getThemes().toArray();
        var size : Int = themeArray.length;
        for (i in 0...size) {
            var themeValidation : ThemeValidation = (cast themeArray[i] : ThemeValidation);
            var domNodeInterface : DomNodeInterface = (cast new ThemePropertiesView((cast themeValidation : ThemeInterface)) : DomNodeInterface);
            node.appendChild(domNodeInterface.toXmlNode(document));
        }
        return node;
    }

}

