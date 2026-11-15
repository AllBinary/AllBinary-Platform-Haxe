// Generated Code Do Not Modify
package org.allbinary.configuration;

import org.allbinary.game.configuration.feature.Feature;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class ApplicationConfiguration {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : ApplicationConfiguration {
        if (ApplicationConfiguration.instance == NullUtil.getInstance().NULL_OBJECT) {
            ApplicationConfiguration.instance = new ApplicationConfiguration();
        }
        return (cast ApplicationConfiguration.instance : ApplicationConfiguration);
    }

    private var fullscreen : Bool = true;
    private var showTitleBar : Bool = false;
    private var progressBarView : Bool = false;
    public function new() {
        try {
            this.read();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
    }

    // throws Exception
    private function read() : Void {
        this.setFullscreen(true);
        this.setProgressBarView(false);
        this.setShowTitleBar(false);
        this.logUtil.putF("Read Configuration: " + Std.string(this), this, "read");
    }

    // throws Exception
    public function write() : Void {
    }

    // throws Exception
    public function update(gameFeature : Feature) : Void {
        if (gameFeature == MainFeatureFactory.getInstance().FULL_SCREEN) {
            final features : Features = Features.getInstance();
            if (features.isFeature(gameFeature)) {
                if (!this.isFullscreen()) {
                    this.setFullscreen(true);
                    this.write();
                }
            } else {
                if (this.isFullscreen()) {
                    this.setFullscreen(false);
                    this.write();
                }
            }
        }
    }

    public function setFullscreen(fullscreen : Bool) : Void {
        this.fullscreen = fullscreen;
    }

    public function isFullscreen() : Bool {
        return this.fullscreen;
    }

    public function setShowTitleBar(showTitleBar : Bool) : Void {
        this.showTitleBar = showTitleBar;
    }

    public function isShowTitleBar() : Bool {
        return this.showTitleBar;
    }

    public function setProgressBarView(progressBarView : Bool) : Void {
        this.progressBarView = progressBarView;
    }

    public function isProgressBarView() : Bool {
        return this.progressBarView;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("isFullscreen: ");
        stringBuffer.appendboolean(this.isFullscreen());
        stringBuffer.append(" isProgressBarView: ");
        stringBuffer.appendboolean(this.isProgressBarView());
        stringBuffer.append(" isShowTitleBar: ");
        stringBuffer.appendboolean(this.isShowTitleBar());
        return Std.string(stringBuffer);
    }

}

