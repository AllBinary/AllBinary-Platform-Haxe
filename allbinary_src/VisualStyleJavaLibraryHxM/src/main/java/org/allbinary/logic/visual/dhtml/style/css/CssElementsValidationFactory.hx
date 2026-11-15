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
package org.allbinary.logic.visual.dhtml.style.css;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.w3c.dom.Node;

class CssElementsValidationFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(cssElementStyleNodeList : BasicArrayList) : BasicArrayList {
        final styles : BasicArrayList = new BasicArrayListD();
        final size : Int = cssElementStyleNodeList.size();
        var cssElementStyleNode : Node = null;
        var cssValidationInterface : ValidationInterface = null;
        for (index in 0...size) {
            cssElementStyleNode = (cast cssElementStyleNodeList.get(index) : Node);
            cssValidationInterface = (cast CssElementValidationFactory.getInstance(cssElementStyleNode) : ValidationInterface);
            styles.add(cssValidationInterface);
        }
        return styles;
    }

    public static function getInstance(hashMap : HashMap) : BasicArrayList {
        final styles : BasicArrayList = new BasicArrayListD();
        return styles;
    }

}

