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

//import java.util.HashMap;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.io.file.AbFile;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class FileDomDataModel implements DomNodeInterface {
    private var file : AbFile;
    public function new(file : AbFile) {
        this.file = file;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var tableMappingInterface : TableMappingInterface = (cast new FileTableMapping(this.file) : TableMappingInterface);
        var hashMap : HashMap = tableMappingInterface.toHashMap();
        return ModDomHelper.createNodeWithValueNodes(document, "file", hashMap);
    }

}

