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
package org.allbinary.logic.communication.http.request;

//import java.util.Enumeration;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;

class AbeHttpRequestInfo {
    private final NAME : String = "AbeHttpRequestInfo";
    private final abeHttpRequestInfoData : AbeHttpRequestInfoData = AbeHttpRequestInfoData.getInstance();
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private var httpUserAgent : String;
    private var remoteAddress : String;
    private var remoteHost : String;
    private var remoteHostByAddr : String;
    private var remotePort : String;
    private var requestedFilePath : String;
    public function new(hashMap : HashMap) {
        var stringUtil : StringUtil = StringUtil.getInstance();
        this.httpUserAgent = stringUtil.getNonNull((cast hashMap.get(this.abeHttpRequestInfoData.HTTP_USER_AGENT) : String));
        this.remoteAddress = stringUtil.getNonNull((cast hashMap.get(this.abeHttpRequestInfoData.REMOTE_ADDRESS) : String));
        this.remoteHost = stringUtil.getNonNull((cast hashMap.get(this.abeHttpRequestInfoData.REMOTE_HOST) : String));
        this.remoteHostByAddr = stringUtil.getNonNull((cast hashMap.get(this.abeHttpRequestInfoData.REMOTE_HOST_BY_ADDRESS) : String));
        this.remotePort = stringUtil.getNonNull((cast hashMap.get(this.abeHttpRequestInfoData.REMOTE_PORT) : String));
        this.requestedFilePath = stringUtil.getNonNull((cast hashMap.get(this.abeHttpRequestInfoData.REQUEST_FILE_PATH) : String));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(httpServletRequest : HttpServletRequest) {
        final stringUtil : StringUtil = StringUtil.getInstance();
        this.httpUserAgent = stringUtil.EMPTY_STRING;
        var enumuration : Enumeration = httpServletRequest.getHeaderNames();
        while (enumuration.hasMoreElements()) {
            var key : String = (cast enumuration.nextElement() : String);
            var value : String = httpServletRequest.getHeader(key);
            if (key.indexOf("user") >= 0) {
                this.httpUserAgent = "key: " + key + " value: " + value;
            }
        }
        this.remoteHostByAddr = stringUtil.EMPTY_STRING;
        this.remoteAddress = httpServletRequest.getRemoteAddr();
        this.remoteHost = httpServletRequest.getRemoteHost();
        this.requestedFilePath = httpServletRequest.getServletPath();
        this.remotePort = Std.string(httpServletRequest.getRemotePort());
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(abeHttpRequestInfoData.HTTP_USER_AGENT, this.httpUserAgent);
        hashMap.put(abeHttpRequestInfoData.REMOTE_ADDRESS, this.remoteAddress);
        hashMap.put(abeHttpRequestInfoData.REMOTE_HOST, this.remoteHost);
        hashMap.put(abeHttpRequestInfoData.REMOTE_HOST_BY_ADDRESS, this.remoteHostByAddr);
        hashMap.put(abeHttpRequestInfoData.REMOTE_PORT, this.remotePort);
        hashMap.put(abeHttpRequestInfoData.REQUEST_FILE_PATH, this.requestedFilePath);
        return hashMap;
    }

    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        vector.add(this.httpUserAgent);
        vector.add(this.remoteAddress);
        vector.add(this.remoteHost);
        vector.add(this.remoteHostByAddr);
        vector.add(this.remotePort);
        vector.add(this.requestedFilePath);
        return vector;
    }

    public function toString() : String {
        return new StringMaker().append(this.NAME).append(this.commonSeps.COLON_SEP).append(abeHttpRequestInfoData.HTTP_USER_AGENT).append(this.commonSeps.COLON_SEP).append(this.httpUserAgent).append(this.commonSeps.SPACE).append(abeHttpRequestInfoData.REMOTE_ADDRESS).append(this.commonSeps.COLON_SEP).append(this.remoteAddress).append(this.commonSeps.SPACE).append(abeHttpRequestInfoData.REMOTE_HOST).append(this.commonSeps.COLON_SEP).append(this.remoteHost).append(this.commonSeps.SPACE).append(abeHttpRequestInfoData.REMOTE_HOST_BY_ADDRESS).append(this.commonSeps.COLON_SEP).append(this.remoteHostByAddr).append(this.commonSeps.SPACE).append(abeHttpRequestInfoData.REMOTE_PORT).append(this.commonSeps.COLON_SEP).append(this.remotePort).append(this.commonSeps.SPACE).append(abeHttpRequestInfoData.REQUEST_FILE_PATH).append(this.commonSeps.COLON_SEP).append(this.requestedFilePath).toString();
    }

}

