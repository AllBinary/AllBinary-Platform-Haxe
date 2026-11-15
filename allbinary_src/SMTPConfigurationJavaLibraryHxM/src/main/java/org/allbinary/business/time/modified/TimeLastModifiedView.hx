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
package org.allbinary.business.time.modified;

import org.allbinary.business.entry.EntryData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class TimeLastModifiedView implements DomNodeInterface {
    private var timeLastModified : TimeLastModified = null;
    public function new(timeLastModified : TimeLastModified) {
        this.setTimeLastModified(timeLastModified);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        this.setTimeLastModified(new TimeLastModified(DomNodeHelper.getTextNodeValue(node)));
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        return ModDomHelper.createTextNode(document, EntryData.getInstance().TIMECREATED, this.getTimeLastModified().toString());
    }

    public function getTimeLastModified() : TimeLastModified {
        return this.timeLastModified;
    }

    public function setTimeLastModified(timeLastModified : TimeLastModified) : Void {
        this.timeLastModified = timeLastModified;
    }

}

