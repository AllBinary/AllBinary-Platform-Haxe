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
package org.allbinary.logic.communication.http;


class AcceptableResponseFactory {
    private static final instance : AcceptableResponseFactory = new AcceptableResponseFactory();
    public static function getInstance() : AcceptableResponseFactory {
        return AcceptableResponseFactory.instance;
    }

    public final HTML : AcceptableResponse = new AcceptableResponse("text/html", "html", 0);
    public final WML : AcceptableResponse = new AcceptableResponse("text/wml", "wml", 1);
    public final VXML : AcceptableResponse = new AcceptableResponse("text/vxml", "vxml", 2);
    public function new() {
    }
}

