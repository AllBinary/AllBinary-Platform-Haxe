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
package org.allbinary.logic.system.security.licensing;

import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AbeClientLicense implements AbeLicenseInterface {
    private var hashtable : ABHashtable<Any, Any>;
    private var id : String;
    private var servers : BasicArrayList;
    private var special : String = null;
    private var licenseType : LicenseType;
    public function new(hashtable : ABHashtable<Any, Any>) {
        this.hashtable = StdUtil.getInstance().createHashtable();
        var abeClientInformationData : AbeClientInformationData = AbeClientInformationData.getInstance();
        var keyValue : Any = hashtable.get(abeClientInformationData.KEY);
        if (keyValue != null) {
            if (Std.isOfType(keyValue, String)) {
                this.hashtable.put(abeClientInformationData.KEY, keyValue);
            }
        }
        this.id = (cast hashtable.get(abeClientInformationData.LICENSEID) : String);
        var vector : BasicArrayList = (cast hashtable.get(abeClientInformationData.LICENSESERVERS) : BasicArrayList);
        this.servers = new BasicArrayListD();
        var size : Int = vector.size();
        for (index in 0...size) {
            this.servers.add(vector.get(index));
        }
        final stringUtil : StringUtil = StringUtil.getInstance();
        this.setSpecial(stringUtil.getNonNull((cast hashtable.get(abeClientInformationData.SPECIAL) : String)));
        var licenseTypeString : String = stringUtil.getNonNull((cast hashtable.get(abeClientInformationData.LICENSE_TYPE) : String));
        this.licenseType = LicenseTypeFactory.getInstance().getInstanceFor(licenseTypeString);
    }

    public static function hasRequiredKeys(resultHashtable : ABHashtable<Any, Any>) : Bool {
        final abeClientInformationData : AbeClientInformationData = AbeClientInformationData.getInstance();
        if (resultHashtable.containsKey(abeClientInformationData.LICENSEID) && resultHashtable.containsKey(abeClientInformationData.LICENSESERVERS) && resultHashtable.containsKey(abeClientInformationData.KEY) && resultHashtable.containsKey(abeClientInformationData.LICENSE_TYPE)) {
            return true;
        } else {
            return false;
        }
    }

    public function hasKey() : Bool {
        return this.isValid();
    }

    public function getKey(keyName : String) : String {
        return (cast this.hashtable.get(keyName) : String);
    }

    public function getLicenseId() : String {
        return this.id;
    }

    public function getServers() : BasicArrayList {
        return this.servers;
    }

    public function isValid() : Bool {
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isEmpty(this.getKey(AbeClientInformationData.getInstance().KEY))) {
            return true;
        }
        return false;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        final BREAK : String = "<br/>";
        stringBuffer.append("License Id: ");
        stringBuffer.append(this.getLicenseId());
        stringBuffer.append(BREAK);
        stringBuffer.append("Is Valid: ");
        stringBuffer.appendboolean(this.isValid());
        stringBuffer.append(BREAK);
        stringBuffer.append("Keys: ");
        stringBuffer.append(Std.string(this.hashtable));
        stringBuffer.append(BREAK);
        var serverVector : BasicArrayList = this.getServers();
        var size : Int = serverVector.size();
        for (index in 0...size) {
            var nextServerString : String = (cast serverVector.get(index) : String);
            stringBuffer.append("Server: ");
            stringBuffer.append(nextServerString);
            stringBuffer.append(BREAK);
        }
        return Std.string(stringBuffer);
    }

    private function setSpecial(special : String) : Void {
        this.special = special;
    }

    public function getSpecial() : String {
        return this.special;
    }

    public function getLicenseType() : LicenseType {
        return this.licenseType;
    }

}

