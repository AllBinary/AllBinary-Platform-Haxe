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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class HighScores implements HighScoresInterface {
    private var orderedHighScoresList : BasicArrayList = new BasicArrayListD();
    private final name : String;
    private final heading : String;
    private final columnOneHeading : String = "Name";
    private final columnTwoHeading : String;
    public function new(name : String, heading : String, columnTwoHeading : String) {
        this.name = name;
        this.heading = heading;
        this.columnTwoHeading = columnTwoHeading;
    }

    public function setList(orderedHighScoresList : BasicArrayList) : Void {
        this.orderedHighScoresList = orderedHighScoresList;
    }

    public function getList() : BasicArrayList {
        return this.orderedHighScoresList;
    }

    public function getName() : String {
        return this.name;
    }

    public function getTotal() : Int {
        return this.getList().size();
    }

    public function addHighScore(newHighScore : HighScore) : Void {
        this.orderedHighScoresList.add(newHighScore);
    }

    public function getHeading() : String {
        return this.heading;
    }

    public function getColumnOneHeading() : String {
        return this.columnOneHeading;
    }

    public function getColumnTwoHeading() : String {
        return this.columnTwoHeading;
    }

    // throws Exception
    public function isBestScore(newHighScore : HighScore) : Bool {
        return false;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("HighScores: ");
        stringBuffer.append(this.heading);
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(CommonLabels.getInstance().TOTAL_LABEL);
        stringBuffer.appendint(this.orderedHighScoresList.size());
        return stringBuffer.toString();
    }

}

