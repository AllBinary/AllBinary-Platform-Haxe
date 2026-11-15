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
package org.allbinary.logic.system;

import org.allbinary.KotlinUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class SoftwareInformation {
    private final name : String;
    private final shortName : String;
    private final version : String;
    public function new(name : String, version : String, shortName : String) {
        this.name = name;
        this.version = version;
        this.shortName = Std.string(new StringMaker().append(shortName).append(KotlinUtil.getShortName()));
    }

    public function getName() : String {
        return this.name;
    }

    public function getVersion() : String {
        return this.version;
    }

    public function toShortString() : String {
        return this.shortName;
    }

    public function toString() : String {
        final NAME : String = "Name: ";
        final VERSION : String = "Version: ";
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(NAME);
        stringBuffer.append(this.getName());
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(VERSION);
        stringBuffer.append(this.getVersion());
        return Std.string(stringBuffer);
    }

}

