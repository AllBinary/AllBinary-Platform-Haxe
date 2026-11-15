/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.apache.xmlrpc;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.NullUtil;

class NullXmlRpcHandler implements XmlRpcHandler {
    public static final NULL_XML_RPC_HANDLER : NullXmlRpcHandler = new NullXmlRpcHandler();
    // throws Exception
    public function execute(method : String, params : BasicArrayList) : Any {
        return NullUtil.getInstance().NULL_OBJECT;
    }

    public function new() {
    }
}

