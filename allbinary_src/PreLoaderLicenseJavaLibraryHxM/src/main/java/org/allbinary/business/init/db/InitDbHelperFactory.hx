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
package org.allbinary.business.init.db;

import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;

class InitDbHelperFactory {
    private static final CLASSNAME : String = "org.allbinary.business.installer.InitDbCrypted";
    public function new() {
    }

    public static function getInstance(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            return InitDbHelperFactory.getInstance_AbeClientInformationInterface_DatabaseConnectionInfoInterface(args[0], args[1]);
        }
        if (args.length == 1) {
            return InitDbHelperFactory.getInstance_AbeClientInformationInterface(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: getInstance");
    }

    // throws LicensingException
    public static function getInstance_AbeClientInformationInterface_DatabaseConnectionInfoInterface(abeClientInformation : AbeClientInformationInterface, databaseConnectionInfoInterface : DatabaseConnectionInfoInterface) : Any {
        var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
        var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
        classes[0] = DatabaseConnectionInfoInterface;
        params[0] = (cast databaseConnectionInfoInterface : Any);
        var anyType : Any = AbeFactory.getInstance().getInstance(abeClientInformation, CLASSNAME, classes, params);
        return anyType;
    }

    // throws LicensingException
    public static function getInstance_AbeClientInformationInterface(abeClientInformation : AbeClientInformationInterface) : Any {
        var anyType : Any = AbeFactory.getInstance().getInstance(abeClientInformation, CLASSNAME, null, null);
        return anyType;
    }

}

