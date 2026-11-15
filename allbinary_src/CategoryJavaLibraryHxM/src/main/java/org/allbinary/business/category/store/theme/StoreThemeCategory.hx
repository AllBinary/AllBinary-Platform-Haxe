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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.category.Category;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.visual.theme.ThemeData;
import org.allbinary.logic.visual.theme.ThemeValidation;
import org.allbinary.logic.visual.theme.ThemesData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class StoreThemeCategory extends Category implements StoreThemeCategoryInterface {
    private var transformInfoInterface : TransformInfoInterface;
    private var themeVector : BasicArrayList;
    public function new(transformInfoInterface : TransformInfoInterface, categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface, level : Int) {
        super(categoryPropertiesFactoryInterface, level);
        this.transformInfoInterface = transformInfoInterface;
        this.themeVector = new BasicArrayListD();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface) {
        super(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface);
        this.transformInfoInterface = transformInfoInterface;
        this.themeVector = new BasicArrayListD();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, node : Node, categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface, level : Int) {
        super(categoryPropertiesFactoryInterface, level);
        this.transformInfoInterface = transformInfoInterface;
        this.themeVector = new BasicArrayListD();
        this.addThemes(node);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, node : Node, rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPropertiesFactoryInterface : CategoryPropertiesFactoryInterface) {
        super(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface);
        this.transformInfoInterface = transformInfoInterface;
        this.themeVector = new BasicArrayListD();
        this.addThemes(node);
    }

    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.transformInfoInterface;
    }

    // throws Exception
    public function addThemes(node : Node) : Void {
        var themesNode : Node = DomSearchHelper.getNode(ThemesData.getInstance().NAME, node.getChildNodes());
        var nodeList : NodeList = themesNode.getChildNodes();
        for (index in 0...nodeList.getLength()) {
            var themeNode : Node = nodeList.item(index);
            if (themeNode.getNodeName().compareTo(ThemeData.getInstance().NAME) == 0) {
                this.themeVector.add(new ThemeValidation(this, themeNode));
            }
        }
    }

    public function addTheme(themeValidation : ThemeValidation) : Void {
        this.themeVector.add(themeValidation);
    }

    public function getThemes() : BasicArrayList {
        return this.themeVector;
    }

    // throws Exception
    public function isValid() : Null<Bool> {
        if (!super.isValid()) {
            return false;
        }
        return true;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        var categoryHashMap : HashMap = super.toHashMap();
        categoryHashMap.put(ThemesData.getInstance().NAME, this.themeVector);
        return categoryHashMap;
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        var categoryVector : BasicArrayList = super.toVector();
        return categoryVector;
    }

}

