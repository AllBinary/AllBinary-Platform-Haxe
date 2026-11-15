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
package org.allbinary.business.context.modules.storefront.statistics.users;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class StoreFrontUsersStatisticsView implements DomNodeInterface {
    private var storeFrontUsersStatisticsInterface : StoreFrontUsersStatisticsInterface;
    public function new(storeFrontUsersStatisticsInterface : StoreFrontUsersStatisticsInterface) {
        this.storeFrontUsersStatisticsInterface = storeFrontUsersStatisticsInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.storeFrontUsersStatisticsInterface.toHashMap();
        var node : Node = ModDomHelper.createNameValueNodes(document, StoreFrontUsersStatisticsData.getInstance().NAME, hashMap);
        return node;
    }

}

