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
package org.allbinary.business.installer;

import org.allbinary.business.init.db.DatabaseConnectionInfoInterface;
import org.allbinary.business.init.db.InitDbHelperFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;

//Warning you must have sql root access
class DynamicInitDb extends InitDb {
    public function new(...args : Dynamic) {
        if (args.length == 1) {
            final abeClientInformation : AbeClientInformationInterface = args[0];
            super();
            this._new0(abeClientInformation);
        }
        else if (args.length == 2) {
            final abeClientInformation : AbeClientInformationInterface = args[0];
            final databaseConnectionInfoInterface : DatabaseConnectionInfoInterface = args[1];
            super();
            this._new1(abeClientInformation, databaseConnectionInfoInterface);
        }
    }

    private function _new0(abeClientInformation : AbeClientInformationInterface) : Void {
        this.setHelper(InitDbHelperFactory.getInstance(abeClientInformation));
    }

    private function _new1(abeClientInformation : AbeClientInformationInterface, databaseConnectionInfoInterface : DatabaseConnectionInfoInterface) : Void {
        this.setHelper(InitDbHelperFactory.getInstance(abeClientInformation, databaseConnectionInfoInterface));
    }

}

