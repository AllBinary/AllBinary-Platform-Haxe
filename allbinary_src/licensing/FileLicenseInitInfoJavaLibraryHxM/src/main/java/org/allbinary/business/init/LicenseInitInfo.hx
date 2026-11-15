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
package org.allbinary.business.init;

import org.allbinary.debug.DebugFactory;
import org.allbinary.debug.NoDebug;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class LicenseInitInfo {
    private var id : String = StringUtil.getInstance().EMPTY_STRING;
    private var serverVector : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function getLicenseId() : String {
        return this.id;
    }

    public function getServer(index : Int) : String {
        return (cast this.serverVector.objectArray[index] : String);
    }

    public function getNumberOfServers() : Int {
        return this.serverVector.size();
    }

    public function setLicenseId(value : String) : Void {
        this.id = value;
    }

    public function clearServers() : Void {
        this.serverVector = new BasicArrayListD();
    }

    public function setServer(value : String, index : Int) : Void {
        this.serverVector.addAt(index, value);
    }

    public function addServer(value : String) : Void {
        this.serverVector.add(value);
    }

    public function getServerList() : BasicArrayList {
        return this.serverVector;
    }

    public function setServerList(servers : BasicArrayList) : Void {
        if (DebugFactory.getInstance() == NoDebug.getInstance()) {
            this.serverVector = servers;
        }
    }

}

