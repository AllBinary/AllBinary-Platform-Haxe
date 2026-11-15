/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.osgi.framework;


class NullServiceReferenceFactory {
    private static final instance : NullServiceReferenceFactory = new NullServiceReferenceFactory();
    public static function getInstance() : NullServiceReferenceFactory {
        return NullServiceReferenceFactory.instance;
    }

    public var NULL_SERVICE_REFERENCE : NullServiceReference = new NullServiceReference();
    public function new() {
    }
}

