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
package org.allbinary.thirdparty.store;

import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class ThirdPartyStore {
    private var authorized : Bool = false;
    private final name : String;
    public function new(name : String) {
        this.name = name;
    }

    public function authorize(clientInformationInterface : AbeClientInformationInterface) : Void {
    }

    public function isAuthorized() : Bool {
        return this.authorized;
    }

    public function setAuthorized(authorized : Bool) : Void {
        this.authorized = authorized;
    }

    public function getName() : String {
        return this.name;
    }

}

