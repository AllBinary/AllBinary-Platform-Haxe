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
package org.allbinary.logic.io;


class InputOutputTypeData {
    private static final instance : InputOutputTypeData = new InputOutputTypeData();
    public static function getInstance() : InputOutputTypeData {
        return InputOutputTypeData.instance;
    }

    public function new() {
    }

    public final NAME : String = "INPUT_OUTPUT_TYPE_NAME";
    public final FILE : String = "INPUT_OUTPUT_TYPE_FILE";
    public final RESPONSE : String = "INPUT_OUTPUT_TYPE_RESPONSE";
    public final DB : String = "INPUT_OUTPUT_TYPE_DB";
    public final JSP : String = "jsp";
    public final JSP_FRAGMENT : String = "jspf";
    public final PHP : String = "php";
    public final ASP : String = "asp";
    public final PL : String = "pl";
    public final DEFAULT : String = this.JSP;
    public final DEFAULT_FRAGMENT : String = this.JSP_FRAGMENT;
}

