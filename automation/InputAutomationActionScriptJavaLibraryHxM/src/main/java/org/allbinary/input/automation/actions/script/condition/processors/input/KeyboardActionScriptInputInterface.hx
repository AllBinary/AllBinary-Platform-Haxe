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
package org.allbinary.input.automation.actions.script.condition.processors.input;


interface KeyboardActionScriptInputInterface extends ProfileActionScriptInputInterface {
    function getDelayBetweenKeys() : Int;

    function getKeyArray() : haxe.ds.Vector<Null<Int>>;

    function isPress() : Bool;

    function isRelease() : Bool;

    function isNormal() : Bool;

    function setPress(press : Bool) : Void;

    function setRelease(release : Bool) : Void;

    function setNormal() : Void;

    function getText() : String;

    function setText(text : String) : Void;

    function log() : Void;

}

