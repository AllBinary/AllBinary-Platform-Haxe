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
package org.allbinary.game.layer.weapon;

import org.allbinary.util.CircularIndexUtil;

class WeaponLayerArrayLayerCircularStaticPool {
    private static final instance : WeaponLayerArrayLayerCircularStaticPool = new WeaponLayerArrayLayerCircularStaticPool();
    public static function getInstance() : WeaponLayerArrayLayerCircularStaticPool {
        return WeaponLayerArrayLayerCircularStaticPool.instance;
    }

    private final MAX : Int = 5;
    private var circularIndexUtil : CircularIndexUtil;
    private var WEAPONLAYER_ARRAY : haxe.ds.Vector<haxe.ds.Vector<WeaponLayer>> = null;
    private var TWO_WEAPONLAYER_ARRAY : haxe.ds.Vector<haxe.ds.Vector<WeaponLayer>> = null;
    private var THREE_WEAPONLAYER_ARRAY : haxe.ds.Vector<haxe.ds.Vector<WeaponLayer>> = null;
    public function init() : Void {
        final WEAPONLAYER_ARRAY : haxe.ds.Vector<haxe.ds.Vector<WeaponLayer>> = new haxe.ds.Vector<WeaponLayer>(this.MAX * 2);
        final TWO_WEAPONLAYER_ARRAY : haxe.ds.Vector<haxe.ds.Vector<WeaponLayer>> = new haxe.ds.Vector<WeaponLayer>(this.MAX);
        final THREE_WEAPONLAYER_ARRAY : haxe.ds.Vector<haxe.ds.Vector<WeaponLayer>> = new haxe.ds.Vector<WeaponLayer>(this.MAX);
        for (index in 0...this.MAX) {
            WEAPONLAYER_ARRAY[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
            TWO_WEAPONLAYER_ARRAY[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            THREE_WEAPONLAYER_ARRAY[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...3) null]);
        }
        this.WEAPONLAYER_ARRAY = WEAPONLAYER_ARRAY;
        this.TWO_WEAPONLAYER_ARRAY = TWO_WEAPONLAYER_ARRAY;
        this.THREE_WEAPONLAYER_ARRAY = THREE_WEAPONLAYER_ARRAY;
    }

    private function getWeaponLayerArrays(size : Int) : haxe.ds.Vector<haxe.ds.Vector<WeaponLayer>> {
        if (size == 1) {
            return this.WEAPONLAYER_ARRAY;
        } else if (size == 2) {
            return this.TWO_WEAPONLAYER_ARRAY;
        } else if (size == 3) {
            return this.THREE_WEAPONLAYER_ARRAY;
        }
        throw new jre.lang.JavaException();
    }

    // throws Exception
    public function getInstanceArray(size : Int) : haxe.ds.Vector<WeaponLayer> {
        final weaponLayerArray : haxe.ds.Vector<WeaponLayer> = this.getWeaponLayerArrays(size)[this.circularIndexUtil.getIndex()];
        this.circularIndexUtil.next();
        return weaponLayerArray;
    }

    public function new() {
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.MAX);
    }
}

