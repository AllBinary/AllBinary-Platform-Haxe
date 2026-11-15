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
package org.allbinary.logic.communication.smtp.info;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class EmailInfo {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var basicEmailInfo : BasicEmailInfo = null;
    private var htmlAttachment : String = null;
    private var contentBase : String = null;
    public function new(basicEmailInfo : BasicEmailInfo) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, commonStrings.CONSTRUCTOR);
        }
        this.init(basicEmailInfo, null, null);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(basicEmailInfo : BasicEmailInfo, htmlAttachment : String, contentBase : String) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, commonStrings.CONSTRUCTOR);
        }
        this.init(basicEmailInfo, null, null);
    }

    private function init(basicEmailInfo : BasicEmailInfo, htmlAttachment : String, contentBase : String) : Void {
        this.basicEmailInfo = basicEmailInfo;
        this.htmlAttachment = htmlAttachment;
        this.contentBase = contentBase;
    }

    public function getBasicEmailInfo() : BasicEmailInfo {
        return this.basicEmailInfo;
    }

    public function getHtmlAttachment() : String {
        return this.htmlAttachment;
    }

    public function getContentBase() : String {
        return this.contentBase;
    }

    public function toString() : String {
        return "Email Info: \n " + this.getBasicEmailInfo().toString();
    }

}

