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
package org.allbinary.logic.communication.xmlrpc;

import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.apache.xmlrpc.NullXmlRpcHandler;
import org.apache.xmlrpc.XmlRpcClient;
import org.apache.xmlrpc.XmlRpcHandler;

class XmlRpcAbeClient {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final remoteMethod : String;
    private final clientInfo : AbeClientInformationInterface;
    private var client : XmlRpcHandler = NullXmlRpcHandler.NULL_XML_RPC_HANDLER;
    private var server : Int;
    private var start : Int = 0;
    private var maxServers : Int = 0;
    private var isDone : Bool;
    private final START_SERVER : String = "Start With Server #";
    public final TRYING : String = "Trying Server #";
    public final SEP : String = CommonLabels.getInstance().COLON_SEP;
    public final CLIENT_INFO : String = "Client Info: \n";
    public final RESULT : String = CommonLabels.getInstance().RESULT_ + CommonSeps.getInstance().NEW_LINE;
    public final INVALID : String = "License data is Invalid Trying Other Servers";
    public final EXCEPTION_IN_CLIENT : String = "Exception in client";
    public final SERVER_REPORTED_ERROR : String = "Server reported error";
    public final UNKNOWN_ERROR : String = "Unknown License Retrieval Failure";
    public final TRYING_OTHER_SERVERS : String = "IOException Trying Other Servers";
    public final HOST_NOT_RESOLVED_MSG : String = "Not Trying Again Since Host Unresolved";
    public final HOST_NOT_RESOLVED : String = "Host is unresolved";
    public static var isOnline : Bool = true;
    private final myRandomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    public function new(clientInfo : AbeClientInformationInterface, remoteMethod : String) {
        this.remoteMethod = remoteMethod;
        this.clientInfo = clientInfo;
        if (clientInfo.getNumberOfLicenseServers() > 1) {
            this.maxServers = clientInfo.getNumberOfLicenseServers() - 2;
            this.start = this.myRandomFactory.getAbsoluteNextInt(this.maxServers) + 1;
        } else if (clientInfo.getNumberOfLicenseServers() == 1) {
            this.maxServers = 0;
            this.start = 0;
        }
        this.isDone = false;
        this.server = this.start;
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.START_SERVER);
        stringBuffer.appendint(this.getServer());
        stringBuffer.append(this.SEP);
        stringBuffer.append(clientInfo.getLicenseServer(this.getServer()));
        this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.CONSTRUCTOR);
    }

    // throws Exception
    public function get(anyType : Any) : Any {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, this);
        return NullUtil.getInstance().NULL_OBJECT;
    }

    // throws Exception
    public function tryAnother(anyType : Any) : Any {
        if (getServer() < getMaxServers()) {
            this.setServer(getServer() + 1);
        } else {
            this.setServer(0);
        }
        if (getServer() != getStart() && !isIsDone()) {
            return this.get(anyType);
        } else {
            this.setIsDone(true);
        }
        throw new haxe.Exception("Tried All Servers But Still Failed");
    }

    public function getClientInfo() : AbeClientInformationInterface {
        return this.clientInfo;
    }

    public function getClient() : XmlRpcHandler {
        return this.client;
    }

    public function setClient(client : XmlRpcClient) : Void {
        this.client = client;
    }

    public function getServer() : Int {
        return this.server;
    }

    public function setServer(server : Int) : Void {
        this.server = server;
    }

    public function getStart() : Int {
        return this.start;
    }

    public function setStart(start : Int) : Void {
        this.start = start;
    }

    public function getMaxServers() : Int {
        return this.maxServers;
    }

    public function setMaxServers(maxServers : Int) : Void {
        this.maxServers = maxServers;
    }

    public function isIsDone() : Bool {
        return this.isDone;
    }

    public function setIsDone(isDone : Bool) : Void {
        this.isDone = isDone;
    }

    public function getRemoteMethod() : String {
        return this.remoteMethod;
    }

}

