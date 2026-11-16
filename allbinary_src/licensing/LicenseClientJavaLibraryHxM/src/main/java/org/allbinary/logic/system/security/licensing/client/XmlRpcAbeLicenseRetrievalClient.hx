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
package org.allbinary.logic.system.security.licensing.client;

import org.allbinary.logic.string.StringUtil;
import jre.io.IOException;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.init.crypt.jcehelper.CryptInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient;
import org.allbinary.logic.java.exception.ExceptionUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.AbeClientLicense;
import org.allbinary.logic.system.security.licensing.AbeLicenseInterface;
import org.allbinary.string.CommonLabels;
import org.allbinary.util.ABHashtable;
import org.apache.xmlrpc.XmlRpcClient;
import org.apache.xmlrpc.XmlRpcException;

class XmlRpcAbeLicenseRetrievalClient extends XmlRpcAbeClient {
    public final logUtil_XmlRpcAbeLicenseRetrievalClient : LogUtil = LogUtil.getInstance();
    public function new(clientInfo : AbeClientInformationInterface) {
        super(clientInfo, "LicServ.getLicense");
    }

    // throws Exception
    public override function get(anyType : Any, cryptInterface : CryptInterface) : Any {
        try {
            final server : String = getClientInfo().getLicenseServer(this.getServer());
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(TRYING);
            stringBuffer.appendint(jre.lang.JavaNumber.toInt(this.getServer()));
            stringBuffer.append(SEP);
            stringBuffer.append(server);
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.putF(CommonLabels.getInstance().START_LABEL + Std.string(stringBuffer), this, this.commonStrings.GET);
            final param : BasicArrayList = new BasicArrayListD();
            final xmlRpcClient : XmlRpcClient = new XmlRpcClient(server);
            this.setClient(xmlRpcClient);
            xmlRpcClient.setBasicAuthentication(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING);
            final hashtable : ABHashtable<Any, Any> = this.getClientInfo().toHashtable();
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.putF(CLIENT_INFO + Std.string(hashtable), this, this.commonStrings.GET);
            param.add(hashtable);
            final result : Any = xmlRpcClient.executeWithCrypt(this.getRemoteMethod(), param, cryptInterface);
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.putF(RESULT + Std.string(result), this, this.commonStrings.GET);
            final resultHashtable : ABHashtable<Any, Any> = (cast result : ABHashtable<Any, Any>);
            if (!AbeClientLicense.hasRequiredKeys(resultHashtable)) {
                this.logUtil_XmlRpcAbeLicenseRetrievalClient.putF(INVALID, this, this.commonStrings.GET);
                return this.tryAnother(anyType);
            }
            final abeLicenseInterface : AbeLicenseInterface = new AbeClientLicense(resultHashtable);
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.putF(this.commonStrings.END + Std.string(stringBuffer), this, this.commonStrings.GET);
            isOnline = true;
            return abeLicenseInterface;
        } catch (e : IOException) {
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.put(EXCEPTION_IN_CLIENT, this, this.commonStrings.GET, e);
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.putF(TRYING_OTHER_SERVERS + ExceptionUtil.getInstance().getStackTrace(e), this, this.commonStrings.GET);
            if (!e.message.startsWith(HOST_NOT_RESOLVED)) {
                return this.tryAnother(anyType);
            } else {
                isOnline = false;
                throw new jre.lang.JavaException(HOST_NOT_RESOLVED_MSG);
            }
        } catch (e : XmlRpcException) {
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.put(SERVER_REPORTED_ERROR, this, this.commonStrings.GET, e);
            return this.tryAnother(anyType);
        } catch (e : haxe.Exception) {
            this.logUtil_XmlRpcAbeLicenseRetrievalClient.put(UNKNOWN_ERROR, this, this.commonStrings.GET, e);
            return this.tryAnother(anyType);
        }
    }

}

