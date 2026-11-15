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
package org.allbinary.game.input;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class Input {
    private var id : Int = 0;
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(id : Int, name : String) {
        this.setId(id);
        this.setName(name);
    }

    public function getId() : Int {
        return this.id;
    }

    private function setId(key : Int) : Void {
        this.id = key;
    }

    public function getName() : String {
        return this.name;
    }

    private function setName(keyName : String) : Void {
        this.name = keyName;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Name: ");
        stringBuffer.append(this.getName());
        stringBuffer.append(" Id: ");
        stringBuffer.appendint(this.getId());
        return stringBuffer.toString();
    }

}

