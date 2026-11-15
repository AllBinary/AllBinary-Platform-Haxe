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


class AbeHttpRequestInfoData {
    private static final instance : AbeHttpRequestInfoData = new AbeHttpRequestInfoData();
    public static function getInstance() : AbeHttpRequestInfoData {
        return AbeHttpRequestInfoData.instance;
    }

    public function new() {
    }

    public final HTTP_USER_AGENT : String = "HTTP_USER_AGENT";
    public final REMOTE_ADDRESS : String = "REMOTE_ADDRESS";
    public final REMOTE_HOST : String = "REMOTE_HOST";
    public final REMOTE_HOST_BY_ADDRESS : String = "REMOTE_HOST_BY_ADDRESS";
    public final REMOTE_PORT : String = "REMOTE_PORT";
    public final REQUEST_FILE_PATH : String = "REQUEST_FILE_PATH";
}

