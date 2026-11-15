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
package org.allbinary.logic.visual.dhtml.style.css.property;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class CssPropertiesValidationFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(nodeList : NodeList) : BasicArrayList {
        var propertiesVector : BasicArrayList = new BasicArrayListD();
        for (index in 0...nodeList.getLength()) {
            var node : Node = nodeList.item(index);
            if (node.getNodeName().compareTo(CssPropertyData.getInstance().NAME) == 0) {
                var cssPropertyValidationInterface : ValidationInterface = (cast CssPropertyValidationFactory.getInstance(node) : ValidationInterface);
                propertiesVector.add(cssPropertyValidationInterface);
            }
        }
        return propertiesVector;
    }

    public static function getInstance(hashMap : HashMap) : BasicArrayList {
        var styles : BasicArrayList = new BasicArrayListD();
        return styles;
    }

}

