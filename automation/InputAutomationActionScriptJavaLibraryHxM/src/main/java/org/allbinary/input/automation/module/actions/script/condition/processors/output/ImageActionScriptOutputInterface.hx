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
package org.allbinary.input.automation.module.actions.script.condition.processors.output;


interface ImageActionScriptOutputInterface extends ProfileActionScriptOutputInterface {
    function getImageTypes() : ImageTypes;

    function setImageTypes(imageTypes : ImageTypes) : Void;

    function isSaved() : Bool;

    function setSaved(saved : Bool) : Void;

    function isDisplay() : Bool;

    function setDisplay(display : Bool) : Void;

    function log() : Void;

}

