package txu.enseeiht.camera_application;

import android.content.Context;
import android.hardware.Camera;
import android.util.AttributeSet;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import androidx.annotation.NonNull;

import java.io.IOException;

public class Preview extends SurfaceView implements SurfaceHolder.Callback {
    private SurfaceHolder surfaceholder;
    private Camera camera;

    private static final String TAG = "Intent Activity";

    public Preview(Context context, Camera camera) {
        super(context);
        this.camera = camera;
        // Install a surfaceholder.callback -> get notified when the surface is created or destroyed
        surfaceholder = getHolder();
        surfaceholder.addCallback(this);
        surfaceholder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
        
    }

    @Override
    public void surfaceCreated(@NonNull SurfaceHolder surfaceHolder) {
        try {
            camera.setPreviewDisplay(surfaceHolder);
        } catch (IOException e) {
            Log.d(TAG, "Error setting camera preview: " + e.getMessage());
        }

    }

    @Override
    public void surfaceChanged(@NonNull SurfaceHolder surfaceHolder, int i, int i1, int i2) {
        // If your preview can change or rotate, take care of those events here.
        // Make sure to stop the preview before resizing or reformatting it.
        if (surfaceholder.getSurface() == null){
        // preview surface does not exist
            return;
        }
        // stop preview before making changes
        try {
            camera.stopPreview();
        } catch (Exception e){
        // ignore: tried to stop a non-existent preview
        }
        // set preview size and make any resize, rotate or
        // reformatting changes here
        Camera.Parameters myParameters = camera.getParameters();
        Camera.Size myBestSize = getBestPreviewSize(i1, i2, myParameters);
        myParameters.setPreviewSize(myBestSize.width, myBestSize.height);
        camera.setParameters(myParameters);
        // start preview with new settings
        try {
            camera.setPreviewDisplay(surfaceholder);
            camera.startPreview();
        } catch (Exception e){
            Log.d(TAG, "Error starting camera preview: " + e.getMessage());
        }


    }

    private Camera.Size getBestPreviewSize(int i1, int i2, Camera.Parameters myParameters) {
        Camera.Size bestSize = null;
        // for all supported sizes
        for (Camera.Size size : myParameters.getSupportedPreviewSizes())
        {
        // if sizes fits the screen size
            if (size.width <= i1 && size.height <= i2)
            {
                // the first one found is automatically the best
                if (bestSize == null)
                {
                    bestSize = size;
                }
                else
                {
                    // check if this solution cover more area wrt the current best
                    int resultArea = bestSize.width * bestSize.height;
                    int newArea = size.width * size.height;
                    if (newArea > resultArea)
                    {
                        bestSize = size;
                    }
                }
            }
        }
        return bestSize;
    }

    @Override
    public void surfaceDestroyed(@NonNull SurfaceHolder surfaceHolder) {

    }
}
