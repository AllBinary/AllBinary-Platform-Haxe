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
package org.allbinary.game.midlet;

import org.allbinary.logic.system.security.licensing.ClientInformationFactory;
import org.allbinary.logic.system.security.licensing.LicenseServerInitFileUtil;

class SpecialDemoGameMidlet extends DemoGameMidlet {
    public function new(clientInformationFactory : ClientInformationFactory, licenseLoadingType : LicenseLoadingType, demoSetupFactory : LicensedDemoSetupFactory, licenseCheckRunnableFactory : LicenseCheckRunnableFactory) {
        super(clientInformationFactory);
    }

    public function initView() : Void {
    }

    public override function preInit() : Void {
        new LicenseServerInitFileUtil().init();
    }

}

