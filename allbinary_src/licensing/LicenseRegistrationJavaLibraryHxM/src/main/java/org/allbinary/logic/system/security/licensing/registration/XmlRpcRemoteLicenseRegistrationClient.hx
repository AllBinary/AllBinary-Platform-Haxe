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
package org.allbinary.logic.system.security.licensing.registration;

//import java.io.IOException;
import org.apache.xmlrpc.XmlRpcClient;
import org.apache.xmlrpc.XmlRpcException;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.init.crypt.jcehelper.CryptInterface;
import org.allbinary.string.CommonLabels;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient;
import org.allbinary.logic.java.exception.ExceptionUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.util.ABHashtable;

class XmlRpcRemoteLicenseRegistrationClient extends XmlRpcAbeClient {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final PAGE : String = "licenseregistrationserverssl.php";
    public function new(clientInfo : AbeClientInformationInterface) {
        super(clientInfo, "LicenseRegistrationServer.process");
        this.setServer(0);
    }

    // throws Exception
    public function get(anyType : Any, cryptInterface : CryptInterface) : Any {
        try {
            var server : String = getClientInfo().getLicenseServer(this.getServer());
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(TRYING);
            stringBuffer.appendint(Std.int(this.getServer()));
            stringBuffer.append(SEP);
            stringBuffer.append(server);
            this.logUtil.putF(CommonLabels.getInstance().START_LABEL + stringBuffer.toString(), this, this.commonStrings.GET);
            var param : BasicArrayList = new BasicArrayListD();
            var serverUrl : String = getClientInfo().getLicenseServer(this.getServer());
            var index : Int = serverUrl.lastIndexOf("/");
            serverUrl = serverUrl.substring(0, index + 1) + this.PAGE;
            final xmlRpcClient : XmlRpcClient = new XmlRpcClient(serverUrl);
            this.setClient(xmlRpcClient);
            xmlRpcClient.setBasicAuthentication(null, null);
            var hashtable : ABHashtable<Any, Any> = (cast anyType : ABHashtable<Any, Any>);
            this.logUtil.putF(CLIENT_INFO + hashtable.toString(), this, this.commonStrings.GET);
            param.add(hashtable);
            var result : Any = xmlRpcClient.execute(this.getRemoteMethod(), param, cryptInterface);
            this.logUtil.putF(RESULT + result.toString(), this, this.commonStrings.GET);
            isOnline = true;
            return result;
        } catch (e : IOException) {
            this.logUtil.putF(TRYING_OTHER_SERVERS + ExceptionUtil.getInstance().getStackTrace(e), this, this.commonStrings.GET);
            if (!e.message.startsWith(HOST_NOT_RESOLVED)) {
                return this.tryAnother(anyType);
            } else {
                throw new haxe.Exception(HOST_NOT_RESOLVED_MSG);
            }
        } catch (e : XmlRpcException) {
            this.logUtil.put(SERVER_REPORTED_ERROR, this, this.commonStrings.GET, e);
            return this.tryAnother(anyType);
        } catch (e : haxe.Exception) {
            this.logUtil.put(UNKNOWN_ERROR, this, this.commonStrings.GET, e);
            return this.tryAnother(anyType);
        }
    }

}

