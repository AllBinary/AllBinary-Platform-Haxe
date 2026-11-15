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
package org.allbinary.business.user;

//import java.util.HashMap;
import org.allbinary.business.entry.EntryData;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.string.StringUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class UserDomNode implements DomNodeInterface {
    private var dataMappingInterface : TableMappingInterface;
    public function new(dataMappingInterface : TableMappingInterface) {
        this.dataMappingInterface = dataMappingInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
        var hashMap : HashMap = this.dataMappingInterface.toHashMap();
        hashMap.put(EntryData.getInstance().LASTMODIFIED, EMPTY_STRING);
        hashMap.put(EntryData.getInstance().ENCRYPTION, EMPTY_STRING);
        hashMap.put(UserData.PASSWORD, EMPTY_STRING);
        return ModDomHelper.createNameValueNodes(document, UserData.NAME, hashMap);
    }

    // throws Exception
    public function toXmlDoc() : Document {
        return null;
    }

    // throws Exception
    public function view() : String {
        return null;
    }

}

