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
package org.allbinary.bundle.logic.system.loader;

//import java.io.ByteArrayInputStream;
//import java.io.InputStream;
import org.allbinary.globals.Globals;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.gui.dialog.BasicTextJDialog;
import org.allbinary.gui.dialog.ExitCloseListener;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.AbCryptUtil;
import org.allbinary.logic.system.security.AbKeys;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.AbeLicenseInterface;
import org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory;
import org.allbinary.logic.system.security.licensing.AbeNoLicense;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.string.CommonStrings;

class CryptService {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final abCryptUtil : AbCryptUtil = AbCryptUtil.getInstance();
    public function new() {
        Globals.getInstance().init(Type.getClass(this).getClassLoader(), "./");
        this.logUtil.putF("Set Globals: " + URLGLOBALS.getWebappPath(), this, this.commonStrings.CONSTRUCTOR);
    }

    public function getDecryptedInputStream(abeClientInformation : AbeClientInformationInterface, name : String, inputStream : InputStream) : InputStream {
        try {
            final key : String = AbKeys.getInstance().getKey(abeClientInformation, name);
            final decrypted : haxe.ds.Vector<Int> = this.abCryptUtil.decrypt(inputStream, key);
            return new ByteArrayInputStream(decrypted);
        } catch (e : LicensingException) {
            this.showLicenseDialog(abeClientInformation, e);
        } catch (e : haxe.Exception) {
            this.showLicenseDialog(abeClientInformation, e);
        }
        return null;
    }

    private function showLicenseDialog(abeClientInformation : AbeClientInformationInterface, e : haxe.Exception) : Void {
        try {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
            final basicTextJDialog : BasicTextJDialog = new BasicTextJDialog(e.message);
            try {
                final abeLicenseInterface : AbeLicenseInterface = AbeLicenseInterfaceFactory.getInstance().getLicenseInstance(abeClientInformation);
                if (abeLicenseInterface != AbeNoLicense.getInstance()) {
                    if (abeLicenseInterface.isValid()) {
                        basicTextJDialog.setText("Subscription Invalid");
                    }
                }
            } catch (e2 : LicensingException) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e2);
            }
            basicTextJDialog.addCloseListener(new ExitCloseListener());
            basicTextJDialog.setVisible(true);
        } catch (e3 : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e3);
        }
    }

}

