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
package org.allbinary.logic.visual.dhtml.html.head.meta;


class HtmlMetaAttributeData {
    private var id : Int;
    private var name : String;
    public function new(id : Int, value : String) {
        this.name = value;
        this.id = id;
    }

    public function equals(htmlMetaAttributeData : HtmlMetaAttributeData) : Bool {
        if (htmlMetaAttributeData.id == this.id) {
            return true;
        } else {
            return false;
        }
    }

    public function toString() : String {
        return this.name;
    }

}

