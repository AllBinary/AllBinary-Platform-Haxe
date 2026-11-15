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
package org.allbinary.logic.communication.java.vm.stats;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class JvmStatisticsView extends JvmStatisticsMapping implements DomNodeInterface {
    public function new() {
        super();
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMap();
        var node : Node = ModDomHelper.createNameValueNodes(document, JvmStatisticsData.NAME, hashMap);
        return node;
    }

}

