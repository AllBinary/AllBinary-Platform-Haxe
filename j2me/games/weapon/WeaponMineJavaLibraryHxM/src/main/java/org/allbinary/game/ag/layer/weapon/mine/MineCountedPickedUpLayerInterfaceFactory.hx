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
package org.allbinary.game.ag.layer.weapon.mine;

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory;
import org.allbinary.game.layer.pickup.IconLayerFactory;
import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface;
import org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory;
import org.allbinary.game.layer.weapon.WeaponLayerCircularPool;
import org.allbinary.game.score.ScoreableInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.util.ABHashtable;

class MineCountedPickedUpLayerInterfaceFactory extends CountedPickedUpLayerInterfaceFactory {
    private final weaponLayerCircularStaticPool : WeaponLayerCircularPool = MineLayerCircularStaticPool.getInstance();
    private static var pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY;
    // throws Exception
    public static function init() : Void {
        MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = new MineCountedPickedUpLayerInterfaceFactory();
    }

    public function new() {
        super(PickedUpLayerTypeFactory.getInstance().MINE, IconLayerFactory.getInstance(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(MineWeaponResources.getInstance().DROP_ICON_RESOURCE).getInstance(0), 10, 10), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(MineWeaponResources.getInstance().DROP_RESOURCE).getInstance(0));
    }

    public static function getInstance() : PickedUpLayerInterfaceFactoryInterface {
        return MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface;
    }

    public override function getTotal() : Int {
        return 3;
    }

    private final weaponProperties : WeaponProperties = new WeaponProperties(-haxe.Int64.ofInt(1), -haxe.Int64.ofInt(1), 0, 8000, 10);
    private final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
    // throws Exception
    public override function getNextInstance(hashtable : ABHashtable<Any, Any>, x : Int, y : Int, z : Int) : AllBinaryLayer {
        final sourceLayerInterface : AllBinaryLayer = (cast hashtable.get((cast this.smallIntegerSingletonFactory.getAt(0) : Any)) : AllBinaryLayer);
        final angle : Null<Int> = (cast hashtable.get((cast this.smallIntegerSingletonFactory.getAt(1) : Any)) : Null<Int>);
        final scoreableInterface : ScoreableInterface = (cast sourceLayerInterface : ScoreableInterface);
        return this.weaponLayerCircularStaticPool.getInstanceWeaponLayer(sourceLayerInterface, x, y, z, Std.int(Std.int(angle)), 0, this.weaponProperties, scoreableInterface);
    }

}

