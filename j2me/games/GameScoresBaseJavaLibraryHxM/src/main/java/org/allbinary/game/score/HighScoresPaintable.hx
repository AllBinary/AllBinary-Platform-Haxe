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
package org.allbinary.game.score;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.ColorChangeEvent;
import org.allbinary.graphics.color.ColorChangeListener;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.util.BasicArrayList;

class HighScoresPaintable extends Paintable implements ColorChangeListener implements UpdateMyFontInterface {
    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private var myFontProcessor : MyFontProcessor;
    private var basicColor : BasicColor = BasicColorFactory.getInstance().WHITE;
    private var highScores : HighScores = NullHighScoresSingletonFactory.getInstance();
    private var anchor : Int = Anchor.TOP_LEFT;
    private var charHeight : Int = 0;
    public function new() {
        super();
        this.myFontProcessor = new UpdateMyFontProcessor(this);
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.charHeight = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        final colorChangeEvent : ColorChangeEvent = (cast eventObject : ColorChangeEvent);
        this.basicColor = colorChangeEvent.getBasicColorP();
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final width : Int = this.displayInfoSingleton.getLastWidth();
        final height : Int = this.displayInfoSingleton.getLastHeight();
        graphics.setColor(jre.lang.JavaObject.intValue(this.getBasicColorP()));
        var heading : String = this.highScores.getHeading();
        final topScoresWidth : Int = (graphics.getFont().stringWidth(heading) >> 1);
        final charHeight : Int = this.charHeight;
        graphics.drawString(heading, (width >> 1) - topScoresWidth, charHeight, this.anchor);
        graphics.drawString(this.highScores.getColumnOneHeading(), 10, charHeight * 3, this.anchor);
        var columnTwoHeading : String = this.highScores.getColumnTwoHeading();
        final columnTwoHeadingWidth : Int = graphics.getFont().stringWidth(columnTwoHeading);
        graphics.drawString(columnTwoHeading, width - 10 - columnTwoHeadingWidth, charHeight * 3, this.anchor);
        var index : Int = 4;
        var largestSecondColumnWidth : Int = columnTwoHeadingWidth;
        var list : BasicArrayList = this.highScores.getList();
        var size : Int = list.size();
        var vectorIndex : Int = 0;
        var highScore : HighScore = null;
        while (vectorIndex < size && charHeight * index < height - (charHeight * 2)) {
            highScore = (cast list.objectArray[vectorIndex] : HighScore);
            var nextScoreWidth : Int = graphics.getFont().stringWidth(highScore.getScoreString());
            if (nextScoreWidth > largestSecondColumnWidth) {
                largestSecondColumnWidth = nextScoreWidth;
            }
            vectorIndex++;
        }
        vectorIndex = 0;
        while (vectorIndex < size && charHeight * index < height - (charHeight * 2)) {
            highScore = (cast list.objectArray[vectorIndex] : HighScore);
            graphics.drawString(highScore.getName(), 10, charHeight * index, this.anchor);
            graphics.drawString(highScore.getScoreString(), width - 10 - largestSecondColumnWidth, charHeight * index, this.anchor);
            index++;
            vectorIndex++;
        }
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function setHighScores(highScores : HighScores) : Void {
        this.highScores = highScores;
    }

}

