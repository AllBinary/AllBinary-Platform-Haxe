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
package org.allbinary.game.layer.pickup;

import org.allbinary.game.health.HealthInterfaceCompositeInterface;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.part.CountedLayerInterfaceFactoryPart;
import org.allbinary.game.part.PartInterface;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;

class PickupBehavior implements PickupBehaviorInterface {
    public static var NULL_PICKUP_BEHAVIOR : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : PickupBehavior {
        if (PickupBehavior.NULL_PICKUP_BEHAVIOR == NullUtil.getInstance().NULL_OBJECT) {
            PickupBehavior.NULL_PICKUP_BEHAVIOR = new PickupBehavior(CollidableCompositeLayer.getNullInstance(), 0);
        }
        return (cast PickupBehavior.NULL_PICKUP_BEHAVIOR : PickupBehavior);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final countedIndex : Int;
    private final ownerLayerInterface : CollidableCompositeLayer;
    public function new(ownerLayerInterface : CollidableCompositeLayer, countedIndex : Int) {
        this.ownerLayerInterface = ownerLayerInterface;
        this.countedIndex = countedIndex;
    }

    public function doPickup(pickupProcessorInterface : PickupProcessorInterface) : Void {
        try {
            final healthInterfaceCompositeInterface : HealthInterfaceCompositeInterface = (cast this.ownerLayerInterface : HealthInterfaceCompositeInterface);
            if (healthInterfaceCompositeInterface.getHealthInterface().isAlive()) {
                pickupProcessorInterface.process(this.ownerLayerInterface);
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "doPickup", e);
        }
    }

    public function doPickupLayer(pickupLayerInterface : PickedUpLayerInterface) : Void {
        try {
            final pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface = pickupLayerInterface.getPickedUpLayerInterfaceFactoryInterface();
            final pickedUpLayerType : PickedUpLayerType = pickedUpLayerInterfaceFactoryInterface.getPickedUpLayerType();
            final pickedUpLayerTypeFactory : PickedUpLayerTypeFactory = PickedUpLayerTypeFactory.getInstance();
            if (pickedUpLayerType == pickedUpLayerTypeFactory.BEAM || pickedUpLayerType == pickedUpLayerTypeFactory.MINE || pickedUpLayerType == pickedUpLayerTypeFactory.PROJECTILE || pickedUpLayerType == pickedUpLayerTypeFactory.ENHANCEMENT) {
                this.add((cast pickedUpLayerInterfaceFactoryInterface : CountedPickedUpLayerInterfaceFactoryInterface));
            } else if (pickedUpLayerInterfaceFactoryInterface.getPickedUpLayerType() == pickedUpLayerTypeFactory.PART) {
                final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast this.ownerLayerInterface : CollidableDestroyableDamageableLayer);
                collidableDestroyableDamageableLayer.addPart(pickedUpLayerInterfaceFactoryInterface);
            } else if (pickedUpLayerType == pickedUpLayerTypeFactory.NONE) {
            } else {
                final pickupProcessorInterface : PickupProcessorInterface = (cast pickedUpLayerInterfaceFactoryInterface : PickupProcessorInterface);
                this.doPickup(pickupProcessorInterface);
            }
            pickupLayerInterface.setPickedUp();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, "doPickup", e);
        }
    }

    public function add(countedPickedUpLayerInterfaceFactoryInterface : CountedPickedUpLayerInterfaceFactoryInterface) : Void {
        final partIndex : Int = countedPickedUpLayerInterfaceFactoryInterface.getId() + this.countedIndex;
        this.addAt(countedPickedUpLayerInterfaceFactoryInterface, partIndex);
    }

    public function addAt(countedPickedUpLayerInterfaceFactoryInterface : CountedPickedUpLayerInterfaceFactoryInterface, partIndex : Int) : Void {
        final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast this.ownerLayerInterface : CollidableDestroyableDamageableLayer);
        final countedLayerInterfaceFactory : CountedLayerInterfaceFactoryPart = (cast collidableDestroyableDamageableLayer.getPartInterfaceArray()[partIndex] : CountedLayerInterfaceFactoryPart);
        countedLayerInterfaceFactory.setTotal(countedLayerInterfaceFactory.getTotal() + countedPickedUpLayerInterfaceFactoryInterface.getTotal());
    }

    public function getFirstAvailableCountedLayerInterfaceFactory(pickedUpLayerTypeArray : haxe.ds.Vector<PickedUpLayerType>) : CountedLayerInterfaceFactoryPart {
        final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast this.ownerLayerInterface : CollidableDestroyableDamageableLayer);
        final partInterfaceArray : haxe.ds.Vector<PartInterface> = collidableDestroyableDamageableLayer.getPartInterfaceArray();
        final size : Int = partInterfaceArray.length;
        var nextCountedLayerInterfaceFactory : CountedLayerInterfaceFactoryPart = null;
        var countedPickedUpLayerInterfaceFactory : CountedPickedUpLayerInterfaceFactory = null;
        for (index in this.countedIndex...size) {
            nextCountedLayerInterfaceFactory = (cast collidableDestroyableDamageableLayer.getPartInterfaceArray()[index] : CountedLayerInterfaceFactoryPart);
            countedPickedUpLayerInterfaceFactory = nextCountedLayerInterfaceFactory.getCountedPickedUpLayerInterfaceFactory();
            {
                var index2 : Int = pickedUpLayerTypeArray.length;
                while (--index2 >= 0) {
                if (countedPickedUpLayerInterfaceFactory.getPickedUpLayerType() == pickedUpLayerTypeArray[index2]) {
                    if (nextCountedLayerInterfaceFactory.getTotal() > 0) {
                        return nextCountedLayerInterfaceFactory;
                    }
                }
                }
            }
        }
        return CountedLayerInterfaceFactoryPart.NULL_COUNTED_LAYER_INTERFACE_FACTORY;
    }

    // throws Exception
    public function getCountedLayerInterfaceFactoryForSlot(slotIndex : Int) : CountedLayerInterfaceFactoryPart {
        var currentSlot : Int = 0;
        final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast this.ownerLayerInterface : CollidableDestroyableDamageableLayer);
        final partInterfaceArray : haxe.ds.Vector<PartInterface> = collidableDestroyableDamageableLayer.getPartInterfaceArray();
        final size : Int = partInterfaceArray.length;
        var nextCountedLayerInterfaceFactory : CountedLayerInterfaceFactoryPart = null;
        for (index in this.countedIndex...size) {
            nextCountedLayerInterfaceFactory = (cast collidableDestroyableDamageableLayer.getPartInterfaceArray()[index] : CountedLayerInterfaceFactoryPart);
            if (nextCountedLayerInterfaceFactory.getTotal() > 0) {
                if (currentSlot == slotIndex) {
                    return nextCountedLayerInterfaceFactory;
                } else {
                    currentSlot++;
                }
            }
        }
        return CountedLayerInterfaceFactoryPart.NULL_COUNTED_LAYER_INTERFACE_FACTORY;
    }

    public function getCountedIndex() : Int {
        return this.countedIndex;
    }

}

