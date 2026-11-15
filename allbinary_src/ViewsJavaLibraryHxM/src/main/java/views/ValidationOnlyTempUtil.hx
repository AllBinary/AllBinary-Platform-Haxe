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
package views;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

//Replace when validation node is added
class ValidationOnlyTempUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ValidationOnlyTempUtil = new ValidationOnlyTempUtil();
    public static function getInstance() : ValidationOnlyTempUtil {
        return ValidationOnlyTempUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function view(validationComponentInterface : ValidationComponentInterface) : String {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("View Name: " + validationComponentInterface.getTransformInfoInterface().getName(), this, "view()");
            }
            return StringUtil.getInstance().EMPTY_STRING;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

}

