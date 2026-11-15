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
package org.allbinary.business.user.password;

//import java.util.HashMap;
//import java.util.Random;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.UserData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.SuperCrypt;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;

class Password {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var password : String;
    public function new(password : String) {
        this.password = password;
    }

    public function set(value : String) : Void {
        this.password = value;
    }

    public function get() : String {
        return this.password;
    }

    public function isValid() : Null<Bool> {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            var valid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VALIDATION)) {
                this.logUtil.putF("Password: " + this.password, this, commonStrings.IS_VALID);
            }
            if (!StringValidationUtil.getInstance().isValidRequired(this.password, 6, UserData.MAXLEN)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VALIDATION)) {
                    this.logUtil.putF("Password is invalid", this, commonStrings.IS_VALID);
                }
                valid = false;
            }
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VALIDATIONERROR)) {
                this.logUtil.put("Failed to validate form", "Password", commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function getValidationInfo() : String {
        if (!StringValidationUtil.getInstance().isValidRequired(this.password, 6, UserData.MAXLEN)) {
            return "Please enter a Password with more than 6 characters.<br />";
        }
        final stringUtil : StringUtil = StringUtil.getInstance();
        return stringUtil.EMPTY_STRING;
    }

    public function toVector(secret : String) : BasicArrayList {
        this.password = StringUtil.getInstance().getNonNull(this.password);
        var random : Int = new Random().nextInt(SuperCrypt.KEYMAX);
        var vector : BasicArrayList = new BasicArrayListD();
        vector.add(random.toString());
        vector.add(secret);
        vector.add(new SuperCrypt(random).encrypt(this.password));
        return vector;
    }

    public function toHashMap(secret : String) : HashMap {
        this.password = StringUtil.getInstance().getNonNull(this.password);
        var values : HashMap = StdUtil.getInstance().createHashMap();
        var random : Int = new Random().nextInt(SuperCrypt.KEYMAX);
        values.put(EntryData.getInstance().ENCRYPTION, random.toString());
        values.put(UserData.SECRET, secret);
        values.put(UserData.PASSWORD, new SuperCrypt(random).encrypt(this.password));
        return values;
    }

}

