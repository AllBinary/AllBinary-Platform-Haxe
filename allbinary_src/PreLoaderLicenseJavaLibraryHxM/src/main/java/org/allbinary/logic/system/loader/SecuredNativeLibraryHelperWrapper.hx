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
package org.allbinary.logic.system.loader;

import org.allbinary.logic.system.security.AbKeys;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;

class SecuredNativeLibraryHelperWrapper extends NativeLibraryHelperWrapper {
    private var securedNativeLibraryInterface : SecuredNativeLibraryInterface;
    public function new(securedNativeLibraryInterface : SecuredNativeLibraryInterface) {
        super(securedNativeLibraryInterface.getLibraryName());
        this.securedNativeLibraryInterface = securedNativeLibraryInterface;
    }

    // throws LicensingException
    public function unlock(abeClientInformation : AbeClientInformationInterface) : Bool {
        return this.securedNativeLibraryInterface.unlock(AbKeys.getInstance().getKey(abeClientInformation, this.securedNativeLibraryInterface.getName()));
    }

}

