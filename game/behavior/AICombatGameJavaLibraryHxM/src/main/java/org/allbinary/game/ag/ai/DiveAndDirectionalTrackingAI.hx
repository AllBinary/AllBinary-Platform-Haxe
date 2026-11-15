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
package org.allbinary.game.ag.ai;

import javax.microedition.lcdui.Canvas;
import org.allbinary.ai.ArtificialIntelligenceInterface;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.direction.DirectionalCompositeInterface;
import org.allbinary.direction.DirectionalInterface;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.combat.destroy.event.DestroyedEvent;
import org.allbinary.game.combat.destroy.event.DestroyedEventHandler;
import org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface;
import org.allbinary.game.identification.Group;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.physics.velocity.BasicVelocityProperties;
import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.game.tracking.TrackingEventListenerInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class DiveAndDirectionalTrackingAI extends BasicAI implements TrackingEventListenerInterface implements DestroyedEventListenerInterface {
    private final mathUtil : MathUtil = MathUtil.getInstance();
    private final directionFactory : DirectionFactory = DirectionFactory.getInstance();
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(500);
    private final list : BasicArrayList = new BasicArrayListD();
    private final directionalInterface : DirectionalInterface;
    private final velocityInterface : BasicVelocityProperties;
    private final directionToKeyMap : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([Canvas.LEFT, Canvas.DOWN, Canvas.UP, Canvas.RIGHT]);
    private var initialDropped : Bool = false;
    private var diveP : Bool = false;
    private var directionOfTarget : Direction = Direction.getInstance(0);
    private final MIN_DISTANCE : Int = 40;
    private var lastTrackingLayerInterface : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    private final artificialIntelligenceInterface : ArtificialIntelligenceInterface;
    private final aiVistor : Visitor;
    private var lastDirection : Direction = DirectionFactory.getInstance().NO_DIRECTION;
    public function new(ownerLayerInterface : AllBinaryLayer, artificialIntelligenceInterface : ArtificialIntelligenceInterface, gameInput : GameInput, visitor : Visitor) {
        super(ownerLayerInterface, gameInput);
        this.aiVistor = visitor;
        this.artificialIntelligenceInterface = artificialIntelligenceInterface;
        var directionalCompositeInterface : DirectionalCompositeInterface = (cast this.getOwnerLayerInterface() : DirectionalCompositeInterface);
        this.directionalInterface = directionalCompositeInterface.getDirectionalInterface();
        var velocityInterfaceCompositeInterface : VelocityInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : VelocityInterfaceCompositeInterface);
        this.velocityInterface = velocityInterfaceCompositeInterface.getVelocityProperties();
        DestroyedEventHandler.getInstance().addListenerInterface(this);
        this.init();
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.isBeyondTarget()) {
            this.init();
            this.velocityInterface.zero();
        }
        if (!this.diveP) {
            this.target(allBinaryLayerManager);
        } else {
            this.dive();
            this.attack();
        }
        this.list.clear();
    }

    private function init() : Void {
        this.diveP = false;
        this.directionOfTarget = DirectionFactory.getInstance().NOT_BORDERED_WITH;
        TrackingEventHandler.getInstance().addListenerInterface(this);
    }

    // throws Exception
    private function target(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.list.size() == 0) {
            return;
        }
        var lastTrackingEvent : TrackingEvent = (cast this.list.removeAt(0) : TrackingEvent);
        this.lastTrackingLayerInterface = lastTrackingEvent.getLayerInterface();
        var layerInterface : AllBinaryLayer = this.lastTrackingLayerInterface;
        var ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        final groupArray : haxe.ds.Vector<Group> = layerInterface.getGroupInterface();
        final ownerGroupArray : haxe.ds.Vector<Group> = ownerLayerInterface.getGroupInterface();
        if (groupArray == ownerGroupArray) {
            return;
        }
        var x : Int = this.lastTrackingLayerInterface.getXP();
        var y : Int = this.lastTrackingLayerInterface.getYP();
        var yDistance : Int = ownerLayerInterface.getYP() - y - ownerLayerInterface.getHeight();
        var xDistance : Int = ownerLayerInterface.getXP() - x - ownerLayerInterface.getWidth();
        final directionFactory : DirectionFactory = DirectionFactory.getInstance();
        if (this.mathUtil.abs(yDistance) > this.mathUtil.abs(xDistance)) {
            if (yDistance > this.MIN_DISTANCE) {
                this.directionOfTarget = directionFactory.UP;
            } else if (yDistance < -this.MIN_DISTANCE) {
                this.directionOfTarget = directionFactory.DOWN;
            }
        } else {
            if (xDistance > this.MIN_DISTANCE) {
                this.directionOfTarget = directionFactory.LEFT;
            } else if (xDistance < -this.MIN_DISTANCE) {
                this.directionOfTarget = directionFactory.RIGHT;
            }
        }
        if (!this.initialDropped && this.directionOfTarget != directionFactory.NOT_BORDERED_WITH) {
            this.drop();
        }
        if (this.initialDropped) {
            if (this.directionOfTarget == directionFactory.UP || this.directionOfTarget == directionFactory.DOWN) {
                this.verticalTargeting(x);
            } else if (this.directionOfTarget == directionFactory.LEFT || this.directionOfTarget == directionFactory.RIGHT) {
                this.horizontalTargeting(y);
            } else {
                this.artificialIntelligenceInterface.processAI(allBinaryLayerManager);
            }
        }
    }

    // throws Exception
    private function verticalTargeting(x : Int) : Void {
        var ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        if (ownerLayerInterface.getXP() < x) {
            this.moveRight();
        }
        if (ownerLayerInterface.getXP() > x) {
            this.moveLeft();
        }
        if (ownerLayerInterface.getXP() > x - 3 && ownerLayerInterface.getXP() < x + 3) {
            this.setDive();
        }
    }

    // throws Exception
    private function horizontalTargeting(y : Int) : Void {
        var ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        if (ownerLayerInterface.getYP() < y) {
            this.moveDown();
        }
        if (ownerLayerInterface.getYP() > y) {
            this.moveUp();
        }
        if (ownerLayerInterface.getYP() > y - 3 && ownerLayerInterface.getYP() < y + 3) {
            this.setDive();
        }
    }

    private function setDive() : Void {
        this.diveP = true;
        this.velocityInterface.zero();
        TrackingEventHandler.getInstance().removeListener(this);
    }

    // throws Exception
    private function moveRight() : Void {
        this.setLastDirection(this.directionFactory.RIGHT);
        this.directionalInterface.setFrameByDirection(this.lastDirection);
        this.aiVistor.visit(this);
    }

    // throws Exception
    private function moveLeft() : Void {
        this.setLastDirection(this.directionFactory.LEFT);
        this.directionalInterface.setFrameByDirection(this.lastDirection);
        this.aiVistor.visit(this);
    }

    // throws Exception
    private function moveDown() : Void {
        this.setLastDirection(this.directionFactory.DOWN);
        this.directionalInterface.setFrameByDirection(this.lastDirection);
        this.aiVistor.visit(this);
    }

    // throws Exception
    private function moveUp() : Void {
        this.setLastDirection(this.directionFactory.UP);
        this.directionalInterface.setFrameByDirection(this.lastDirection);
        this.aiVistor.visit(this);
    }

    // throws Exception
    private function dive() : Void {
        this.directionalInterface.setFrameByDirection(this.directionOfTarget);
        this.aiVistor.visit(this);
    }

    // throws Exception
    private function attack() : Void {
        super.processKeyAI(Canvas.KEY_NUM1);
    }

    // throws Exception
    private function drop() : Void {
        if (this.timeDelayHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
            this.initialDropped = true;
            this.aiVistor.visit(this);
        }
    }

    private function isBeyondTarget() : Bool {
        if (this.directionOfTarget == this.directionFactory.DOWN) {
            if (this.getOwnerLayerInterface().getYP() > this.lastTrackingLayerInterface.getYP() + this.MIN_DISTANCE) {
                return true;
            } else {
                return false;
            }
        } else if (this.directionOfTarget == this.directionFactory.UP) {
            if (this.getOwnerLayerInterface().getYP() < this.lastTrackingLayerInterface.getYP() + this.MIN_DISTANCE) {
                return true;
            } else {
                return false;
            }
        } else if (this.directionOfTarget == this.directionFactory.RIGHT) {
            if (this.getOwnerLayerInterface().getXP() > this.lastTrackingLayerInterface.getXP() + this.MIN_DISTANCE) {
                return true;
            } else {
                return false;
            }
        } else if (this.directionOfTarget == this.directionFactory.LEFT) {
            if (this.getOwnerLayerInterface().getXP() < this.lastTrackingLayerInterface.getXP() + this.MIN_DISTANCE) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function onMovement(trackingEvent : TrackingEvent) : Void {
        this.list.add(trackingEvent);
    }

    public override function onDestroyed(destroyedEvent : DestroyedEvent) : Void {
        if (this.getOwnerLayerInterface() == destroyedEvent.getLayerInterface()) {
            TrackingEventHandler.getInstance().removeListener(this);
            DestroyedEventHandler.getInstance().removeListener(this);
        }
    }

    public function setLastDirection(lastDirection : Direction) : Void {
        this.lastDirection = lastDirection;
        var value : Int = this.getLastDirection().getValue();
        if (value < 4) {
            super.setLastKey(this.directionToKeyMap[value]);
        }
    }

    public override function setLastKey(lastKey : Int) : Void {
        super.setLastKey(lastKey);
        if (this.getLastKey() == Canvas.LEFT) {
            this.lastDirection = DirectionFactory.getInstance().LEFT;
        } else if (this.getLastKey() == Canvas.DOWN) {
            this.lastDirection = DirectionFactory.getInstance().DOWN;
        } else if (this.getLastKey() == Canvas.UP) {
            this.lastDirection = DirectionFactory.getInstance().UP;
        } else if (this.getLastKey() == Canvas.RIGHT) {
            this.lastDirection = DirectionFactory.getInstance().RIGHT;
        }
    }

    public function getLastDirection() : Direction {
        return this.lastDirection;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(" LastDirection: ");
        stringBuffer.append(StringUtil.getInstance().toString(this.getLastDirection()));
        return Std.string(stringBuffer);
    }

}

