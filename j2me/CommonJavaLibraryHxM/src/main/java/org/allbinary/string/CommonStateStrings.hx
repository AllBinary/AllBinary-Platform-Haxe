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
package org.allbinary.string;


class CommonStateStrings {
    private static final instance : CommonStateStrings = new CommonStateStrings();
    public static function getInstance() : CommonStateStrings {
        return CommonStateStrings.instance;
    }

    public final CONTEXT : String = "Context: ";
    public final FINISH : String = "finish";
    public final CREATE : String = "onCreate";
    public final START : String = "onStart";
    public final RESTART : String = "onRestart";
    public final RESUME : String = "onResume";
    public final PAUSE : String = "onPause";
    public final STOP : String = "onStop";
    public final DESTROY : String = "onDestroy";
    public final BIND : String = "onBind";
    public final ON_SAVE_INSTANCE_STATE : String = "onSaveInstanceState";
    public final ON_START_COMMAND : String = "onStartCommand";
    public function new() {
    }
}

