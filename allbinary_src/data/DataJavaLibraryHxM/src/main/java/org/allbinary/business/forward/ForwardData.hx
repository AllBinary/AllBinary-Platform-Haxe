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
package org.allbinary.business.forward;


class ForwardData {
    private static final instance : ForwardData = new ForwardData();
    public function new() {
    }

    public static function getInstance() : ForwardData {
        return ForwardData.instance;
    }

    public final PAGE : String = "FORWARD_PAGE";
    public final NAME : String = "FORWARD_NAME";
    public final VALUE : String = "FORWARD_VALUE";
}

