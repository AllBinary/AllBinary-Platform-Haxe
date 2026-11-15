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
package org.allbinary.game.ag.layer.hud.basic;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.business.advertisement.GameAdStateFactory;
import org.allbinary.canvas.Processor;
import org.allbinary.game.GameAdState;
import org.allbinary.game.ag.layer.hud.basic.notification.GameNotification;
import org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.graphics.CustomGPoint;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.CircularIndexUtil;

class PlayerGameNotificationHud extends GameNotificationHud implements UpdateMyFontInterface {
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    private final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
    private final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(0);
    private final circularIndexUtil : CircularIndexUtil;
    private final gameNotification : GameNotification = new GameNotification();
    private final permanentGameNotification : GameNotification = new GameNotification();
    private final setAndRemoveProcessor : Processor;
    private final nextUnremoveableProcessor : Processor;
    private var processor : Processor = Processor.getInstance();
    private final PERMANENT_GAME_NOTIFICATION : String = "Permanent Game Notification: ";
    private var lastString : String = StringUtil.getInstance().EMPTY_STRING;
    private var string : String;
    private var point : CustomGPoint = CustomGPoint.NULL_CUSTOM_POINT;
    private var width : Int = 0;
    public function new(location : Int, direction : Int, bufferZone : Int, basicColor : BasicColor) {
        super(location, direction, bufferZone, basicColor);
        this.setAndRemoveProcessor = new SetAndRemoveProcessor(this);
        this.nextUnremoveableProcessor = new NextUnremoveableProcessor(this);
        this.string = this.EMPTY_STRING;
        this.circularIndexUtil = CircularIndexUtil.createInstance(0);
        final gameNotificationEventHandler : GameNotificationEventHandler = GameNotificationEventHandler.getInstance();
        gameNotificationEventHandler.removeAllListeners();
        gameNotificationEventHandler.addListenerInterface(this);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        try {
            super.updateMeasurement(graphics);
            final font : Font = graphics.getFont();
            this.width = font.stringWidth(this.string);
            this.processor.process();
            this.processor = Processor.getInstance();
        } catch (e : haxe.Exception) {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.UPDATE, e);
        }
    }

    public override function getPoint(x : Int, y : Int) : GPoint {
        this.point = CustomGPoint.getInstance3(0, 0);
        this.point.setX(x);
        this.point.setY(y);
        return this.point;
    }

    public override function add(string : String, seconds : Null<Int>, basicColor : BasicColor, permanent : Null<Bool>) : Void {
        if (permanent) {
            if (this.lastString != string) {
                this.lastString = string;
                this.logUtil.putF(Std.string(new StringMaker().append(this.PERMANENT_GAME_NOTIFICATION).append(string)), this, this.commonStrings.ADD);
            }
            this.permanentGameNotification.add(string, seconds, basicColor);
            this.circularIndexUtil.setSize(this.permanentGameNotification.getSize());
        } else {
            this.gameNotification.add(string, seconds, basicColor);
        }
    }

    // throws Exception
    public override function processTick() : Void {
        if (this.timeDelayHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
            final gameAdState : GameAdState = GameAdStateFactory.getInstance().getCurrentInstance();
            if (gameAdState.isShowingAtLocation(this.getLocation())) {
                this.offsetY = -54;
            } else {
                this.offsetY = 0;
            }
            if (this.gameNotification.getSize() > 0) {
                this.setAndRemove();
            } else if (this.permanentGameNotification.getSize() > 0) {
                this.setNextUnremoveable();
            } else {
                this.string = this.EMPTY_STRING;
            }
        }
    }

    // throws Exception
    private function setAndRemove() : Void {
        this.string = (cast this.gameNotification.stringList.removeAt(0) : String);
        this.processor = this.setAndRemoveProcessor;
    }

    // throws Exception
    public function setAndRemoveProcess() : Void {
        this.setX((this.displayInfo.getLastWidth() - this.width) >> 1);
        this.point.setX(this.getX());
        this.point.setY(this.getY());
        final time : Null<Int> = (cast this.gameNotification.timeList.removeAt(0) : Null<Int>);
        var iTime : Int = Std.int(time) * 1000;
        if (iTime == 0) {
            iTime = 500;
        }
        this.timeDelayHelper.delay = iTime;
        this.setBasicColorP((cast this.gameNotification.colorList.removeAt(0) : BasicColor));
    }

    // throws Exception
    private function setNextUnremoveable() : Void {
        final index : Int = this.circularIndexUtil.getIndex();
        this.string = (cast this.permanentGameNotification.stringList.objectArray[index] : String);
        this.processor = this.nextUnremoveableProcessor;
    }

    // throws Exception
    public function setNextUnremoveableProcess() : Void {
        final index : Int = this.circularIndexUtil.getIndex();
        this.setX((this.displayInfo.getLastWidth() - this.width) >> 1);
        this.point.setX(this.getX());
        this.point.setY(this.getY());
        var time : Null<Int> = (cast this.permanentGameNotification.timeList.objectArray[index] : Null<Int>);
        this.timeDelayHelper.delay = Std.int(time) * 1000;
        this.setBasicColorP((cast this.permanentGameNotification.colorList.objectArray[index] : BasicColor));
        this.circularIndexUtil.next();
    }

    public override function clear() : Void {
        this.gameNotification.clear();
        this.permanentGameNotification.clear();
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        super.paintString(graphics, this.string);
    }

}

