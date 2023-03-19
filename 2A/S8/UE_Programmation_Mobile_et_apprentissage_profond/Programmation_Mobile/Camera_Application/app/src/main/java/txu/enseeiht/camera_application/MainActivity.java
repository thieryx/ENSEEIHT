package txu.enseeiht.camera_application;

import androidx.appcompat.app.AppCompatActivity;

import android.hardware.Camera;
import android.os.Bundle;
import android.view.SurfaceView;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    Button btn_take;
    SurfaceView camera_view;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn_take = findViewById(R.id.btn_take);
        camera_view = findViewById(R.id.camera_view);

        Camera.CameraInfo info = new Camera.CameraInfo();
        Camera.getCameraInfo(0, info);
    }

    public static int findBackFacingCamera() {
        int cameraId = -1;
        // get the number of the cameras available on the device
        int numberOfCameras = Camera.getNumberOfCameras();
        // check the info for each of them and the return the front one
        for(int i = 0; i< numberOfCameras; i++)
        {
            Camera.CameraInfo info = new Camera.CameraInfo();
            Camera.getCameraInfo(i, info);
            if(info.facing == Camera.CameraInfo.CAMERA_FACING_BACK)
            {
                cameraId = i;
                break;
            }
        }
        return cameraId;
    }
}