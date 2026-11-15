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
package org.allbinary.logic.communication.log.config.type;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class LogConfigType {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var name : String;
    private var description : String;
    public static var availableLogConfigTypes : BasicArrayList = new BasicArrayListD();
    public function new(name : String, description : String) {
        this.name = name;
        this.description = description;
        LogConfigType.availableLogConfigTypes.add(this);
    }

    public function getName() : String {
        return this.name;
    }

    public function getDescription() : String {
        return this.description;
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function setDescription(value : String) : Void {
        this.description = value;
    }

}

