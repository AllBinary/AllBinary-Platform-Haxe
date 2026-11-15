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
package org.allbinary.data.tree.dom;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.w3c.dom.NodeList;

class DomNodeListHelper {
    public static function getVector(nodeList : NodeList) : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        var size : Int = nodeList.getLength();
        for (index in 0...size) {
            vector.add(DomNodeHelper.getTextNodeValue(nodeList.item(index)));
        }
        return vector;
    }

    public function new() {
    }
}

