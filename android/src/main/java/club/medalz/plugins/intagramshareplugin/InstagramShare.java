package club.medalz.plugins.intagramshareplugin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import androidx.core.content.FileProvider;
import com.getcapacitor.PluginCall;
import java.io.File;

public class InstagramShare {

    public void shareToInstagramStories(PluginCall call) {
        String appId = call.getString("appId");
        String backgroundImagePath = call.getString("backgroundImagePath"); // caminho local
        String stickerImagePath = call.getString("stickerImagePath"); // opcional

        Context context = call.getContext();
        Activity activity = call.getActivity();

        Intent intent = new Intent("com.instagram.share.ADD_TO_STORY");
        intent.putExtra("source_application", appId);

        if (backgroundImagePath != null) {
            Uri bgAssetUri = FileProvider.getUriForFile(
                    context,
                    context.getPackageName() + ".fileprovider",
                    new File(Uri.parse(backgroundImagePath).getPath()));
            intent.setDataAndType(bgAssetUri, "image/png");
            intent.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }

        if (stickerImagePath != null) {
            Uri stickerAssetUri = FileProvider.getUriForFile(
                    context,
                    context.getPackageName() + ".fileprovider",
                    new File(Uri.parse(stickerImagePath).getPath()));
            intent.putExtra("interactive_asset_uri", stickerAssetUri);
            activity.grantUriPermission("com.instagram.android", stickerAssetUri,
                    Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }

        if (activity.getPackageManager().resolveActivity(intent, 0) != null) {
            activity.startActivity(intent);
            call.resolve();
        } else {
            call.reject("Instagram not installed");
        }
    }
}
