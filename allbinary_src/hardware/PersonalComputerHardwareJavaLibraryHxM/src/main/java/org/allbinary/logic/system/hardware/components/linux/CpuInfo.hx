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
package org.allbinary.logic.system.hardware.components.linux;


class CpuInfo {
    private var name : String;
    public function new(name : String) {
        this.name = name;
    }

    public function toString() : String {
        return this.name;
    }

    public static final PROCESSOR : CpuInfo = new CpuInfo("processor");
    public static final VENDORID : CpuInfo = new CpuInfo("vendor_id");
    public static final CPUFAMILY : CpuInfo = new CpuInfo("cpu family");
    public static final MODEL : CpuInfo = new CpuInfo("model");
    public static final MODELNAME : CpuInfo = new CpuInfo("model name");
    public static final STEPPING : CpuInfo = new CpuInfo("stepping");
    public static final CPUMHZ : CpuInfo = new CpuInfo("cpu MHz");
    public static final CACHESIZE : CpuInfo = new CpuInfo("cache size");
    public static final FDIVBUG : CpuInfo = new CpuInfo("fdiv_bug");
    public static final HLTBUG : CpuInfo = new CpuInfo("hlt_bug");
    public static final F00FBUG : CpuInfo = new CpuInfo("f00f_bug");
    public static final COMABUG : CpuInfo = new CpuInfo("coma_bug");
    public static final FPU : CpuInfo = new CpuInfo("fpu");
    public static final FPUEXCEPTION : CpuInfo = new CpuInfo("fpu_exception");
    public static final CPUIDLEVEL : CpuInfo = new CpuInfo("cache size");
    public static final WP : CpuInfo = new CpuInfo("yes");
    public static final FLAGS : CpuInfo = new CpuInfo("flags");
    public static final BOGOMIPS : CpuInfo = new CpuInfo("bogomips");
}

