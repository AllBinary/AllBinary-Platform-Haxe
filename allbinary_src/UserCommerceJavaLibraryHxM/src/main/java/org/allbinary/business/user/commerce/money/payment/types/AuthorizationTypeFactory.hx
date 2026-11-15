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
package org.allbinary.business.user.commerce.money.payment.types;


class AuthorizationTypeFactory {
    private static final instance : AuthorizationTypeFactory = new AuthorizationTypeFactory();
    public static function getInstance() : AuthorizationTypeFactory {
        return AuthorizationTypeFactory.instance;
    }

    public final NONE : AuthorizationType = new AuthorizationType("None");
    public final VOICE : AuthorizationType = new AuthorizationType("Voice");
    public final RETINAL : AuthorizationType = new AuthorizationType("Retinal");
    public final IMAGE : AuthorizationType = new AuthorizationType("Image");
    public final DNA : AuthorizationType = new AuthorizationType("DNA");
    public final PRINT : AuthorizationType = new AuthorizationType("Print");
    public final CHIP : AuthorizationType = new AuthorizationType("Chip");
    public function new() {
    }
}

