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
package org.allbinary.globals;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class UrlGlobalsView implements DomNodeInterface {
    public function new() {
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(UrlGlobalsData.WEBAPPPATH, org.allbinary.globals.URLGLOBALS.getWebappPath());
        var node : Node = ModDomHelper.createNameValueNodes(document, UrlGlobalsData.NAME, hashMap);
        return node;
    }

}

