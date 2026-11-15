/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.building;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.ag.layer.hud.basic.NumberStringHud;
import org.allbinary.game.ag.layer.hud.basic.NumberStringHudFactory;
import org.allbinary.game.layer.SelectionHudPaintable;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.game.layer.NullPathFindingLayer;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.logic.math.MathUtil;

class BuildingInfoHudPaintable extends SelectionHudPaintable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : BuildingInfoHudPaintable = new BuildingInfoHudPaintable();
    public static function getInstance() : BuildingInfoHudPaintable {
        return BuildingInfoHudPaintable.instance;
    }

    private final HEALTH : String = "Health:";
    private final productivityHud : NumberStringHud;
    private final efficiencyHud : NumberStringHud;
    private final healthHud : NumberStringHud;
    private final maxHealthHud : NumberStringHud;
    private var rtsLayer : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    private var currentHealth : Int = 0;
    public function new() {
        super();
        final numberStringHudFactory : NumberStringHudFactory = NumberStringHudFactory.getInstance();
        var productivityHud : NumberStringHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD;
        var efficiencyHud : NumberStringHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD;
        var healthHud : NumberStringHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD;
        var maxHealthHud : NumberStringHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD;
        try {
            var index : Int = 0;
            final basicHudFactory : BasicHudFactory = BasicHudFactory.getInstance();
            final basicColor : BasicColor = this.getBasicColorP();
            final textX : Int = this.textX;
            final y : Int = this.y;
            final firstIndex : Int = index;
            // Java inner class: Haxe does not nest classes so move this to its own module
            class ProductivityNumberStringHud extends NumberStringHud {
                public function new() {
                    super("Productivity:", 999, basicHudFactory.ABSOLUTE, basicHudFactory.HORIZONTAL, 0, basicColor);
                }

                public override function updateMeasurement(graphics : Graphics) : Void {
                    final font : Font = graphics.getFont();
                    this.updateMaxWidth = textX;
                    this.updateMaxHeight = y + ((firstIndex + 1) * font.getHeight());
                    super.updateMeasurement(graphics);
                }

            }
            productivityHud = new ProductivityNumberStringHud();
            index++;
            final secondIndex : Int = index;
            // Java inner class: Haxe does not nest classes so move this to its own module
            class EfficiencyNumberStringHud extends NumberStringHud {
                public function new() {
                    super("Efficiency:", 999, basicHudFactory.ABSOLUTE, basicHudFactory.HORIZONTAL, 0, basicColor);
                }

                public override function updateMeasurement(graphics : Graphics) : Void {
                    super.updateMeasurement(graphics);
                    final font : Font = graphics.getFont();
                    this.updateMaxWidth = textX;
                    this.updateMaxHeight = y + ((secondIndex + 1) * font.getHeight());
                }

            }
            efficiencyHud = new EfficiencyNumberStringHud();
            index++;
            final HEALTH : String = this.HEALTH;
            final thirdIndex : Int = index;
            // Java inner class: Haxe does not nest classes so move this to its own module
            class HealthNumberStringHud extends NumberStringHud {
                public function new() {
                    super(HEALTH, 99999, basicHudFactory.ABSOLUTE, basicHudFactory.HORIZONTAL, 0, basicColor);
                }

                public override function updateMeasurement(graphics : Graphics) : Void {
                    final font : Font = graphics.getFont();
                    this.updateMaxWidth = textX;
                    this.updateMaxHeight = y + ((thirdIndex + 1) * font.getHeight());
                    super.updateMeasurement(graphics);
                }

            }
            final totalLength : Int = HEALTH.length + 1;
            healthHud = new HealthNumberStringHud();
            final fourthIndex : Int = index;
            // Java inner class: Haxe does not nest classes so move this to its own module
            class MaxHealthNumberStringHud extends NumberStringHud {
                public function new() {
                    super("/ ", 99999, basicHudFactory.ABSOLUTE, basicHudFactory.HORIZONTAL, 0, basicColor);
                }

                public override function updateMeasurement(graphics : Graphics) : Void {
                    super.updateMeasurement(graphics);
                    final font : Font = graphics.getFont();
                    this.updateMaxWidth = textX + (totalLength * font.getHeight());
                    this.updateMaxHeight = y + ((fourthIndex + 1) * font.getHeight());
                }

            }
            maxHealthHud = new MaxHealthNumberStringHud();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
        this.productivityHud = productivityHud;
        this.efficiencyHud = efficiencyHud;
        this.healthHud = healthHud;
        this.maxHealthHud = maxHealthHud;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        final totalLength : Int = this.HEALTH.length + MathUtil.getInstance().getTotalDigits(this.currentHealth);
        this.maxHealthHud.setX(this.textX + MyFontProcessor.defaultStringWidth(font, totalLength));
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        super.setBasicColorP(basicColor);
        this.productivityHud.setBasicColorP(basicColor);
        this.efficiencyHud.setBasicColorP(basicColor);
        this.healthHud.setBasicColorP(basicColor);
        this.maxHealthHud.setBasicColorP(basicColor);
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        this.myFontProcessor.process(graphics);
        this.productivityHud.paint(graphics);
        this.efficiencyHud.paint(graphics);
        this.healthHud.paint(graphics);
        this.maxHealthHud.paint(graphics);
        this.getAnimationInterface().paintXY(graphics, this.imageX, this.y);
    }

    public override function updateSelectionInfo() : Void {
        final buildingLayer : BuildingLayer = (cast this.rtsLayer : BuildingLayer);
        this.setName(buildingLayer.getName());
        this.setAnimationInterface(buildingLayer.getVerticleBuildAnimationInterface());
        this.productivityHud.set(buildingLayer.getProductivity());
        this.efficiencyHud.set(buildingLayer.getEfficiency() / 100);
        this.currentHealth = buildingLayer.getHealthInterface().getHealth();
        this.healthHud.set(this.currentHealth);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.maxHealthHud.set(buildingLayer.getHealthInterface().getMaxHealth());
    }

    public function setRtsLayer(rtsLayer : PathFindingLayerInterface) : Void {
        this.rtsLayer = rtsLayer;
    }

}

