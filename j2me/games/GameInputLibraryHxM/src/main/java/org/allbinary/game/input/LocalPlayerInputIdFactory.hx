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
package org.allbinary.game.input;

import org.allbinary.game.input.analog.AnalogLocationInputFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

class LocalPlayerInputIdFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : LocalPlayerInputIdFactory = new LocalPlayerInputIdFactory();
    public final MAX_NUMBER_OF_PLAYERS : Int = 6;
    private final MAX_FAST_DEVICEID : Int = 65;
    private final deviceIdToplayerId : haxe.ds.Vector<Int>;
    private final playerIdToDeviceId : haxe.ds.Vector<Int>;
    private final playersInPlay : haxe.ds.Vector<Bool>;
    private var totalDevicesMapped : Int = 0;
    public function new() {
        this.deviceIdToplayerId = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.MAX_FAST_DEVICEID) 0]);
        this.playerIdToDeviceId = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.MAX_NUMBER_OF_PLAYERS) 0]);
        this.playersInPlay = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.MAX_NUMBER_OF_PLAYERS) false]);
        {
            var index : Int = this.deviceIdToplayerId.length - 1;
            while (index >= 0) {
            this.deviceIdToplayerId[index] = -1;
                index--;
            }
        }
    }

    public static function getInstance() : LocalPlayerInputIdFactory {
        return LocalPlayerInputIdFactory.instance;
    }

    public function getDeviceId(playerInputId : Int) : Int {
        return this.playerIdToDeviceId[playerInputId];
    }

    public function getPlayerForDevice(deviceId : Int) : Int {
        var index : Int = 0;
        if (deviceId < this.MAX_FAST_DEVICEID) {
            var playerInputId : Int = this.deviceIdToplayerId[deviceId];
            if (playerInputId != -1) {
                return playerInputId;
            }
        } else {
            {
                index = this.totalDevicesMapped - 1;
                while (index >= 0) {
                if (this.playerIdToDeviceId[index] == deviceId) {
                    return index;
                }
                    index--;
                }
            }
        }
        index = this.totalDevicesMapped;
        if (deviceId < this.MAX_FAST_DEVICEID) {
            this.deviceIdToplayerId[deviceId] = index;
        } else {
            this.logUtil.putF(Std.string(new StringMaker().append("Added DeviceId: ").appendint(deviceId).append(" beyond fast Id list")), this, "getPlayerForDevice");
        }
        this.playerIdToDeviceId[index] = deviceId;
        AnalogLocationInputFactory.getInstance().addPlayer(this.totalDevicesMapped);
        this.totalDevicesMapped++;
        this.logUtil.putF(Std.string(new StringMaker().append("Added DeviceId: ").appendint(deviceId).append(" at: ").appendint(index).append(" Total: ").appendint(this.totalDevicesMapped)), this, "getPlayerForDevice");
        return index;
    }

    public function getTotalDevicesInPlay() : Int {
        var total : Int = 0;
        {
            var index : Int = this.totalDevicesMapped - 1;
            while (index >= 0) {
            if (this.playersInPlay[index] == true) {
                total++;
            }
                index--;
            }
        }
        return total;
    }

    public function isPlayerInPlay(playerInputId : Int) : Bool {
        return this.playersInPlay[playerInputId];
    }

    public function setPlayerInPlay(playerInputId : Int) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append("Setting PlayerInPlay with playerInputId: ").appendint(playerInputId)), this, "setPlayerInPlay");
        this.playersInPlay[playerInputId] = true;
    }

    public function setPlayerOutOfPlay(playerInputId : Int) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append("Setting PlayerOutOfPlay with playerInputId: ").appendint(playerInputId)), this, "setPlayerOutOfPlay");
        this.playersInPlay[playerInputId] = false;
    }

    public function getPlayersInPlay() : haxe.ds.Vector<Bool> {
        return this.playersInPlay;
    }

}

