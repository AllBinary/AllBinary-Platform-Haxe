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
package org.allbinary.business.user.username;

//import java.util.HashMap;
import org.allbinary.business.user.UserData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;

class UserName {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : UserName = new UserName();
    public static function getInstance() : UserName {
        return UserName.instance;
    }

    private var userName : String;
    public function new() {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.userName = (cast hashMap.get(UserData.USERNAME) : String);
    }

    public function isValid() : Null<Bool> {
        try {
            return this.isValid(this.userName);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to validate form", this, "isUserNameValid()", e);
            }
            return false;
        }
    }

    public function get() : String {
        return this.userName;
    }

    public function isValid(aUserName : String) : Null<Bool> {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            final booleanFactory : BooleanFactory = BooleanFactory.getInstance();
            var valid : Null<Bool> = booleanFactory.TRUE;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VALIDATION)) {
                this.logUtil.putF("UserName: " + aUserName, this, commonStrings.IS_VALID);
            }
            if (!StringValidationUtil.getInstance().isValidRequired(aUserName, 5, UserData.MAXLEN)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VALIDATION)) {
                    this.logUtil.putF("UserName is invalid", this, commonStrings.IS_VALID);
                }
                valid = booleanFactory.FALSE;
            }
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to validate form", this, commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public static function getValidationInfo(aUserName : String) : String {
        if (!StringValidationUtil.getInstance().isValidRequired(aUserName, 5, UserData.MAXLEN)) {
            return "Please enter a User Name with more than 5 characters.<br/>";
        }
        return StringUtil.getInstance().EMPTY_STRING;
    }

}

