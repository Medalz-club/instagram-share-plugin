package club.medalz.plugins.intagramshareplugin;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "InstagramShare")
public class InstagramSharePlugin extends Plugin {

    private InstagramShare implementation = new InstagramShare();

    @PluginMethod
    public void shareToInstagramStories(PluginCall call) {
        implementation.shareToInstagramStories(call);
    }
}
