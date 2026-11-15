// Generated Code Do Not Modify
package org.allbinary.configuration;

import jre.io.Closeable;
import jre.io.InputStream;
import jre.io.OutputStream;
import org.allbinary.game.configuration.feature.Feature;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbDataInputStream;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.FileStreamFactory;
import org.allbinary.logic.io.NullCloseable;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
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
    private final FILE : String = "ReloadConfiguration.dat";
    public function new() {
        try {
            if (FileFactory.getInstance().isFile(this.FILE)) {
                this.read();
            } else {
                this.write();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
    }

    // throws Exception
    private function read() : Void {
        final fileInputStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
        final fileInputStream : InputStream = fileInputStreamFactory.getFileInputStreamInstance(StringUtil.getInstance().EMPTY_STRING, this.FILE);
        final dataInputStream : AbDataInputStream = new AbDataInputStream(fileInputStream);
        var fullScreen : Int = dataInputStream.readInt();
        if (fullScreen == 0) {
            this.setFullscreen(false);
        } else if (fullScreen == 1) {
            this.setFullscreen(true);
        } else {
            throw new jre.lang.JavaException("Invalid FullScreen ActivityConfiguration");
        }
        final progressBarView : Int = dataInputStream.readInt();
        if (progressBarView == 0) {
            this.setProgressBarView(false);
        } else if (progressBarView == 1) {
            this.setProgressBarView(true);
        } else {
            throw new jre.lang.JavaException("Invalid ProgressBarView ActivityConfiguration");
        }
        final showTitleBar : Int = dataInputStream.readInt();
        if (showTitleBar == 0) {
            this.setShowTitleBar(false);
        } else if (showTitleBar == 1) {
            this.setShowTitleBar(true);
        } else {
            throw new jre.lang.JavaException("Invalid ShowTitleBar ActivityConfiguration");
        }
        this.logUtil.putF("Read Configuration: " + Std.string(this), this, "read");
    }

    // throws Exception
    public function write() : Void {
        var closeable : Closeable = NullCloseable.NULL_CLOSEABLE;
        try {
            this.logUtil.putF("Write Configuration: " + Std.string(this), this, "write");
            final fileInputStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
            final fileOutputStream : OutputStream = fileInputStreamFactory.getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, this.FILE);
            final dataOutputStream : AbDataOutputStream = new AbDataOutputStream(fileOutputStream);
            closeable = dataOutputStream;
            if (this.isFullscreen()) {
                dataOutputStream.writeInt(1);
            } else {
                dataOutputStream.writeInt(0);
            }
            if (this.isProgressBarView()) {
                dataOutputStream.writeInt(1);
            } else {
                dataOutputStream.writeInt(0);
            }
            if (this.isShowTitleBar()) {
                dataOutputStream.writeInt(1);
            } else {
                dataOutputStream.writeInt(0);
            }
            dataOutputStream.flush();
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(closeable);
        }
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

