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

//import java.util.Arrays;
import org.allbinary.business.category.CategoryView;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.visual.theme.ThemeValidation;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class StoreThemeCategoryView extends CategoryView implements DomNodeInterface {
    public function new(categoryInterface : StoreThemeCategoryInterface) {
        super((cast categoryInterface : StoreThemeCategoryInterface));
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        final node : Node = super.toXmlNode(document);
        final storeThemeCategoryInterface : StoreThemeCategoryInterface = (cast this.getCategoryInterface() : StoreThemeCategoryInterface);
        final themeValidationArray : haxe.ds.Vector<ThemeValidation> = (cast storeThemeCategoryInterface.getThemes().toArray() : haxe.ds.Vector<ThemeValidation>);
        Arrays.sort(themeValidationArray, new ThemeComparator());
        var size : Int = themeValidationArray.length;
        for (index in 0...size) {
            var themeValidation : ThemeValidation = (cast themeValidationArray[index] : ThemeValidation);
            node.appendChild(themeValidation.toXmlNode(document));
        }
        return node;
    }

}

