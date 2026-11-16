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

//import jsinterop.annotations.JsType;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsProperty;

class CommonStrings {
    private static final instance : CommonStrings = new CommonStrings();
    public static function getInstance() : CommonStrings {
        return CommonStrings.instance;
    }

    public final EMPTY : String = "Empty";
    public final CREATE_IMAGE : String = "createImage";
    public final PLEASE_WAIT : String = "Please Wait";
    public final PLEASE_WAIT_FOR_SERVER : String = "Please Wait Getting Data From Server...";
    public final PERIODS : String = "...";
    public final LOADING : String = "Loading...";
    public final CONSTRUCTOR : String = "Constructor";
    public final START : String = "Start";
    public final END : String = "End";
    public final EXCEPTION : String = "Exception";
    public final EXCEPTION_LABEL : String = "Exception: ";
    public final CLEANUP : String = "cleanup";
    public final INIT : String = "init";
    public final CLOSE : String = "close";
    public final UP : String = "up";
    public final DOWN : String = "down";
    public final LEFT : String = "left";
    public final RIGHT : String = "right";
    public final DIRECTION_NAME : haxe.ds.Vector<String>;
    public final CREATE : String = "Create";
    public final REMOVE : String = "Remove";
    public final UPDATE : String = "Update";
    public final DELETE : String = "Delete";
    public final delete : String = "delete";
    public final LOAD : String = "load";
    public final SAVE : String = "save";
    public final ADD : String = "Add";
    public final DROP : String = "Drop";
    public final INSERT : String = "Insert";
    public final VISIT : String = "visit";
    public final START_METHOD_NAME : String;
    public final END_METHOD_NAME : String = "end";
    public final GET : String = "get";
    public final PROCESS : String = "process";
    public final GET_INSTANCE : String = "getInstance";
    public final GET_LIST : String = "getList";
    public final RUN : String = "run";
    public final START_RUNNABLE : String = "Start Runnable";
    public final RUNNING : String = "Running";
    public final END_RUNNABLE : String = "End Runnable";
    public final DISABLE : String = "disable";
    public final ENABLE : String = "enable";
    public final SUCCESS : String = "Command Success";
    public final FAILURE : String = "Command Failed";
    public final NOT_IMPLEMENTED : String = "Not Implemented";
    public final UNKNOWN : String = "Unknown";
    public final ON_EVENT : String = "onEvent";
    public final IS_VALID : String = "isValid";
    public final TOSTRING : String = "toString";
    public final ADD_LISTENER : String = "addListener";
    public final REMOVE_LISTENER : String = "removeListener";
    public final SIZE : String = "size";
    public function new() {
        this.DIRECTION_NAME = haxe.ds.Vector.fromArrayCopy(([this.DOWN, this.LEFT, this.RIGHT, this.UP] : Array<String>));
        this.START_METHOD_NAME = this.START;
    }
}

