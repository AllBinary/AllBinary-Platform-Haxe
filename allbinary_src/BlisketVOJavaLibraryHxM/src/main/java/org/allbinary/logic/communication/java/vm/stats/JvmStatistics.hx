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
package org.allbinary.logic.communication.java.vm.stats;


class JvmStatistics {
    private var runtime : Runtime;
    public function new() {
        this.runtime = Runtime.getRuntime();
    }

    public function getFreeMemoryBytes() : haxe.Int64 {
        return this.runtime.freeMemory();
    }

    public function getFreeMemoryKilobytes() : haxe.Int64 {
        return this.getFreeMemoryBytes() / 1024;
    }

    public function getFreeMemoryMegabytes() : haxe.Int64 {
        return this.getFreeMemoryKilobytes() / 1024;
    }

    public function getMaxMemoryBytes() : haxe.Int64 {
        return this.runtime.maxMemory();
    }

    public function getMaxMemoryKilobytes() : haxe.Int64 {
        return this.getMaxMemoryBytes() / 1024;
    }

    public function getMaxMemoryMegabytes() : haxe.Int64 {
        return this.getMaxMemoryKilobytes() / 1024;
    }

    public function getTotalMemoryBytes() : haxe.Int64 {
        return this.runtime.totalMemory();
    }

    public function getTotalMemoryKilobytes() : haxe.Int64 {
        return this.getTotalMemoryBytes() / 1024;
    }

    public function getTotalMemoryMegabytes() : haxe.Int64 {
        return this.getTotalMemoryKilobytes() / 1024;
    }

    public function getFreeMemoryBytesLong() : Null<haxe.Int64> {
        return this.getFreeMemoryBytes();
    }

    public function getFreeMemoryKilobytesLong() : Null<haxe.Int64> {
        return this.getFreeMemoryKilobytes();
    }

    public function getFreeMemoryMegabytesLong() : Null<haxe.Int64> {
        return this.getFreeMemoryMegabytes();
    }

    public function getMaxMemoryBytesLong() : Null<haxe.Int64> {
        return this.getMaxMemoryBytes();
    }

    public function getMaxMemoryKilobytesLong() : Null<haxe.Int64> {
        return this.getMaxMemoryKilobytes();
    }

    public function getMaxMemoryMegabytesLong() : Null<haxe.Int64> {
        return this.getMaxMemoryMegabytes();
    }

    public function getTotalMemoryBytesLong() : Null<haxe.Int64> {
        return this.getTotalMemoryBytes();
    }

    public function getTotalMemoryKilobytesLong() : Null<haxe.Int64> {
        return this.getTotalMemoryKilobytes();
    }

    public function getTotalMemoryMegabytesLong() : Null<haxe.Int64> {
        return this.getTotalMemoryMegabytes();
    }

    public function getFreeMemoryBytesString() : String {
        return Std.string(this.getFreeMemoryBytesLong());
    }

    public function getFreeMemoryKilobytesString() : String {
        return Std.string(this.getFreeMemoryKilobytesLong());
    }

    public function getFreeMemoryMegabytesString() : String {
        return Std.string(this.getFreeMemoryMegabytesLong());
    }

    public function getMaxMemoryBytesString() : String {
        return Std.string(this.getMaxMemoryBytesLong());
    }

    public function getMaxMemoryKilobytesString() : String {
        return Std.string(this.getMaxMemoryKilobytesLong());
    }

    public function getMaxMemoryMegabytesString() : String {
        return Std.string(this.getMaxMemoryMegabytesLong());
    }

    public function getTotalMemoryBytesString() : String {
        return Std.string(this.getTotalMemoryBytesLong());
    }

    public function getTotalMemoryKilobytesString() : String {
        return Std.string(this.getTotalMemoryKilobytesLong());
    }

    public function getTotalMemoryMegabytesString() : String {
        return Std.string(this.getTotalMemoryMegabytesLong());
    }

    public function getNumberOfThreads() : haxe.Int64 {
        return Thread.activeCount();
    }

    public function getNumberOfThreadsLong() : Null<haxe.Int64> {
        return this.getNumberOfThreads();
    }

    public function getNumberOfThreadsString() : String {
        return Std.string(this.getNumberOfThreadsLong());
    }

    public function collectGarbage() : Void {
        this.runtime.gc();
    }

}

