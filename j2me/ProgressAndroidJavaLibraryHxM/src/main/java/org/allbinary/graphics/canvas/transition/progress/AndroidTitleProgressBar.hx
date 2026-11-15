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
package org.allbinary.graphics.canvas.transition.progress;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.android.activity.NullProgressActivity;
import org.allbinary.android.activity.ProgressActivityInterface;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class AndroidTitleProgressBar extends ProgressCanvas {
    // Java inner class: Haxe does not nest classes so move this to its own module
    class TitleProgressBarSetProgressRunnable implements Runnable {
        private final androidTitleProgressBar : AndroidTitleProgressBar;
        public function new(androidTitleProgressBar : AndroidTitleProgressBar) {
            this.androidTitleProgressBar = androidTitleProgressBar;
        }

        public function run() : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            try {
                final value : Int = Std.int(this.androidTitleProgressBar.getValue());
                this.androidTitleProgressBar.progressActivity.onTitleProgressBarSetProgress(value);
            } catch (e : haxe.Exception) {
                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            }
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class TitleProgressBarPortionSetProgressRunnable implements Runnable {
        private final androidTitleProgressBar : AndroidTitleProgressBar;
        public function new(androidTitleProgressBar : AndroidTitleProgressBar) {
            this.androidTitleProgressBar = androidTitleProgressBar;
        }

        public function run() : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            try {
                final value : Int = Std.int((this.androidTitleProgressBar.getValue() + this.androidTitleProgressBar.getMaxValue() / this.androidTitleProgressBar.portion));
                this.androidTitleProgressBar.progressActivity.onTitleProgressBarSetProgress(value);
            } catch (e : haxe.Exception) {
                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            }
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ShowTitleProgressBarRunnable implements Runnable {
        private final androidTitleProgressBar : AndroidTitleProgressBar;
        public function new(androidTitleProgressBar : AndroidTitleProgressBar) {
            this.androidTitleProgressBar = androidTitleProgressBar;
        }

        public function run() : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            try {
                final maxValue : Int = Std.int(this.androidTitleProgressBar.getMaxValue());
                this.androidTitleProgressBar.progressActivity.onShowTitleProgressBar(maxValue, false);
            } catch (e : haxe.Exception) {
                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            }
        }

    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class DismissTitleProgressBarRunnable implements Runnable {
        private final androidTitleProgressBar : AndroidTitleProgressBar;
        public function new(androidTitleProgressBar : AndroidTitleProgressBar) {
            this.androidTitleProgressBar = androidTitleProgressBar;
        }

        public function run() : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            try {
                this.androidTitleProgressBar.progressActivity.onDismissTitleProgressBar();
            } catch (e : haxe.Exception) {
                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            }
        }

    }
    private var showTitleProgressBarRunnable : ShowTitleProgressBarRunnable = new ShowTitleProgressBarRunnable(this);
    private var dismissTitleProgressBarRunnable : DismissTitleProgressBarRunnable = new DismissTitleProgressBarRunnable(this);
    private var progressDialogPortionSetProgressRunnable : TitleProgressBarPortionSetProgressRunnable = new TitleProgressBarPortionSetProgressRunnable(this);
    private var progressDialogSetProgressRunnable : TitleProgressBarSetProgressRunnable = new TitleProgressBarSetProgressRunnable(this);
    private var progressActivity : ProgressActivityInterface = NullProgressActivity.NULL_PROGRESS_ACTIVITY;
    private var portion : Int = 0;
    public function new(title : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, backgroundBasicColor, foregroundBasicColor);
    }

    public function init(activity : ProgressActivityInterface) : Void {
        this.progressActivity = activity;
    }

    public function isInitialized() : Bool {
        if (this.progressActivity != NullProgressActivity.NULL_PROGRESS_ACTIVITY) {
            return true;
        } else {
            return false;
        }
    }

    public override function start() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.START_METHOD_NAME);
            super.start();
            this.progressActivity.runOnUiThread(this.showTitleProgressBarRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.START_METHOD_NAME, e);
        }
    }

    public override function end() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.END_METHOD_NAME);
            this.progressActivity.runOnUiThread(this.dismissTitleProgressBarRunnable);
            super.end();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.END_METHOD_NAME, e);
        }
    }

    public override function addPortion(value : Int, text : String, index : Int) : Void {
        try {
            super.addPortion(value, text, index);
            this.portion = value;
            this.progressActivity.runOnUiThread(this.progressDialogPortionSetProgressRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.ADD_PORTION, e);
        }
    }

    public override function addNormalPortion(value : Int, text : String) : Void {
        try {
            super.addNormalPortion(value, text);
            this.portion = value;
            this.progressActivity.runOnUiThread(this.progressDialogPortionSetProgressRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.ADD_PORTION, e);
        }
    }

    public override function setValue(value : Int) : Void {
        try {
            super.setValue(value);
            this.progressActivity.runOnUiThread(this.progressDialogSetProgressRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "setValue", e);
        }
    }

    public function waitUntilDisplayed() : Void {
    }

    public override function paint(graphics : Graphics) : Void {
    }

}

