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
package org.allbinary.logic.communication.smtp;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.BasicErrorNodeUtil;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class EmailsNotUsed implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public var emailInfoVector : BasicArrayList;
    public function new() {
        this.emailInfoVector = new BasicArrayListD();
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
                this.logUtil.putF(this.commonStrings.START, this, "toXmlNode");
            }
            var node : Node = document.createElement(EmailData.NAME);
            final size : Int = this.emailInfoVector.size();
            for (index in 0...size) {
                var email : Email = (cast this.emailInfoVector.get(index) : Email);
                var emailNode : Node = email.toXmlNode(document);
                if (emailNode != null) {
                    node.appendChild(emailNode);
                }
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
                this.logUtil.putF(this.commonStrings.END, this, "toXmlNode()");
            }
            return node;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "toXmlNode()", e);
            }
            var error : String = "Error Processing Order.  Please contact us if error persists.<p/>";
            return BasicErrorNodeUtil.get(document, error);
        }
    }

}

