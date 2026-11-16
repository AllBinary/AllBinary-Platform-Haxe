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
package org.allbinary.logic.system.hardware.components.interfaces;


interface CpuInterface {
    function getProcessor() : String;

    function getVendorId() : String;

    function getCpuFamily() : String;

    function getModel() : String;

    function getModelName() : String;

    function getStepping() : String;

    function getCpuSpeed() : String;

    function getCacheSize() : String;

    function compareTo(...args : Dynamic) : Dynamic;

    function compareTo_CpuInterface(cpuInterface : CpuInterface) : Bool;

}

