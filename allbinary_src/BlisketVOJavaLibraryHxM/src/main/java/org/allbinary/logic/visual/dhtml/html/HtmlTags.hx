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
package org.allbinary.logic.visual.dhtml.html;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;

class HtmlTags {
    private var htmlTagVector : BasicArrayList;
    public function new() {
        this.htmlTagVector = new BasicArrayListD();
    }

    public function get(index : Int) : HtmlTag {
        return (cast this.htmlTagVector.get(index) : HtmlTag);
    }

    public function add(htmlTag : HtmlTag) : Void {
        this.htmlTagVector.add(htmlTag);
    }

    public function size() : Int {
        return this.htmlTagVector.size();
    }

}

